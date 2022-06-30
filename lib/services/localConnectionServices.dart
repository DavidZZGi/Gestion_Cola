
import 'package:line_management/model/Product.dart';
import 'package:line_management/model/client.dart';
import 'package:line_management/model/line.dart';
import 'package:line_management/model/shop.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
 class   ConnectionServices{

static Future<Database> getConennection()async{
WidgetsFlutterBinding.ensureInitialized();
// Open the database and store the reference.
final database = openDatabase(
  
  join(await getDatabasesPath(), 'ColaSqlite.db'),
  version: 1,
  onCreate: (db, version) {
    return crearBD(db);
           
   
  },
 
);
return database;
}

static void crearBD(Database db){
  db.execute('CREATE TABLE "cliente" ("ci"	TEXT,"nombre"	TEXT,"apellidos"	TEXT,"id_cliente"	INTEGER,PRIMARY KEY("id_cliente"))');
  db.execute('CREATE TABLE "cola" ("id"	INTEGER,"id_producto"	INTEGER,"id_persona"	INTEGER,"fecha"	TEXT,"id_municipio"	INTEGER,"id_tienda"	INTEGER,PRIMARY KEY("id"))');
  db.execute('CREATE TABLE "municipio" ("id"	INTEGER,"nombre"	TEXT,"id_provincia"	INTEGER,"poblacion"	INTEGER,"nombre_corto"	TEXT,PRIMARY KEY("id"));');
  db.execute('CREATE TABLE "tienda" ("id"	INTEGER,"nombre"	TEXT,"id_municipio"	INTEGER,"activa"	TEXT,PRIMARY KEY("id"));');
  db.execute('CREATE TABLE "producto" ("id"	INTEGER,"nombre"	TEXT,"id_tipo"	INTEGER,PRIMARY KEY("id"));');

 }



  Future<int> insertClient(Cliente cliente)async{
   
  Database database =await getConennection();
  var res = await database.rawInsert(
      "INSERT Into cliente (ci,nombre,apellidos,id_cliente)"
      " VALUES (${cliente.carnetIdentidad},${cliente.nombre},${cliente.apellidos},${cliente.idCliente})");
    return res;
}




Future<void>insertLine(Line line)async{
  DateTime fecha=DateTime.now();
List<int>idClientes=line.clients.map((e) => e.idCliente).toList();
List<int>idProductos=line.products.map((e) => e.id).toList();

Database database =await getConennection();
for (var i = 0; i < idClientes.length; i++) {
  for (var j = 0; j < idProductos.length; j++) {
     await database.rawInsert('INSERT INTO cola(id_producto,id_persona,fecha,id_municipio,id_tienda) VALUES(${idProductos[j]},${idClientes[i]},${fecha.toString()},${line.idMun},${line.idTienda}) ');
  }
}
 
}

Future<void>deleteLine(int id)async{
  Database database =await getConennection();
  database.delete(
      'cola',
      where: 'id=?',
      whereArgs: [id],
  );
}
Future<List<Line>> getLines() async {
  // Get a reference to the database.
  final db = await getConennection();

  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await db.query('cola',distinct: true);

  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
   List<Cliente>clientes= getClientesDadoId(maps[i]['id_cliente']) as List<Cliente>;
   List<Product>productos=getProductoDadoId(maps[i]['id_producto']) as List<Product>;
    return Line(
   clients: clientes,
   products: productos,
   idLine: maps[i]['id'],
   idMun: maps[i]['id_municipio'],
   idTienda: maps[i]['id_tienda'],
   date: maps[i]['fecha'],
    );
  });
}

Future<List<Cliente>>getClientesDadoId(int id)async{
  final db = await getConennection();
final List<Map<String, dynamic>>clientes  =await db.query('cliente',where: 'id_cliente=?',whereArgs: [id],distinct: true);
return List.generate(clientes.length, (i) {
   
    return Cliente(
   idCliente: clientes[i]['id_cliente'],
   apellidos: clientes[i]['apellidos'],
   carnetIdentidad: clientes[i]['ci'],
   nombre: clientes[i]['nombre']
    );
  });
}

Future<List<Product>>getProductoDadoId(int id)async{
  final db = await getConennection();
final List<Map<String, dynamic>>productos  =await db.query('producto',where: 'id=?',whereArgs: [id],distinct: true);
return List.generate(productos.length, (i) {
   
    return Product(productName: productos[i]['nombre'], id: productos[i]['id'],idTipo: productos[i]['id_tipo']);
  
    
  });
}

Future<List<Shop>>getTiendaDadoMun(int idMun)async{
 final db = await getConennection();
final List<Map<String, dynamic>>shops  =await db.query('tienda',where: 'id_municipio=?',whereArgs: [idMun],distinct: true);
return List.generate(shops.length, (i) {
   
    return Shop(
      name: shops[i]['nombre'], 
      id: shops[i]['id'], 
      activa: shops[i]['activa'], 
      idMunicipio:shops[i]['id_municipio']);
   
  });
}






/*
  // Define a function that inserts dogs into the database
  Future<void> insertDog(Dog dog) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<Dog>> dogs() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('dogs');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }

  Future<void> updateDog(Dog dog) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'dogs',
      dog.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [dog.id],
    );
  }

  Future<void> deleteDog(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'dogs',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  // Create a Dog and add it to the dogs table
  var fido = const Dog(
    id: 0,
    name: 'Fido',
    age: 35,
  );

  await insertDog(fido);

  // Now, use the method above to retrieve all the dogs.
  print(await dogs()); // Prints a list that include Fido.

  // Update Fido's age and save it to the database.
  fido = Dog(
    id: fido.id,
    name: fido.name,
    age: fido.age + 7,
  );
  await updateDog(fido);

  // Print the updated results.
  print(await dogs()); // Prints Fido with age 42.

  // Delete Fido from the database.
  await deleteDog(fido.id);

  // Print the list of dogs (empty).
  print(await dogs());
}
*/
 }
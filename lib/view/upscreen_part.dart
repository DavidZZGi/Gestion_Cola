import 'package:flutter/material.dart';


// ignore: must_be_immutable
class UpScreenPart extends StatelessWidget {
    String estado='Sincronizado';
    DateTime time=DateTime.now();


  @override
  Widget build(BuildContext context) {
    return OverflowBox(
   child: Container(
     decoration: BoxDecoration(
       gradient: LinearGradient(
           begin: Alignment.centerLeft,
           end:Alignment.centerRight,
           colors: [
               
               Colors.blue.shade100,
               Colors.blue.shade400
           ]

       )
     ),
     width: double.infinity,
     height: double.infinity,
      
     
        child: 
            Row(
                 
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                 ElevatedButton(
          child: Icon(Icons.upload,
          color: Colors.white,
          
          ),
            
          
          onPressed: () {},
          style: ElevatedButton.styleFrom(
                fixedSize: const Size(60, 60),
                shape: const CircleBorder(), 
          ),
),
                
                  
                Center(
                  child: Text(
                    'Cubacola',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.white,
                      ),
                  ),
                ),
                ElevatedButton(
          child: Icon(Icons.download,
          color: Colors.white,
          
          ),
            
          
          onPressed: () {},
          style: ElevatedButton.styleFrom(
                fixedSize: const Size(60, 60),
                shape: const CircleBorder(), 
          ),
),
            ],
          ),
             ),
     ); 
           
          

             

         
           
      
      
   
    
    
  }
}
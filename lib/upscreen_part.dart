import 'package:flutter/material.dart';


class UpScreenPart extends StatelessWidget {
    String estado='Sincronizado';
    DateTime time=DateTime.now();


  @override
  Widget build(BuildContext context) {
    return OverflowBox(
   child: Container(
     width: double.infinity,
     height: 100,
      padding: EdgeInsets.all(32.0),
      color: Colors.white38,
        child: 
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
          Text(
            'Cola.cu',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: Colors.black,
              ),
          ),

            Column(
              
             children: [
               Text(
                 '$estado',
                 style: TextStyle(
                   color: Colors.grey

                 ),
                
               ),
                Padding(
                  padding: const EdgeInsets.only(bottom:4),
                  child: Text(
                    '${time.toString()}',
                    style: TextStyle(
                      color: Colors.black
                    ),
                  ),
                )
             ],

            )

           ],)

         
           
      
      
      ),

    );
    
  }
}
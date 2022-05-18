import 'package:flutter/material.dart';


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
               
               Colors.blueGrey,
               Color.fromRGBO(14, 30, 50, 1.7)
           ]

       )
     ),
     width: double.infinity,
     height: double.infinity,
      padding: EdgeInsets.all(20.0),
     
        child: 
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
          Text(
            'Cola.cu',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: Colors.white38,
              ),
          ),

            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(6, 45, 6, 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                      ),
                    
                 ],
            
                ),
              ),
            )

           ],)

         
           
      
      
      ),

    );
    
  }
}
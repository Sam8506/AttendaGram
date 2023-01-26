// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TakeA extends StatefulWidget {
  const TakeA({Key? key}) : super(key: key);

  @override
  _TakeAState createState() => _TakeAState();
}

class _TakeAState extends State<TakeA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faculty Access',
        style:TextStyle(
          fontFamily: GoogleFonts.lobster().fontFamily,
          letterSpacing: 3.5,
        ) ,
        ),
        leading:  IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
           icon: Icon(Icons.arrow_back_ios_new_outlined)
          ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: Icon(Icons.power_settings_new_rounded),
                          content: Container(
                            width: 100,
                            height: 100,
                            child: Column(children: [
                              Text("Do You want to Sign Out?"),
                              SizedBox(height: 30),
                              Row(children: [
                                Expanded(
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, false);
                                      },
                                      child: Text('CANCEL')),
                                ),
                                Expanded(
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacementNamed(
                                              context, '/');
                                        },
                                        child: Text('OK'))),
                              ]),
                            ]),
                          ),
                        ));
              },
              icon: Icon(Icons.power_settings_new_sharp))
        ],
        backgroundColor: Colors.deepPurple,
      ),
      body:
      
       Column(
        
        children: <Widget>[
           Padding(
            padding: const EdgeInsets.all(40),
            child: Text(
              'Faculty Controls',
              style: TextStyle(
                  fontSize: 44,
                  fontFamily: GoogleFonts.dancingScript().fontFamily,
                  fontWeight: FontWeight.bold
                  ),
            ),
          ),


          Image.asset(
            "assets/image/loginPhoto6.png",
            //color: Colors.blue,
            height: 300,
            scale: 1.0,
          ),
         
          
             Padding(
               padding: EdgeInsets.all(25),
               child: ElevatedButton.icon(
                  onPressed: () async {
                    Navigator.pushNamed(context, '/an');
                  },
                  icon: Icon(Icons.add_to_photos_outlined),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ))
                  ),
                  label: Padding(
                    padding: EdgeInsets.fromLTRB(14, 10, 10, 10),
                    child: Text('Add New Class',
                    style: TextStyle(
                      letterSpacing: 1.5,
                      color: Colors.white,
                      fontFamily: GoogleFonts.lancelot().fontFamily,
                      fontSize: 22.0,
                      fontWeight:FontWeight.bold
                    ),
                    ),
                  )),
             ),
          
      
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    Navigator.pushNamed(context, '/lst');
                  }
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ))
                ),
                label:Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Take Attendance',
                  style: TextStyle(
                    fontFamily: GoogleFonts.lancelot().fontFamily,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  ),
                ), 
                icon: Icon(Icons.how_to_reg,
                size: 35.0,
                ),
                ),
          
        
        ],
      ),
      backgroundColor: Colors.lightBlue[50],
    );
  }
}

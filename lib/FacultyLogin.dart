// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:sgp/backend/flute.dart';
import 'package:google_fonts/google_fonts.dart';

class faculty_login extends StatefulWidget {
  @override
  _faculty_loginState createState() => _faculty_loginState();
}

class _faculty_loginState extends State<faculty_login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
         leading:  IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
           icon: Icon(Icons.arrow_back_ios_new_outlined)
          ),
        backgroundColor: Colors.deepPurple,
        title: Text(
            "Faculty Login",
            style: TextStyle(
              fontFamily: GoogleFonts.lobster().fontFamily,
              letterSpacing: 3.5,
              fontSize: 23
            ),
          ),          
        
      ),
      body:  SingleChildScrollView(      
      
      child: Column(
          
        children: <Widget>[
          Padding(
          
            padding: EdgeInsets.fromLTRB(16.0, 25.0, 16.0, 0),
            child: Center(
              child: Text(
                "Attendagram",
                style: TextStyle(
                    fontFamily: GoogleFonts.alexBrush().fontFamily,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple[800]
                    ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        Image.asset(
          "assets/image/loginPhoto2.png",
          height: 266.5,
          width: 350.0,
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person,color: Colors.deepPurple,),
                  labelText: 'User Name',
                  hintText: 'example@faculty.edu.in',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ))),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              controller: passController,
              
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock,color: Colors.deepPurple,),
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ))),
              obscureText: true,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton.icon(
            onPressed: () async {
            bool shouldNavigate= await signIn(nameController.text, passController.text);
            int length = passController.text.length;
             if(shouldNavigate && length == 8)
             {
               Navigator.pushNamed(context, '/takea');
             }             
             else{
               showDialog(
                 context: context, builder: (ctx)=>AlertDialog(
                   title: Icon(Icons.error),
                   content: SizedBox(
                  
                     height: 90,
                     width: 85,
                     child: Column(children:[
                        Text('Wrong Credetntial',
                        style: TextStyle(
                              letterSpacing: 3.2,
                                fontFamily: GoogleFonts.mogra().fontFamily,
                                fontSize: 18.0,
                                color: Colors.black
                              ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                     Row(children: [
                          Expanded(
                                child:ElevatedButton(
                                style: ButtonStyle(
              //backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
            ),
                                      onPressed: () { 
                                        Navigator.pop(context,true);
                                       },
                                      child: Text('Retry',
                                      
                                      style: TextStyle(
                                        color:Colors.white,
                                fontFamily: GoogleFonts.mogra().fontFamily,
                                fontSize: 22.0,
                                
                              ),
                                      ),
                                      
                                    )
                                ),
                                ]),
                     
                     
                     ]),
                   ),
                   
                   
                   
                 )
                 );
             }
            },
            icon: Icon(Icons.login),
            label: Text(
              "Log in",
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          
        ],
      ),
      
    )
    
    );
  }
}

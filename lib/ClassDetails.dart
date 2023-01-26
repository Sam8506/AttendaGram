// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class newSub extends StatefulWidget {
  const newSub({Key? key}) : super(key: key);

  @override
  State<newSub> createState() => _newSubState();
}

class _newSubState extends State<newSub> {
  
  @override
  Widget build(BuildContext context) {
    TextEditingController subName = TextEditingController();
    TextEditingController irollNo = TextEditingController();
    TextEditingController lrollNo = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[500],
        title: Text('Add Class',
        style: TextStyle(
          fontFamily: GoogleFonts.lobster().fontFamily,
          letterSpacing: 3.5,
        ),
        ),
        leading:  IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
           icon: Icon(Icons.arrow_back_ios_new_outlined)
          ),
        
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add_task,
              size: 26,
              ), 
               onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        backgroundColor: Colors.lightBlue[50],
                            title: Icon(Icons.library_add_check_rounded),
                            content: SizedBox(
                            
                            width: 100,
                            height: 100,
                            child: Column(children: [
                              Text("Class Added Successfully",
                              style: TextStyle(
                                fontFamily: GoogleFonts.mogra().fontFamily,
                                fontSize: 18.0,
                                color: Colors.black
                              ),
                              ),
                              SizedBox(height: 20),
                              Row(children: [
                                Expanded(
                                  child:TextButton(
                                    onPressed: () { 
                                      Navigator.pop(context,true);
                                     },
                                    child: Text('OK',
                                    style: TextStyle(
                                      fontFamily: GoogleFonts.mogra().fontFamily,
                                      fontSize: 20,
                                      color: Colors.black,
                                      //backgroundColor: Colors.lightBlue
                                    ),
                                    ),
                                    
                                  )
                              ),
                              ]),
                            ]),
                          ),
                          ));
                },
          )
        ],
      ),
      body: 
            
      SingleChildScrollView(
        
        child: Column(
          
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Text(
                'Class Details ',
                style: TextStyle(
                    fontFamily: GoogleFonts.dancingScript().fontFamily,
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 0),
            Image.asset(
              'assets/image/loginPhoto6.png'
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15,0,0,0),
                    child: Text(
                      'SUBJECT : ',
                      style: TextStyle(
                        fontFamily: GoogleFonts.mogra().fontFamily,
                        //fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: subName,
                      decoration: InputDecoration(
                        hintText: 'Enter Subject Name',
                        labelText: 'Subject Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25))),
                    ),
                  ),
                  SizedBox(width: 50),
                ],
              ),
            ),
            SizedBox(height: 30),
            // Row(
            //   children: <Widget>[
            //     Padding(
            //       padding: const EdgeInsets.only(left: 5),
            //       child: Text(
            //         'TYPE : ',
            //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            //       ),
            //     ),
            //     Radio(value: 1, groupValue: selectedRadio, onChanged: (value) {}),
            //     Text('LECTURE'),
            //     SizedBox(width: 30.0),
            //     Radio(value: 2, groupValue: selectedRadio, onChanged: (value) {}),
            //     Text('LAB')
            //   ],
            // ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: Row(
                children: [
                  Padding(
                    padding:  const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Text(
                      'ROLL NO : ',
                      style: TextStyle(
                        fontFamily: GoogleFonts.mogra().fontFamily,
                        //fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                  //   child: Text(
                  //     'From',
                  //     style: TextStyle(
                  //       fontSize: 20,
                  //     ),
                  //   ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextField(
                      controller: irollNo,
                      decoration: InputDecoration(
                          hintText: 'First',
                          labelText: 'From',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25))
                              ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                    child: Text(
                       ' - ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: lrollNo,
                      decoration: InputDecoration(
                          hintText: 'Last',
                          labelText: 'To ',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25))),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // ElevatedButton.icon(
            //     onPressed: () {
            //       showDialog(
            //           context: context,
            //           builder: (ctx) => AlertDialog(
            //                 title: Icon(Icons.add_task),
            //                 content: Text(" New Subject is added sucessfully"),
            //               ));
            //     },
            //     icon: Icon(Icons.add),
            //     label: Text('ADD')),
          ],
        ),
      
      ),
    );
  }
}

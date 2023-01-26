// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class lstP extends StatefulWidget {
  const lstP({Key? key}) : super(key: key);

  @override
  State<lstP> createState() => _lstPState();
}

class _lstPState extends State<lstP> {
  bool val = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Sheet',
        style: TextStyle(
          fontFamily: GoogleFonts.lobster().fontFamily,
          letterSpacing: 3.5
        ),
        ),
        leading:  IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
           icon: Icon(Icons.arrow_back_ios_new_outlined)
          ),
        backgroundColor: Colors.deepPurple[700],
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.calendar_month,
              size: 28,
              ), onPressed: () { 
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2018),
                        lastDate: DateTime(2023))
                    .then((date) {
                });
                
               },
          )
        ],
      ),
      body: Column(children: [
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('user').orderBy('ID').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );

              return ListView(
                children: snapshot.data!.docs.map((document) {
                  return Card(
                    child: CheckboxListTile(
                      value: val,
                      onChanged: (val) {
                        setState(() {
                          val = !val!;
                        });
                      },
                      title: Text(document['ID']),
                      subtitle: Text(document['name']),
                      tileColor: Colors.blue[50],
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
        ElevatedButton.icon(
          style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ))
                ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                      title: Icon(Icons.assignment_turned_in),
                      content: Text('Attendance Taken Sucessfully !'),
                    ));
          },
          icon: Icon(Icons.how_to_reg,
                size: 30.0,
                ),
          label: Text(
            "Take Attendance",
             style: TextStyle(
                    fontFamily: GoogleFonts.lancelot().fontFamily,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
          ),
          
         
        ),
      ]),
    );
  }
}

// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, curly_braces_in_flow_control_structures, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_types_as_parameter_names, prefer_is_empty, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sgp/drawer.dart';

class getuserName extends StatefulWidget {
  @override
  State<getuserName> createState() => _getuserNameState();
}

class _getuserNameState extends State<getuserName> {
  String DocumentID = FirebaseAuth.instance.currentUser!.uid;
  num abc = 0;
  ScrollController ScCont = ScrollController();

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('user');

    return Scaffold(
      //drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Statistics',
         style: TextStyle(
          fontFamily: GoogleFonts.lobster().fontFamily,
          letterSpacing: 3.5,
        ),
        ),
        backgroundColor: Colors.deepPurple[700],
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: Icon(Icons.power_settings_new_rounded),
                          content: SizedBox(
                            width: 100,
                            height: 100,
                            child: Column(children: [
                              Text("Do You want to Log Out?",
                              style: TextStyle(
                             
                                fontFamily: GoogleFonts.mogra().fontFamily,
                                fontSize: 18.0,
                                color: Colors.black
                              ),
                              ),
                              SizedBox(height: 30),
                              Row(children: [
                                Expanded(
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context, false);
                                      },
                                      child: Text('CANCEL')),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: ElevatedButton(
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
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 30),
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    'NAME',
                    style: TextStyle(color: Colors.black, letterSpacing: 1.0),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'ID',
                  style: TextStyle(color: Colors.black, letterSpacing: 1.0),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              Expanded(
                child: FutureBuilder<DocumentSnapshot>(
                  future: users.doc(DocumentID.toString()).get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) return Text("Something went wrong");

                    if (snapshot.hasData && !snapshot.data!.exists)
                      return Text('Data does not exist');

                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      return Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "${data['name']} ",
                          style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                              fontSize: 20.0),
                        ),
                      );
                    }

                    return Text("loading");
                  },
                ),
              ),
              Expanded(
                child: FutureBuilder<DocumentSnapshot>(
                  future: users.doc(DocumentID.toString()).get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) return Text("Something went wrong");

                    if (snapshot.hasData && !snapshot.data!.exists)
                      return Text('Data does not exist');

                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      return Text(
                        "${data['ID']}",
                        style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            fontSize: 20.0),
                      );
                    }

                    return Text("loading");
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    'PROGRAM',
                    style: TextStyle(color: Colors.black, letterSpacing: 1.0),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'CURRENT SEMESTER',
                  style: TextStyle(color: Colors.black, letterSpacing: 1.0),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    'IT',
                    style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        fontSize: 20.0),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '6',
                  style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      fontSize: 20.0),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Divider(color: Colors.black),
          SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.deepPurpleAccent,
                  height: 35,
                  child: Center(
                    child: Text(
                      'ATTENDANCE SUMMARY',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 30,
                  color: Colors.deepPurpleAccent,
                  child: Center(
                    child: Text(
                      'Subject',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              VerticalDivider(
                width: 5,
              ),
              Expanded(
                child: Container(
                  height: 30,
                  color: Colors.deepPurpleAccent,
                  child: Center(
                    child: Text(
                      'Attended',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              VerticalDivider(
                width: 5,
              ),
              Expanded(
                child: Container(
                  height: 30,
                  color: Colors.deepPurpleAccent,
                  child: Center(
                    child: Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              VerticalDivider(
                width: 5,
              ),
              Expanded(
                child: Container(
                  height: 30,
                  color: Colors.deepPurpleAccent,
                  child: Center(
                    child: Text(
                      'Percent(%)',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('user')
                  .doc(DocumentID)
                  .collection('subject')
                  .snapshots(),
              builder: (BuildContext,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Text('Please Wait');

                if (snapshot.hasData) {
                  if (snapshot.data!.docs.length == 0) {
                    return Center(
                      child: Text("No data Found"),
                    );
                  } else {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        controller: ScCont,
                        physics: ScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          String sname =
                              snapshot.data!.docs.elementAt(index).get('Sname');
                          int dbAtt =
                              snapshot.data!.docs.elementAt(index).get('Att');
                          int dbTot =
                              snapshot.data!.docs.elementAt(index).get('Tot');
                              abc = dbAtt * 100 / dbTot;
                          for(int i=0;i<4;i++){
                           abc = abc+(dbAtt * 100 / dbTot);

                          }
                          
                          return Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Center(
                                        child: Text(sname,
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.black)))),
                                Expanded(
                                    child: Center(
                                        child: Text(dbAtt.toString(),
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.black)))),
                                Expanded(
                                    child: Center(
                                        child: Text(dbTot.toString(),
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.black)))),
                                Expanded(
                                    child: Center(
                                        child: Text(
                                            (dbAtt * 100 / dbTot)
                                                .toStringAsFixed(2),
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.black)))),
                              ],
                            ),
                          );
                        });
                  }
                } else {
                  return Center(
                    child: Text("Getting Error"),
                  );
                }
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                'Overall Attendance : 0.0% ',
                style: TextStyle(
                  fontFamily: GoogleFonts.mogra().fontFamily,
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';


class MyDrawer extends StatefulWidget {
  const MyDrawer({ Key? key }) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String DocumentID = FirebaseAuth.instance.currentUser!.uid;
  //var email= "20dce084@charusat.edu.in"; 
  resetPassword() async
  {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: "20dce090@charusat.edu.in");
      showDialog(
      
                context: context,
                builder: (ctx) => AlertDialog(
                  backgroundColor: Colors.lightBlue[50],
                  title: Text("Request Sent"),
                  content: Text("Check Your Mail!, And Reset Your Password"),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text("Okay"),
                    ),
                  ],
                ),
              );
    }on FirebaseAuthException  catch(e){
      if(e.code == 'user-not-found'){
        print("No user Found");
    }

    }
  }

  @override
  Widget build(BuildContext context) {
    const String imageUrl =  "https://i.pinimg.com/originals/8b/16/7a/8b167af653c2399dd93b952a48740620.jpg";
      CollectionReference users = FirebaseFirestore.instance.collection('user');
    return  Drawer(
      
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children:[
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                
                margin: EdgeInsets.zero,
                accountName: FutureBuilder<DocumentSnapshot>(
                  future: users.doc(DocumentID.toString()).get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) return Text("Something went wrong");

                    if (snapshot.hasData && !snapshot.data!.exists)
                      return  Text('Data does not exist');

                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      return Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Text(
                          "${data['name']} ",
                          style:TextStyle(
                            fontFamily: GoogleFonts.lobster().fontFamily,
                              color: Colors.white,
                              //fontWeight: FontWeight.bold,
                              letterSpacing: 2.5,
                             fontSize: 22.0
                            ),
                        ),
                      );
                    }

                    return Text("loading");
                  },
                ),
                 accountEmail: FutureBuilder<DocumentSnapshot>(
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
                        padding: EdgeInsets.only(left: 0),
                        child: Text(
                          "${data['ID']}@charusat.edu.in",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              letterSpacing: 1.0,
                            ),
                        ),
                      );
                    }

                    return Text("loading");
                  },
                ),
                 currentAccountPicture: CircleAvatar(
                   backgroundImage: NetworkImage(imageUrl),
             )//Image.network(imageUrl),
              )
              
              ),

               ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,color: Colors.white,
                  ),
                  onTap: (){
                     showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text("Student Information"),
                  content: FutureBuilder<DocumentSnapshot>(
                  future: users.doc(DocumentID.toString()).get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) return Text("Something went wrong");

                    if (snapshot.hasData && !snapshot.data!.exists)
                      return  Text('Data does not exist');

                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      return Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Text(
                          "Name: ${data['name']}"+"\nMobile No: ${data['mono']}" +"\nBirth Date: ${data['DOB']}" + "\nBlood Group: ${data['bg']}",
                          style:TextStyle(
                              //color: Colors.deepPurpleAccent,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                             // fontSize: 20.0
                            ),
                        ),
                      );
                    }

                    return Text("loading");
                  },
                ),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text("Okay"),
                    ),
                  ],
                ),
              );
             },
                title:  Text(
                  "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
                ),
              ),

                ListTile(
                leading: Icon(
                  CupertinoIcons.chat_bubble_2,color: Colors.white,
                  ),
                  onTap: (){
                 showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text("Counsellor Information"),
                  content: Text("Name: Janardan Bharvad" + "\nContact No: 90336 31127\nEmail: jb@faculty.edu.in",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text("Okay"),
                    ),
                  ],
                ),
              );
                  },
                title:  Text("Contact Faculty",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
                ),
                
               ),
               ListTile(
                leading: Icon(CupertinoIcons.refresh_circled,color: Colors.white,),
                title:  Text("Reset Password",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white)
                ),
                onTap: (){
                  resetPassword();
                  },
                
               
              ),
               ListTile(
                leading: Icon(CupertinoIcons.info_circle,color: Colors.white,),
                title:  Text("About Us",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
                ),
                onTap: (){
                 showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text("About Us"),
                  content: Text("Email: info.attendagram@gmail.com\nVersion 1.0.0",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text("Okay"),
                    ),
                  ],
                ),
              );
                  }
              ),
              
          ],
        ),
      ),
      
    );
  }
}
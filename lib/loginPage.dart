import 'package:coffee_order/main.dart';
import 'package:coffee_order/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'AllWidgets/progress_dialog.dart';
import 'mainCoffeePage.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        //width: MediaQuery.of(context).size.width * 0.75,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 60),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Hello Again!',
                      style: GoogleFonts.playfairDisplay(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF473D3A)),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Welcome',
                      style: GoogleFonts.playfairDisplay(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF473D3A)),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'back',
                      style: GoogleFonts.playfairDisplay(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF473D3A)),
                    ),
                  ]),
              SizedBox(height: 15),
              Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 5,
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 7,
                                offset: Offset(0, 9))
                          ]),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        style: GoogleFonts.poppins(
                            color: Colors.grey[700], fontSize: 10),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Email',
                          hintStyle: GoogleFonts.nunito(
                              fontSize: 12,
                              color: Colors.grey.withOpacity(0.8)),
                          contentPadding: EdgeInsets.all(15),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 7,
                                offset: Offset(0, 9))
                          ]),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        controller: _passwordController,
                        style: GoogleFonts.poppins(
                            color: Colors.grey[700], fontSize: 10),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Password',
                          hintStyle: GoogleFonts.nunito(
                              fontSize: 12,
                              color: Colors.grey.withOpacity(0.8)),
                          contentPadding: EdgeInsets.all(15),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: ElevatedButton(
                          onPressed: () {
                            _signIn(context);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                            primary: Color(0xFF473D3A),
                            textStyle: GoogleFonts.nunito(
                                fontSize: 12, color: Colors.white),
                            padding: EdgeInsets.all(10),
                          ),
                          child: Text('Sign In')),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                textStyle: GoogleFonts.lato(
                                    fontSize: 10, color: Color(0xFF473D3A))),
                            child: Text('Forgot Your Password?',
                                style: GoogleFonts.lato(
                                    fontSize: 10, color: Color(0xFF473D3A))),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => signupPage()));
                            },
                            style: TextButton.styleFrom(
                                textStyle: GoogleFonts.lato(
                                    fontSize: 10, color: Color(0xFF473D3A))),
                            child: Text('Sign Up',
                                style: GoogleFonts.lato(
                                    fontSize: 10, color: Color(0xFF473D3A))),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]),
      ),
    ));
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _signIn(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return progressDialog(message: "Authenticating, Please wait...");
        });

    final User firebaseUser = (await _auth
            .signInWithEmailAndPassword(
                email: _emailController.text.trim(),
                password: _passwordController.text.trim())
            .catchError((errMsg) {
      Navigator.pop(context);
      displayToastMessage("Error: " + errMsg.toString(), context);
    }))
        .user;

    if (firebaseUser != null) {
      usersRef.child(firebaseUser.uid).once().then((DataSnapshot snap) {
        if (snap.value != null) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => mainCoffeePage()));
          displayToastMessage('You are logged in now', context);
        } else {
          Navigator.pop(context);
          _auth.signOut();
          displayToastMessage(
              'No record exists for this user.  Please create new account',
              context);
        }
      });
    } else {
      Navigator.pop(context);
      displayToastMessage("Error Occured, can not be signed-in", context);
    }
  }

  void displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}

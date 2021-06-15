import 'package:coffee_order/mainCoffeePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'AllWidgets/progress_dialog.dart';
import 'loginPage.dart';
import 'main.dart';

class signupPage extends StatefulWidget {
  @override
  _signupPageState createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  TextEditingController _nameController = new TextEditingController();
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
                      'Hello!',
                      style: GoogleFonts.playfairDisplay(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF473D3A)),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Signup to',
                      style: GoogleFonts.playfairDisplay(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF473D3A)),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'get started',
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
                        //keyboardType: TextInputType.emailAddress,
                        controller: _nameController,
                        style: GoogleFonts.poppins(
                            color: Colors.grey[700], fontSize: 10),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Full Name',
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
                            _register(context);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0)),
                            primary: Color(0xFF473D3A),
                            textStyle: GoogleFonts.nunito(
                                fontSize: 12, color: Colors.white),
                            padding: EdgeInsets.all(8.0),
                          ),
                          child: Text('Signup')),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => loginPage()));
                      },
                      style: TextButton.styleFrom(
                          textStyle: GoogleFonts.lato(
                              fontSize: 10, color: Color(0xFF473D3A))),
                      child: Text('Already Have An Account? Sign In',
                          style: GoogleFonts.lato(
                              fontSize: 10, color: Color(0xFF473D3A))),
                    ),
                  ],
                ),
              )
            ]),
      ),
    ));
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _register(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return progressDialog(message: "Signing Up, Please wait...");
        });

    final User firebaseUser = (await _auth
            .createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )
            .catchError((errMsg) {
      Navigator.pop(context);
      displayToastMessage("Error: " + errMsg.toString(), context);
    }))
        .user;

    if (firebaseUser != null) {
      //save user info to db
      Map userDataMap = {
        "name": _nameController.text.trim(),
        "email": _emailController.text.trim(),
        "password": _passwordController.text.trim()
      };

      usersRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage(
          "Congratulations, your account was successfully created.", context);

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => mainCoffeePage()));
    } else {
      Navigator.pop(context);
      displayToastMessage("User account has not being created.", context);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}

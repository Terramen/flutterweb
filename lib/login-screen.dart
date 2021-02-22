import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterweb/jsonparse/jsonParse.dart';
import 'package:flutterweb/models/user-details.dart';
import 'jsonparse/services.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'models/users.dart';

class LoginPage extends StatefulWidget {
  LoginPage() : super();

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  Users user = Users();

  String url = 'http://192.168.43.141:8080/login2';
  Future save() async {
    var res = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        // body: json.encode({'email': user.email, 'password': user.password})
        body: json.encode({"email": user.email, "password": user.password}));
    print(user.email);
    print(user.password);
    UserDetails userDetails = userDetailsFromJson(res.body);
    print(res.body);
    Services.setCurrentUser(userDetails.id);
    if (res.body.isNotEmpty && user.password == userDetails.password) {
      Navigator.pushReplacementNamed(context, '/b');
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: Text("Gas-Station"),
  //       ),
  //       body: Form(
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             Container(
  //               padding: EdgeInsets.fromLTRB(20, 35, 20, 0),
  //               child: TextFormField(
  //                 validator: (value) {
  //                   if (value.isEmpty) {
  //                     return 'Email is Empty';
  //                   }
  //                   return '';
  //                 },
  //                 controller: TextEditingController(text: user.email),
  //                 onChanged: (val) {
  //                   user.email = val;
  //                   //print(val);
  //                 },
  //                 decoration: InputDecoration(
  //                     labelStyle: TextStyle(
  //                         fontWeight: FontWeight.bold, color: Colors.blue),
  //                     labelText: 'EMAIL'),
  //               ),
  //             ),
  //             Container(
  //               padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
  //               child: TextFormField(
  //                 validator: (value) {
  //                   if (value.isEmpty) {
  //                     return 'Password is Empty';
  //                   }
  //                   return '';
  //                 },
  //                 controller: TextEditingController(text: user.password),
  //                 onChanged: (val) {
  //                   user.password = val;
  //                   //print(val);
  //                 },
  //                 decoration: InputDecoration(
  //                     labelStyle: TextStyle(
  //                         fontWeight: FontWeight.bold, color: Colors.blue),
  //                     labelText: 'PASSWORD'),
  //               ),
  //             ),
  //             Container(
  //               padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
  //               child: InkWell(
  //                 child: Text(
  //                   'Forgot Password?',
  //                   style: TextStyle(
  //                       color: Colors.blue,
  //                       decoration: TextDecoration.underline),
  //                 ),
  //               ),
  //             ),
  //             // Container(
  //             //   padding: EdgeInsets.fromLTRB(125, 15, 20, 0),
  //             //   child: RaisedButton(
  //             //     onPressed: () {},
  //             //     textColor: Colors.white,
  //             //     padding: EdgeInsets.all(0.0),
  //             //     child: Container(
  //             //       decoration: BoxDecoration(
  //             //         color: Colors.blue,
  //             //       ),
  //             //       padding: EdgeInsets.all(15.0),
  //             //       child: Text('Войти', style: TextStyle(fontSize: 20)),
  //             //     ),
  //             //   ),
  //             // ),
  //             Container(
  //               padding: EdgeInsets.fromLTRB(125, 15, 20, 0),
  //               child: RaisedButton(
  //                 onPressed: () {
  //                   if (formKey.currentState.validate()) {
  //                     save();
  //                   }
  //                   Navigator.pushReplacementNamed(context, '/a');
  //                 },
  //                 color: Colors.blue,
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(10.0),
  //                 ),
  //                 textColor: Colors.white,
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: Container(
  //                   padding: const EdgeInsets.all(10.0),
  //                   child: const Text('Войти', style: TextStyle(fontSize: 20)),
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //       )
  //       // body: Container(
  //       //   child: TextField(
  //       //     decoration: InputDecoration(
  //       //         labelStyle:
  //       //             TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
  //       //         labelText: 'EMAIL'),
  //       //   ),
  //       // ),
  //       );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  height: 750,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 65, 82, 1),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 5))
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Text("Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Colors.white,
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Email",
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Color.fromRGBO(255, 255, 255, 0.8),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: TextEditingController(text: user.email),
                          onChanged: (val) {
                            user.email = val;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Password is Empty';
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: 30, color: Colors.white),
                          decoration: InputDecoration(
                              errorStyle:
                                  TextStyle(fontSize: 20, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                        Container(
                          height: 8,
                          color: Color.fromRGBO(255, 255, 255, 0.4),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Password",
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Color.fromRGBO(255, 255, 255, 0.8),
                            ),
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          controller:
                              TextEditingController(text: user.password),
                          onChanged: (val) {
                            user.password = val;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Email is Empty';
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: 30, color: Colors.white),
                          decoration: InputDecoration(
                              errorStyle:
                                  TextStyle(fontSize: 20, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                        Container(
                          height: 8,
                          color: Color.fromRGBO(255, 255, 255, 0.4),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      //builder: (context) => Register()
                                      ));
                            },
                            child: Text(
                              "Dont have Account ?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 90,
                  width: 90,
                  child: FlatButton(
                      color: Color.fromRGBO(233, 65, 82, 1),
                      onPressed: () {
                        // if (formKey.currentState.validate()) {
                        save();
                        // }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 30,
                      )),
                )
              ],
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'register.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import '../models/user_model.dart';
import 'show_service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Explcit
  String emailString, passwordString;

  // Key
  final formKey = GlobalKey<FormState>();
  final homeScaffoldKey = GlobalKey<ScaffoldState>();

  // Logo
  Widget showLogo() {
    return Image.asset('images/logo.png');
  }

  // App Name
  Widget showText() {
    return Text(
      'Tonk Poy Authen',
      style: TextStyle(
          fontFamily: 'GermaniaOne',
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.red[900]),
    );
  }

  // Email TextField
  Widget emailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.white),
          labelText: 'Email Address:',
          hintText: 'you@email.com'),
      validator: (String value) {
        if (!value.contains('@')) {
          return 'Please Type Email in Format you@email.com';
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
    );
  }

  // Password TextField
  Widget passwordTextField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'Password:',
          hintText: 'more 6 Charator',
          labelStyle: TextStyle(color: Colors.white)),
      validator: (String value) {
        if (value.length <= 5) {
          return 'Please Type Password more 6 Charator';
        }
      },
      onSaved: (String value) {
        passwordString = value;
      },
    );
  }

  // Button SignIn
  Widget signInButton(BuildContext context) {
    return RaisedButton(
      color: Colors.red[600],
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        checkEmailAndPass(context);
      },
    );
  }

  void checkEmailAndPass(BuildContext context) async {
    print('You Click SignIn');
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print('email => $emailString, pass => $passwordString');
      String urlString =
          'https://www.androidthai.in.th/poy/getDataWhereEmailMaster.php?isAdd=true&Email=$emailString';

      var response = await get(urlString);
      var result = json.decode(response.body);
      print('result => $result');

      if (result.toString() == 'null') {
        showSnakeBar('User False Please TryAgain');
      } else {
        // Have Json

        for (var data in result) {
          var userModel = UserModel.fromJson(data);

          String truePass = userModel.password.toString();
          String nameReable = userModel.name.toString();

          if (passwordString == truePass) {
            showSnakeBar('Welcome $nameReable');

            var serviceRoute = new MaterialPageRoute(
                builder: (BuildContext context) => ShowService(loginString: nameReable,));
                Navigator.of(context).push(serviceRoute);
          } else {
            showSnakeBar("Password False");
          }
        }
      }
    }
  }

  void showSnakeBar(String messageString) {
    final snackBar = new SnackBar(
      content: Text(messageString),
    );
    homeScaffoldKey.currentState.showSnackBar(snackBar);
  }

  // Button SignUp
  Widget singUpButton(BuildContext context) {
    return RaisedButton(
      color: Colors.yellow,
      child: Text('Sign Up'),
      onPressed: () {
        print('You Click SignUp');
        var registerRoute = new MaterialPageRoute(
            builder: (BuildContext context) => Register());
        Navigator.of(context).push(registerRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: Form(
          key: formKey,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue[900], Colors.blue[50]],
                    begin: Alignment(-1, -1))),
            padding: EdgeInsets.only(top: 60.0),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                showLogo(),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: showText(),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: emailTextField(),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: passwordTextField(),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: Row(
                    children: <Widget>[
                      new Expanded(
                        child: signInButton(context),
                      ),
                      new Expanded(
                        child: singUpButton(context),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

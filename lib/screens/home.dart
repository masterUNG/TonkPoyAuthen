import 'package:flutter/material.dart';
import 'register.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    );
  }

  // Password TextField
  Widget passwordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password:',
          hintText: 'more 6 Charator',
          labelStyle: TextStyle(color: Colors.white)),
    );
  }

  // Button SignIn
  Widget signInButton() {
    return RaisedButton(
      color: Colors.red[600],
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        print('You Click SignIN');
      },
    );
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
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue[700], Colors.blue[50]],
              begin: Alignment(-1, -1))),
      padding: EdgeInsets.only(top: 30.0),
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
                  child: signInButton(),
                ),
                new Expanded(
                  child: singUpButton(context),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

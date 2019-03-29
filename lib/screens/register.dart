import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit
  String nameString, emailString, passwordString;

  // Key
  final formKey = GlobalKey<FormState>();

  // Name
  Widget nameTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Name :', hintText: 'Type Your Name'),
      validator: (String value) {
        if (value.length == 0) {
          return 'Please Type Name ?';
        }
      },
      onSaved: (String value) {
        nameString = value;
      },
    );
  }

  // Email
  Widget emailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email Address :', hintText: 'you@email.com'),
      validator: (String value) {
        if (!value.contains('@')) {
          return 'Please Type Email Format you@email.com';
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
    );
  }

  // Password
  Widget passwordTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Password :', hintText: 'more 6 Charator'),
      validator: (String value) {
        if (value.length <= 5) {
          return 'Please Type Password More 6 Charator';
        }
      },
      onSaved: (String value) {
        passwordString = value;
      },
    );
  }

  void clickCloudUpload() {
    print('You Click CloudUpload');
    print(formKey.currentState.validate());
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print('name => $nameString, email => $emailString, password => $passwordString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Register'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.cloud_upload),
              tooltip: 'Upload to Server',
              onPressed: () {
                clickCloudUpload();
              },
            )
          ],
        ),
        body: Form(
          key: formKey,
          child: Container(
            padding: EdgeInsets.all(50.0),
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                      width: 2.0,
                      color: Colors.blue,
                      style: BorderStyle.solid)),
              child: Column(
                children: <Widget>[
                  nameTextField(),
                  emailTextField(),
                  passwordTextField()
                ],
              ),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';

class ShowService extends StatefulWidget {
  final String loginString;
  ShowService({Key key, this.loginString}) : super(key: key);

  @override
  _ShowServiceState createState() => _ShowServiceState();
}

class _ShowServiceState extends State<ShowService> {
  Widget showSubTitle() {
    return Text(
      'Login by ${widget.loginString}',
      style: TextStyle(fontSize: 10.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[Text("Show Service"), showSubTitle()],
        ),
      ),
      body: Container(
        color: Colors.blue[200],
        alignment: Alignment(0, 0),
        child: Container(
          child: Image.asset('images/logo.png'),
        ),
      ),
    );
  }
}

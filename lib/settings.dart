import 'package:flutter/material.dart';

class settings_go extends StatefulWidget { // ignore: camel_case_types
  @override
  _settings_goState createState() => _settings_goState();
}

class _settings_goState extends State<settings_go> { // ignore: camel_case_types
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("settings"),
        actions: <Widget>[
        ],
      ),
      body: settingBody(),
    );
  }
}

class settingBody extends StatefulWidget { // ignore: camel_case_types
  @override
  _settingBodyState createState() => _settingBodyState();
}

class _settingBodyState extends State<settingBody> { // ignore: camel_case_types
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("All Setting Goes Here\n It Will be Very Soon",style: TextStyle(fontSize: 40.0),),
      ),
    );
  }
}


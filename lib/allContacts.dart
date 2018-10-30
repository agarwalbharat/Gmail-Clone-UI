import 'package:app_bar/compose_Email.dart';
import 'package:flutter/material.dart';


List<String> data = <String>[
  "Bharat","Agarwal","bhar","aga","bha",
];
List<String> images = <String>[
  "images/user_profile.png","images/user_profile.png","images/user_profile.png","images/user_profile.png","images/user_profile.png",
];

navigate(){

}

class allContacts extends StatelessWidget { // ignore: camel_case_types
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Contacts"),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search), onPressed:(){print("Search");}),
        ],
      ),
      //body:showContacts(),
      body: show_con(context),
    );
  }
}


Widget show_con(BuildContext context){ // ignore: non_constant_identifier_names
  BuildContext con = context;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GridView.count(crossAxisCount: 2,
      children: data.map((name){
        return new RaisedButton(
          color: Colors.blueAccent,
          splashColor: Colors.red,
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage("images/user_profile.png"),
                radius: 70.0,
              ),
              Text(name,)
            ],
          ),
          onPressed: (){
            print(name);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>composeEmail()));
          },
        );
      }).toList(),
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
    ),
  );
}



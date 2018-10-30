import 'package:flutter/material.dart';

var settings=[
  {"menu":"Add From Contacts"},
  {"menu":"Confidential mode"},
  {"menu":"Save draft"},
  {"menu":"Discard"},
  {"menu":"Settings"},
  {"menu":"Help & feedback"}
];

class composeEmail extends StatefulWidget { // ignore: camel_case_types
  @override
  _composeEmailState createState() => _composeEmailState();
}

class _composeEmailState extends State<composeEmail> { // ignore: camel_case_types
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compose"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.attach_file), onPressed: (){print("attach Filed Clicked");}),
          IconButton(icon: Icon(Icons.send), onPressed: (){print("Sent Button clicked");}),
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context){
              return settings.map((setting){
                return PopupMenuItem<String>(
                  value: setting['menu'],
                  child: Text(setting['menu']),
                );
              }).toList();
            },
          )
        ],
      ),
      body: compose_email(),
    );
  }
}

class compose_email extends StatefulWidget { // ignore: camel_case_types
  @override
  _compose_emailState createState() => _compose_emailState();
}

class _compose_emailState extends State<compose_email> { // ignore: camel_case_types
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
////          TextFormField(
////          decoration: InputDecoration(
////            suffixIcon: Icon(Icons.arrow_drop_down),
////            prefix: Text("From   "),
////            disabledBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
////
////          ),
////          ),
//
//      TextField(
//      decoration: InputDecoration(
//          border: InputBorder.none,
//          hintText: 'From',
//          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//          prefix: Text("From  "),
//        suffixIcon: Icon(Icons.arrow_drop_down),
//        contentPadding: EdgeInsets.all(10.0)
//      ),
//    ),
//      TextField(
//        decoration: InputDecoration(
//            border: InputBorder.none,
//            hintText: 'To',
//            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//            prefix: Text("To  "),
//            suffixIcon: Icon(Icons.arrow_drop_down),
//            contentPadding: EdgeInsets.all(10.0)
//        ),
//      ),
//        ],
//
//      ),
//    child:ListView(
//      children: <Widget>[
//        ListTile(
//          title:SizedBox(
//            width: 40.0,
//            child: Text("From"),
//          ),
//          trailing:  SizedBox(
//            width: 300.0,
//            child:TextField(
//              decoration: InputDecoration(
//                  border: InputBorder.none,
//                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//                  suffixIcon: Icon(Icons.arrow_drop_down),
//                  contentPadding: EdgeInsets.all(10.0)
//              ),
//            ),
//          )
//        ),
//        ListTile(
//            title:SizedBox(
//              width: 40.0,
//              child: Text("To"),
//            ),
//            trailing:  SizedBox(
//              width: 300.0,
//              child:TextField(
//                decoration: InputDecoration(
//                    border: InputBorder.none,
//                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//                    contentPadding: EdgeInsets.all(10.0)
//                ),
//              ),
//            )
//        ),
//        ListTile(
//            title:SizedBox(
//              width: 60.0,
//              child: Text("Subject"),
//            ),
//            trailing:  SizedBox(
//              width: 300.0,
//              child:TextField(
//                decoration: InputDecoration(
//                    border: InputBorder.none,
//                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//                    contentPadding: EdgeInsets.all(10.0)
//                ),
//              ),
//            )
//        ),
//        ListTile(
//            title:SizedBox(
//              width: 40.0,
//              child: Text("To"),
//            ),
//            trailing:  SizedBox(
//              width: 300.0,
//              child:TextField(
//                decoration: InputDecoration(
//                    border: InputBorder.none,
//                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//                    contentPadding: EdgeInsets.all(10.0)
//                ),
//              ),
//            )
//        ),
//        new TextField(
//          keyboardType: TextInputType.multiline,
//          maxLines: 20,
//        )
//      ],
//    )

    child: Text("Compose Content Goes Here", style: TextStyle(fontSize: 30.0),),
    );
  }
}

import 'package:app_bar/allContacts.dart';
import 'package:app_bar/compose_Email.dart';
import 'package:app_bar/sentMails.dart';
import 'package:app_bar/settings.dart';
import 'package:app_bar/viewEmail.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());


var emails =[
  {"from":"Bharat","subject":"Just an Mail with a long text to test Overflow", "time":"10:00 AM","date":"20 Oct 2018",},
  {"from":"Agarwal","subject":"Just an Mail", "time":"10:20 PM","date":"30 Sep 2018",},
  {"from":"Ba","subject":"Just an Mail", "time":"10:30 PM","date":"20 Sep 2018",},
  {"from":"Bha","subject":"Just an Mail", "time":"10:30 AM","date":"10 Sep 2018",},
];


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Emails",
      home: app_bar(),
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light,
        accentColor: Colors.red,
        splashColor: Colors.black26,
      ),
    );
  }
}

class app_bar extends StatefulWidget { // ignore: camel_case_types
  @override

  _app_barState createState() => _app_barState();
}

class _app_barState extends State<app_bar> { // ignore: camel_case_types

  String _str = "Heyy There !!";

  void _onPressed(String str){
    setState(() {
      this._str = str + " Button Clicked";
    });
    print(this._str);
  }

  @override
  Icon actionIcon = new Icon(Icons.search); // ignore: override_on_non_overriding_field
  Widget appBarTitle = new Text("All Email");
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.group),tooltip: 'Contacts', onPressed: (){
            _onPressed("Peoples");
            //allContacts(appbar: "All Contacts",);
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=>allContacts(),
                )
              );
            }
          ),
          new IconButton(icon: actionIcon,onPressed:(){
            setState(() {
              if ( this.actionIcon.icon == Icons.search){
                this.actionIcon = new Icon(Icons.close);
                this.appBarTitle = new TextField(
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 25.0
                  ),
                  decoration: new InputDecoration(
                      prefixIcon: new Icon(Icons.search,color: Colors.white),
                      hintText: "Search...",
                      hintStyle: new TextStyle(color: Colors.white)
                  ),
                );}
              else {
                this.actionIcon = new Icon(Icons.search);
                this.appBarTitle = new Text("All Emails");
              }
            });
          },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed:(){
            _onPressed("Compose");
            Navigator.push(context, MaterialPageRoute(builder: (context)=>composeEmail()));
          },tooltip: 'Compose',
        child: Icon(Icons.edit),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 45.0,
                    backgroundImage: AssetImage("images/user_profile.png"),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Bharat Agarwal',
                    style: TextStyle(color: Colors.white,fontSize: 30.0),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                image:DecorationImage(
                    image: AssetImage("images/background.jpg"),
                    fit: BoxFit.cover,
                ),
                //color: Colors.red,
              ),
            ),
            ListTile(
              trailing: Container(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(Icons.email),
              ),
              title: Container(
                padding: EdgeInsets.only(left: 20.0),
                child:Text(
                  'Emails',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              onTap: () {
               // _onPressed("All Email");
                //Scaffold.of(context).showSnackBar(SnackBar(content: Text("hey There")),);
              },
            ),
            ListTile(
              trailing: Container(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(Icons.send),
              ),
              title: Container(
                padding: EdgeInsets.only(left: 20.0),
                child:Text(
                  'Sent Mails',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              onTap: () {
                _onPressed("Sent Mails");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>sentMails()));
              },
            ),
            ListTile(
              trailing: Container(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(Icons.settings),
              ),
              title: Container(
                padding: EdgeInsets.only(left: 20.0),
                child:Text(
                  'Settings',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              onTap: () {
                _onPressed("Settings");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>settings_go()));
              },
            ),
          ],
        ),
      ),
      /*body:Center(
        child: Text(_str,style: TextStyle(
            color: Colors.black,
          fontSize: 20.0
          ),
        ),
      ),*/
      body: Container(
        child: ListView(
            children: emails.map((email){
              return Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 25.0,
                              backgroundImage: AssetImage("images/user_profile.png"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      email['from'],
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                      height: 10.0,
                                    ),
                                    SizedBox(
                                      width: 150.0,
                                      child:  Text(
                                        email['subject'],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                  trailing: Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            email['time'],
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          //Icon(Icons.star_border),
                          IconButton(icon: Icon(Icons.star_border), onPressed: (){print(email);})
                        ],
                      ),
                  ),
                  onTap: (){
                    print(email);
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>viewEmail(from: email['from'],subject: email['subject'],time: email['time'],date: email['date'],to: "me",),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
        ),
      ),
    );
  }
}




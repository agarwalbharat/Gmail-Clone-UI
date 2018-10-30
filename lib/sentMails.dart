import 'package:app_bar/main.dart';
import 'package:app_bar/viewEmail.dart';
import 'package:flutter/material.dart';


var emails=[
  {"to":"xyz@bharat","subject":"Hey There just a subject","date":"29 Sept 2018","time":"3:00AM"},
  {"to":"zz@bharat","subject":"Subject Goes here","date":"4 Sept 2018","time":"6:20PM"},
  {"to":"abc@bharat","subject":"Long Subject to test the text Overflow in main screen","date":"2 Sept 2018","time":"5:00PM"}
];

class sentMails extends StatefulWidget { // ignore: camel_case_types
  @override
  _sentMailsState createState() => _sentMailsState();
}

class _sentMailsState extends State<sentMails> { // ignore: camel_case_types
  @override
  Icon actionIcon = new Icon(Icons.search); // ignore: override_on_non_overriding_field
  Widget appBarTitle = new Text("Sent Emails");
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
        actions: <Widget>[
          //IconButton(icon: Icon(Icons.search),tooltip: "Search", onPressed: (){print("search Called");})

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
                this.appBarTitle = new Text("Sent Emails");
              }
            });
          },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},tooltip: "Compose",child: Icon(Icons.edit),),
      /*drawer:Drawer(
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
                print("tapped ");
                Navigator.pop(context,MaterialPageRoute(builder: (context)=>app_bar()));
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
                print("Sent Mails");
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
                print("Settings");
              },
            ),
          ],
        ),
      ),*/
      body: myBody(),
    );
  }
}

class myBody extends StatefulWidget { // ignore: camel_case_types
  @override
  _myBodyState createState() => _myBodyState();
}

class _myBodyState extends State<myBody> { // ignore: camel_case_types
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
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
                                    'me',
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
                    builder: (context)=>viewEmail(to: email['to'],subject: email['subject'],time: email['time'],date: email['date'],from: "me",),
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


import 'package:flutter/material.dart';


//This Page is not that much Stable


class viewEmail extends StatelessWidget { // ignore: camel_case_types, must_be_immutable

  String from,subject,time,date,to="me";

  viewEmail({this.from,this.subject,this.time,this.date,this.to});

  static const String replyall = 'Reply All';
  static const String forward = 'Forward';
  static const String print = 'Print';

  static const List<String> choices = <String>[
    replyall,
    forward,
    print
  ];

  var settings=[
    {"menu":"Move To"},
    {"menu":"Snooze"},
    {"menu":"Change labels"},
    {"menu":"Mute"},
    {"menu":"Print"},
    {"menu":"Report"}
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.archive), onPressed: (){}),
          new IconButton(icon: Icon(Icons.delete), onPressed:(){}),
          new IconButton(icon: Icon(Icons.mail), onPressed: (){}),
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

     /* body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("From: $from@bharat",style: TextStyle(fontSize: 25.0),),
            SizedBox(
              height: 10.0,
            ),
            Text("Subject: $subject",style: TextStyle(fontSize: 25.0),),
            SizedBox(
              height: 10.0,
            ),
            Text("Time: $time",style: TextStyle(fontSize: 25.0),),
          ],
        )
      ),*/

     body: myBody(context),
    );
  }


  Widget myBody(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top: 20.0,left: 10.0),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 220.0,
                  child:Text("$subject" ,maxLines: 5 ,softWrap: true,style: TextStyle(fontSize: 20.0),),
                ),
                SizedBox(
                  width: 13.0,
                ),

                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 6.0, right: 6.0,top: 2.0,bottom: 2.0),
                        color: Colors.blueAccent,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.inbox),
                            Text("Inbox"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      //Icon(Icons.star_border,textDirection: TextDirection.rtl,)
                      IconButton(icon: Icon(Icons.star_border), onPressed: (){}),
                    ],
                  ),
                ),
                ],
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0,left: 10.0,right: 10.0),
                child: InkWell(
                  onTap: (){},
                  splashColor: Colors.black26,
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        child: CircleAvatar(
                          radius: 35.0,
                          backgroundImage: AssetImage("images/user_profile.png"),
                        ),
                        onTap: (){},
                        borderRadius: BorderRadius.circular(80.0),
                      ),

                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(from,style: TextStyle(fontSize: 20.0),textDirection: TextDirection.ltr,),
                                  Text("to: $to",style: TextStyle(color: Colors.grey),),
                                  Row(
                                    children: <Widget>[
                                      Text(time,style: TextStyle(color: Colors.grey),),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      InkWell(
                                        splashColor: Colors.blueAccent,
                                        child: Text("View details", style: TextStyle(color: Colors.blue,fontSize: 15.0),),
                                        onTap: (){
                                          showDialog(
                                              context: context,
                                              builder: (_) => new AlertDialog(
                                                title: new Text("Details"),
                                                content: SizedBox(
                                                  height: 100.0,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Row(
                                                        children: <Widget>[
                                                          new Text("From: $from ", style: TextStyle(color: Colors.grey),),
                                                          new Text("$from@bharat",style: TextStyle(color: Colors.blue),)
                                                        ],
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          new Text("Reply to: $from ",style: TextStyle(color: Colors.grey),),
                                                          new Text("$from@bharat",style: TextStyle(color: Colors.blue),)
                                                        ],
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          new Text("To: ",style: TextStyle(color: Colors.grey),),
                                                          new Text("$to",style: TextStyle(color: Colors.blue),)
                                                        ],
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          new Text("Date: $date $time",style: TextStyle(color: Colors.grey),),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          InkWell(
                                                              child: new Text(
                                                                "See Security Details",
                                                                style: TextStyle(color: Colors.blue),
                                                              ),
                                                            onTap: (){
                                                              showDialog(
                                                                  context: context,
                                                                  builder: (_) => new AlertDialog(
                                                                    title: new Text("Security Details"),
                                                                    content: new Text("Security Details\n Will be Shown Here", style: TextStyle(color: Colors.grey),),
                                                                  )
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  IconButton(icon: Icon(Icons.reply), onPressed: (){}),
                                  PopupMenuButton<String>(
                                    itemBuilder: (BuildContext context){
                                      return choices.map((String choice){
                                        return PopupMenuItem<String>(
                                          value: choice,
                                          child: Text(choice),
                                        );
                                      }).toList();
                                    },
                                  )

                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            
            Container(
              padding: EdgeInsets.only(top: 40.0),
              child: Align(
                child: Center(child: Text("Message Goes Here......",style: TextStyle(fontSize: 40.0),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



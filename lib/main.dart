import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'botcommands.dart';
import 'welcome.dart';
import 'map.dart';
import 'lost_found.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

// This widget is the home page of your application. It is stateful, meaning
// that it has a State object (defined below) that contains fields that affect
// how it looks.

// This class is the configuration for the state. It holds the values (in this
// case the title) provided by the parent (in this case the App widget) and
// used by the build method of the State. Fields in a Widget subclass are
// always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}





class Home1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mapscreen()),
            );
          },
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {

  final messageInsert = TextEditingController();
  List<Map> messsages = [];

  @override
  void initState() {
    // TODO: implement initState


    var value = welcomeMsg();
    setState(() {
      messsages.insert(0, {
        "data": 0,
        "message": value[0],
      });
    });
    setState(() {
      messsages.insert(0, {
        "data": 0,
        "message": value[1],
      });
    });
    super.initState();
  }





  void response(query) {
    addQueries();
    var msg,i;
    if(query.contains("!lost"))
    {
      List lostData = query.split(" ");
      lostitems.add(Item(lostData[1], lostData[2], lostData[3]));
      if(!checkFounditems(lostitems.last))
      {
        msg = "Details Noted. Please convey this to";

        for(i = 0;i<coordinators.length;++i)
        {
          if(coordinators[i].block == lostData[3])
          {
            setState(() {
              messsages.insert(0, {
                "data": 0,
                "message": "${msg} Coordinator: ${coordinators[i].name},Phone: ${coordinators[i].phone_number}, Block: ${coordinators[i].block}"
              });

            });
            print(lostitems[0].itemName);

          }

        }
      }
      else
        {

          msg = "An item similar to yours is found. Contact,";

          for(i = 0;i<coordinators.length;++i)
            {
              if(coordinators[i].block == lostData[3])
                {
                  setState(() {
                    messsages.insert(0, {
                      "data": 0,
                      "message": "${msg} Coordinator: ${coordinators[i].name},Phone: ${coordinators[i].phone_number}, Block: ${coordinators[i].block}, for more details."
                    });

                  });
                  lostData.last.isFound = true;
                }
            }





        }

    }
















   else
     {
       String response = getResopnse(query);
       setState(() {
         messsages.insert(0, {
           "data": 0,
           "message": response
         });
       });
     }

  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Ask Veronica",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            Icon(
              Icons.bolt,
              color: Colors.yellow,
              size: 40.0,
            ),
          ],
        ),
      backgroundColor: Colors.white,
      ),
      body: Container(
        child: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage(
                'assets/bground.png'
                    ),
                fit: BoxFit.cover)
    ),
    child:
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text("Today, ${DateFormat("Hm").format(DateTime.now())}", style: TextStyle(
                  fontSize: 20
              ),),
            ),
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messsages.length,
                    itemBuilder: (context, index) => chat(
                        messsages[index]["message"].toString(),
                        messsages[index]["data"]))),
            SizedBox(
              height: 20,
            ),

            Divider(
              height: 5.0,
              color: Colors.blue[900],
            ),
            Container(


              child: ListTile(

                leading: IconButton(
                  icon: Icon(Icons.camera_alt, color: Colors.blue[900], size: 35,),
                  onPressed: (){
                    print('Button Pressed !');
                  },


                ),

                title: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(
                        15)),
                    color: Colors.grey[400],
                  ),
                  padding: EdgeInsets.only(left: 15),
                  child: TextFormField(
                    controller: messageInsert,
                    decoration: InputDecoration(
                      hintText: "Enter a Message...",
                      contentPadding: EdgeInsets.only(bottom: 10.0),
                      hintStyle: TextStyle(
                          color: Colors.black45,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),

                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black
                    ),
                    onChanged: (value) {

                    },
                  ),
                ),

                trailing: IconButton(

                    icon: Icon(

                      Icons.send,
                      size: 30.0,
                      color: Colors.blue[900],
                    ),
                    onPressed: () {

                      if (messageInsert.text.isEmpty) {
                        print("empty message");
                      } else {
                        setState(() {
                          messsages.insert(0,
                              {"data": 1, "message": messageInsert.text});
                        });
                        response(messageInsert.text);
                        messageInsert.clear();
                      }
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    }),

              ),

            ),

            SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    ));
  }

  //for better one i have use the bubble package check out the pubspec.yaml

  Widget chat(String message, int data) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),

      child: Row(
        mainAxisAlignment: data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [

          data == 0 ? Container(
            height: 60,
            width: 60,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/bot.jpeg"),
            ),
          ) : Container(),

          Padding(
            padding: EdgeInsets.all(10.0),
            child: Bubble(
                radius: Radius.circular(15.0),
                color: data == 0 ? Colors.blue[700] : Colors.tealAccent[700],
                elevation: 0.0,

                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                      SizedBox(
                        width: 10.0,
                      ),
                      Flexible(
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 230,
                            ),
                            child: Text(
                              message,
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          )
                      )
                    ],
                  ),
                )),
          ),


          data == 1? Container(
            height: 60,
            width: 60,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/default.jpg"),
            ),
          ) : Container(),

        ],
      ),
    );
  }
}
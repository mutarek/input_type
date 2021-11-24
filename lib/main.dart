import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'classes/users.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        fontFamily: 'Georgia',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 18.0, fontFamily: 'Hind'),
        ),
      )));
}

class HomePage extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<HomePage> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.help,
          size: 30,
        ),
        backgroundColor: Colors.blue,
        onPressed: () {
          setState(() {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.blue,
                elevation: 10,
                content: Text(
                  "How May We assit you sir ?",
                  style: TextStyle(color: Colors.white),
                ),
                duration: Duration(seconds: 3),
              ),
            );
          });
        },
      ),
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: name,
                cursorColor: Colors.white10,
                decoration: InputDecoration(hintText: 'Name', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)), errorBorder: OutlineInputBorder(), labelText: 'Name'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                controller: number,
                cursorColor: Colors.white10,
                decoration: InputDecoration(hintText: 'Name ', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)), errorBorder: OutlineInputBorder(), labelText: 'Number'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 45,
                width: double.infinity,
                color: Colors.teal,
                child: ElevatedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    if (name.text.isEmpty || number.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.blue,
                          content: Text(
                            "All Fields should be fill Uped",
                            style: TextStyle(color: Colors.white),
                          ),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    } else if (name.text.length < 4) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.blue,
                          content: Text("Name Shold Be at least four char", style: TextStyle(color: Colors.white)),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    } else if (number.text.length < 10) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.blue,
                          content: Text("Please type a prper number", style: TextStyle(color: Colors.white)),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    } else {
                      ///created a new method for user login
                      loginuser(name.text, number.text);
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void loginuser(String text, String text2) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Validition Successfully"),
        duration: Duration(seconds: 3),
      ),
    );
  }
}

class Sorting extends StatefulWidget {
  _State createState() => _State();
}

class _State extends State<Sorting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: EdgeInsets.all(5),
        itemCount: data.length,
        itemBuilder: (ctx, i) {
          return Card(
            elevation: 5,
            child: ListTile(
              title: Text(data[i]['name']),
            ),
          );
        },
      ),
    );
  }
}

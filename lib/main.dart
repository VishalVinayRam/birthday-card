import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Birthday Card',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _name = "";
  String _age = "";
  String _message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          title: Text('Flutter Birthday Card'),
          backgroundColor: Colors.transparent),
      body: Container(
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Color.fromARGB(255, 12, 12, 252),
              Color.fromARGB(255, 117, 3, 239),
              Color.fromARGB(255, 205, 4, 255),
              Color.fromARGB(255, 251, 4, 255),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Create a birthday card",
                  style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 80, 255, 5),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                TextField(
                  keyboardType: TextInputType.name,
                  decoration:
                      InputDecoration(hintText: 'Name of the celebrator'),
                  onChanged: (value) => _name = value,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Age'),
                  onChanged: (value) => _age = value,
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Write your message here',
                  ),
                  onChanged: (value) => _message = value,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          width: 1.0, color: Color.fromARGB(255, 48, 245, 4)),
                    ),
                    child: Text(
                      'Create Card',
                      style: TextStyle(
                        color: Color.fromARGB(255, 8, 0, 0),
                      ),
                    ),
                    onPressed: () {
                      // lib/main.dart/home/flutter2/Desktop/calculator/flutter_application_1/lib/models
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BirthdayCard(
                              name: _name, age: _age, message: _message),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BirthdayCard extends StatelessWidget {
  BirthdayCard({required this.name, required this.age, required this.message});
  final String name;
  final String age;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/downlaoad.jpeg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Happy Birthday!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 33.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${age}th Birthday!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextButton(
                      child: Text(
                        'GO back',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

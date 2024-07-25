import 'package:flutter/material.dart';
import 'package:list_app/Screens/To_do_list.dart';
import 'package:list_app/Screens/common_drawer.dart';
import 'package:list_app/Screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      routes: {
        "/login": (context) => Login(),
        "/To_do_list": (context) => to_do_list(),
        "/settings": (context) => Placeholder(),
      },
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Daily Activities by MK!'),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/image.jpg',
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Welcome to Daily Activities by MK!',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.purpleAccent.withOpacity(0.5),
                        blurRadius: 2.0,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: CommonDrawer(currentPage: 'MyHomePage'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:list_app/Screens/main.dart';

class CommonDrawer extends StatelessWidget{
  final String currentPage;
  CommonDrawer({required this.currentPage});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Mona Khalil'),
            accountEmail: Text("Mona03.arzish@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.purple,
              child: Text(
                'MK',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: currentPage=='MyHomePage' ? null:() {
                Navigator.pushReplacementNamed(context, "/");
              },
              selected: currentPage=='MyHomePage',
            ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Login Page'),
            onTap: currentPage=='login' ? null:() {
              Navigator.pushNamed(context, "/login");
            },
          ),
          ListTile(
            leading: const Icon(Icons.checklist),
            title: const Text('To-do-List'),
            onTap:currentPage=='to_do_list' ? null: () {
              Navigator.pushReplacementNamed(context, "/To_do_list");
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/settings");
            },
          ),
        ],
      ),
    );
  }
}
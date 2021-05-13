import 'package:chat_app/services/appstate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _state = Provider.of<AppState>(context, listen: false);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Cerrar sesión"),
              leading: Icon(Icons.exit_to_app),
              onTap: (){
                _state.logout();
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0XFFA0D523),
        title: Text("Smile Chat"),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: ListTile(
              tileColor: Colors.grey,
              title: Text("Pedro Avila"),
              leading: CircleAvatar(
                backgroundColor: Colors.black,
              ),
              onTap: ()=>Navigator.pushNamed(context, "chat")
            ),
          )
        ],
      ),
    );
  }
}
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/services/appstate.dart';
import 'package:flutter/material.dart';
 
import 'package:chat_app/pages/splash_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
          create: (BuildContext context) => AppState(),
          child: MaterialApp(
        title: 'SmileChat',
        // home: SplashPage()
        initialRoute: "/",
        routes: {
          "/" : (BuildContext context) {
            final _state = Provider.of<AppState>(context);
            if ( _state.login ) {
              return HomePage();
            } else {
              return SplashPage();
            }
            
          },
          "home" : (BuildContext context) => HomePage(),
          "chat" : (BuildContext context) => ChatPage()
        },
      ),
    );
  }
}
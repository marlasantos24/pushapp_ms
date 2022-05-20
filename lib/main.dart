import 'package:flutter/material.dart';
import 'package:pushapp_ms/src/pages/home_page.dart';
import 'package:pushapp_ms/src/pages/mensaje_page.dart';
import 'package:pushapp_ms/src/pages/push_notifications_service.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await PushNotificationService.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home' : (BuildContext c ) => HomePage(),
        'mensaje' : (BuildContext c ) => MensajePage()
      },
    );
  }
}
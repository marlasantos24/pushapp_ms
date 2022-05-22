import 'package:flutter/material.dart';
import 'package:pushapp_ms/src/pages/home_page.dart';
import 'package:pushapp_ms/src/pages/mensaje_page.dart';
import 'package:pushapp_ms/src/services/push_notifications_services.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await PushNotificationService.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //Context: 
    PushNotificationService.messagesStream.listen((data) {
      //print('MyApp: $message');
      print(data);
      navigatorKey.currentState?.pushNamed('mensaje', arguments: data);
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home' : (BuildContext c ) => HomePage(),
        'mensaje' : (BuildContext c ) => MensajePage()
      },
    );
  }
}
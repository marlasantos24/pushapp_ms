
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {

  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream = new StreamController.broadcast();
  static Stream<String> get messagesStream => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
      //print('onbackground Handler ${message.messageId}');
      print(message.data);
      _messageStream.add(message.notification?.body ?? 'no title');
  }

   static Future _onMessageHandler(RemoteMessage message) async {
      //print('onMessage Handler ${message.messageId}');
      print(message.data);
      _messageStream.add(message.notification?.body ?? 'no title');
  }

   static Future _onMessageOpenApp(RemoteMessage message) async {
      //print('onMessageOpenApp Handler ${message.messageId}');
      print(message.data);
      _messageStream.add(message.notification?.body ?? 'no title');
  }

  static Future initializeApp() async{

    //Push Notification 
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('Token: $token');


    //Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    //Local Notification

  }

  static closeStreams(){
    _messageStream.close();
  }
}
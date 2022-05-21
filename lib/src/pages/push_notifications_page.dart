
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {

  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static Future _backgroundHandler(RemoteMessage message) async {
      print('onbackground Handler ${message.messageId}');
  }

   static Future _onMessageHandler(RemoteMessage message) async {
      print('onMessage Handler ${message.messageId}');
  }

   static Future _onMessageOpenApp(RemoteMessage message) async {
      print('onMessageOpenApp Handler ${message.messageId}');
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

}
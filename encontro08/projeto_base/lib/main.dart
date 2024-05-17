import 'package:encontro_08/views/home.dart';
import 'package:encontro_08/views/local_notifications.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD:encontro08/projeto_base/lib/main.dart
import 'package:awesome_notifications/awesome_notifications.dart';
=======
import '../views/remove_background.dart';
>>>>>>> tentando-volta-a-cagada-do-merge:src/encontro08/projeto_base/lib/main.dart

void main() {
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
        ledColor: Colors.blue,
        enableVibration: true,
        channelKey: "test_channel",
        channelName: "Test Notification",
        channelDescription: 'Basic Notifcaction for the user')
  ]);
  runApp(const MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Encontro 08',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Home(),
        '/local_notifications': (context) => const LocalNotifications(),
        '/remove_background': (context) => const RemoveBackground(title: 'Remove Background'),
      },
    );
  }
}

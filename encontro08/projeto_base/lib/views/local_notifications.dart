// local_notifications.dart
// Construção de uma tela que permite realizar agendamentos de tempo para notificações locais.

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class LocalNotifications extends StatefulWidget {
  const LocalNotifications({Key? key}) : super(key: key);

  @override
  State<LocalNotifications> createState() => _LocalNotificationsState();
}

class _LocalNotificationsState extends State<LocalNotifications> {
  TextEditingController _timeController = TextEditingController();

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        title: const Text('Agendamento de Notificações'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Agendamento de Notificações",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _timeController,
                decoration: const InputDecoration(
                  hintText: 'Digite o tempo em segundos',
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                int? seconds = int.tryParse(_timeController.text);
                if (seconds == null || seconds <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Insira um valor válido')),
                  );
                  return;
                }

                AwesomeNotifications()
                    .isNotificationAllowed()
                    .then((isAllowed) {
                  if (!isAllowed) {
                    AwesomeNotifications()
                        .requestPermissionToSendNotifications();
                  } else {
                    DateTime scheduleTime = DateTime.now().add(Duration(seconds: seconds));
                    AwesomeNotifications().setListeners(
                      onActionReceivedMethod: (receivedNotification) {
                        if (receivedNotification.payload != null) {
                          print(
                              "Notification payload: ${receivedNotification.payload}");
                        }
                      },
                    );
                    AwesomeNotifications().createNotification(
                        content: NotificationContent(
                      id: 1,
                      channelKey: 'test_channel',
                      color: Colors.blue,
                      title: "Hello, this is Jean Rothstein",
                      body: "Pascoli me ama", 
                      criticalAlert: true,
                      wakeUpScreen: true,
                      payload: {'data': 'Jupiter exemplos'},
                    ),
                        schedule: NotificationCalendar(
                        year: scheduleTime.year,
                        month: scheduleTime.month,
                        day: scheduleTime.day,
                        hour: scheduleTime.hour,
                        minute: scheduleTime.minute,
                        second: scheduleTime.second,
                        millisecond: 0,
                        repeats: false,),
                    // AwesomeNotifications().setListeners(
                    //   onActionReceivedMethod: (receivedNotification) {
                    //     if (receivedNotification.payload != null) {
                    //       print(
                    //           "Notification payload: ${receivedNotification.payload}");
                    //     }
                    //   },
                    // );
                    );
                    //AwesomeNotifications().setListeners(
                    //  onActionReceivedMethod: (receivedNotification) {
                       
                    //      print("Notification payload: ${receivedNotification.payload}");
                        
                //},
              //);
            }
          }
        );
      },
              icon: ClipRRect(  
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/tomato.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

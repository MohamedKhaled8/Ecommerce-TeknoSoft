import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  Future<void> getToken() async {
    String? myToken = await FirebaseMessaging.instance.getToken();

    debugPrint("==============Token==============");
    debugPrint(myToken);
  }

  Future<void> myRequestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint('User granted provisional permission');
    } else {
      debugPrint('User declined or has not accepted permission');
    }
  }

  sendMesssage(title, message) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'key=AAAA_WNN3io:APA91bF2APt-TOl_eGovuayVfB0GxRldlhYiW13TsXy9lwmPtnUc8-EGcW2ZOER9x9A2xdJaECuYqle9WJ5Y9gkGm95q5eOedWwf1mF3-oyLQQxuq0XJaJMs9QLckSocSCcGC1fErg2z'
    };
    var data = json.encode({
      "to":
          "dT821PuLRPmnOQtyCEz9Gf:APA91bHKPLfYFODweyL12UWSgylBxe7kU2_4rhrfnJ8VrXiNcfnxbur_t_0kpfLRLHbV8gRdy-xtV5Ng2xKhwB43gd8KrCX7xCdGeF-sveL68Pfazx655Ztnhk-8AuGjD0WBfKKlm5Xr",
      "notification": {"title": title, "body": message}
    });
    var dio = Dio();
    var response = await dio.request(
      'https://fcm.googleapis.com/fcm/send',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }

  @override
  void initState() {
    // مفتح فقط
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        if (message.notification != null) {
          debugPrint("=============================");
          debugPrint(message.notification!.title);
          debugPrint(message.notification!.body);
          debugPrint("=============================");
        }
        Get.snackbar("Congratulation", "Push");
      },
    );
    // FirebaseAuth.instance.authStateChanges().listen(
    //   (User? user) {
    //     if (user == null) {
    //       debugPrint(
    //           "=============================   user is current signed Out!");
    //     } else {
    //       debugPrint(
    //           "=============================   user is current signed in!");
    //     }
    //   },
    // );
    getToken();
    myRequestPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: ColorsManger.blue,
              borderRadius: BorderRadius.circular(20)),
          child: MaterialButton(
              onPressed: () async {
                await sendMesssage("HI", "Mohamed Khaled");
              },
              child: const Text("send Message")),
        ),
      ),
    );
  }
}

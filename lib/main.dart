import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'view/home_view.dart';

void main() {
  runApp(const News());
}

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: OfflineBuilder(
          debounceDuration: Duration.zero,
          connectivityBuilder: (BuildContext context,
              ConnectivityResult connectivity, Widget child) {
            if (connectivity != ConnectivityResult.none) {
              Fluttertoast.showToast(
                  msg: "online",
                  gravity: ToastGravity.TOP,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 13.0,
                  toastLength: Toast.LENGTH_SHORT);
            } else {
              Fluttertoast.showToast(
                  msg: "check network connection",
                  gravity: ToastGravity.TOP,
                  backgroundColor: Colors.redAccent,
                  textColor: Colors.white,
                  fontSize: 12.0);
            }
            return child;
          },
          child: const HomeView()),
    );
  }
}

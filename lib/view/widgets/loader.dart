import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loader() => const Center(
      child: SpinKitCubeGrid(
        color: Colors.indigo,
        size: 50.0,
        duration: Duration(seconds: 2),
      ),
    );

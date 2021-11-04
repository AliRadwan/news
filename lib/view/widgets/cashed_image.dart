import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget cashImage({required String imgUrl}) => CachedNetworkImage(
    imageUrl: imgUrl,
    imageBuilder: (context, imageProvider) => Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fill,
            ),
          ),
        ),
    placeholder: (context, url) => const SpinKitRipple(
          color: Colors.indigo,
          size: 30.0,
        ),
    errorWidget: (context, url, error) => const Icon(Icons.error));

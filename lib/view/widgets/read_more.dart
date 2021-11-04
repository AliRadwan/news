import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

Widget readMore({required String text}) => Padding(
      padding:
          const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 8.0),
      child: ReadMoreText(
        text,
        trimLines: 3,
        trimLength: 20,
        colorClickableText: Colors.cyan,
        delimiter: " ...",
        trimMode: TrimMode.Line,
        style: const TextStyle(
            color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w500),
        trimCollapsedText: 'Show more',
        trimExpandedText: 'Show less',
        moreStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );

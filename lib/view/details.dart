import 'package:flutter/material.dart';

import 'widgets/cashed_image.dart';

class Details extends StatelessWidget {
  final String img;
  final String title;
  final String content;
  final String date;

  const Details(
      {Key? key,
      required this.img,
      required this.title,
      required this.content,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 220.0,
            floating: true,
            pinned: true,
            snap: true,
            elevation: 50,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text('News Details',
                  style: TextStyle(fontSize: 14.0, color: Colors.black87)),
              background: Hero(tag: "tag", child: cashImage(imgUrl: img)),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                    child: Text(title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                    child: Text(content * 3,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                    child: Text(date.substring(0, 10),
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey)),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

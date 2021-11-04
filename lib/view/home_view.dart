import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:news/model/news_model.dart';
import 'package:news/view/widgets/cashed_image.dart';
import 'package:news/view/widgets/loader.dart';
import 'package:news/view/widgets/read_more.dart';
import 'package:news/view_model/news_view_model.dart';

import 'details.dart';


class HomeView extends GetWidget<NewsViewModel> {

   const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewsViewModel());
    return Scaffold(
      body: FutureBuilder(
            future: controller.getData(),
            builder: (context, AsyncSnapshot snapshot){
              NewsModel ? date = snapshot.data;
              if(snapshot.hasData){
                return AnimationLimiter(
                  child: ListView.builder(
                      itemCount: date!.articles!.length,
                      itemBuilder:(context,index){
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 400),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.bounceInOut,
                              child: newsCardItem(
                                  image:date.articles![index].image.toString() ,
                                  title:date.articles![index].title.toString() ,
                                  content:date.articles![index].content.toString(),
                                  createAt: date.articles![index].createdAt.toString()
                              ),
                            ),
                          ),
                        );
                      } ),
                );
              }else{
                return  loader();
              }
            },
    ));
  }

  Widget newsCardItem({required String image,required String title,required String content,required String createAt })=>Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      InkWell(
        onTap: ()=>Get.to(Details(img:image,title:title, content:content,date:createAt)),
        child: Hero(
          tag: "tag",
            child: cashImage(imgUrl:image)),
      ),
      Padding(
        padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 4.0,bottom: 4.0),
        child: Text(title,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
      ),
      readMore(text: content),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(createAt.substring(0,10),style: const TextStyle(fontSize: 12,color: Colors.grey),),
      ),

    ],
  );
}

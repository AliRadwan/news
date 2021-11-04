import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news/model/news_model.dart';

class NewsViewModel extends GetxController{

  getData()async{
    final url = Uri.parse('https://cdn.newsbriefs.info/static/assets/news-cards.json');
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      try{
        return NewsModel.fromJson(jsonDecode(response.body));
      }
      catch(e){
        Get.snackbar('can not get date', e.toString());
      }
    }
  }

}
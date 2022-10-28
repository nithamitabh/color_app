import 'dart:convert';

import 'package:color_app/model/article_model.dart';
import 'package:http/http.dart';

// Http request services
// this class will allows us to get http request
class ApiServices {
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=09bb0de71c6a48fda00fe1890d5c7746";
 Future<List<Artice>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Artice> articles =
          body.map((dynamic item) => Artice.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get the articles,check your connection");
    }
  }
}

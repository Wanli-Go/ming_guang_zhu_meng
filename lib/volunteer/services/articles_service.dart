import 'dart:convert';
import 'package:ming_guang/volunteer/model/model_article_detail.dart';
import 'package:ming_guang/volunteer/model/comment.dart';
import 'package:ming_guang/volunteer/model/model_article_brief.dart';
import 'package:ming_guang/volunteer/services/base/base_url.dart';
import 'package:ming_guang/volunteer/services/base/request_client.dart';

class ArticleService {
  Future<List<ArticleBrief>> fetchFavorites() async {
    return await fetchArticles(
        pageNum: 0, pageSize: 0, url: "/volunteer/article/comment");
    //return briefs.reversed.toList();
  }

  Future<List<ArticleBrief>> fetchArticles(
      {int pageNum = 1, int pageSize = 6, String? url}) async {
    try {
      final response = await RequestClient.client.post(
        Uri.parse(url == null
            ? '$baseUrl/volunteer/article/list'
            : '$baseUrl$url'), // Replace with your API endpoint
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, int>{
          'pageNum': pageNum,
          'pageSize': pageSize,
        }),
      );

      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        List<dynamic> articlesJson = body['data']['list'];
        List<ArticleBrief> articles = articlesJson.map((dynamic item) {
          return ArticleBrief(
            id: item['id'],
            title: item['title'],
            articleTime: item['articleTime'],
            content: item['content'],
            contentPic: item['contentPic'],
          );
        }).toList();
        return articles;
      } else {
        print("article briefs response code e");
        return briefs;
      }
    } catch (e) {
      print("article briefs e");
      return briefs; // dummy data
    }
  }

  Future<ArticleDetail> fetchArticleDetail(String id) async {
    try{
    final response = await RequestClient.client
        .get(Uri.parse('$baseUrl/volunteer/article/detail/$id'));

    if (response.statusCode == 200) {
      Map<String, dynamic> articleDetailData = json.decode(response.body);
      List<Comment> comments = await _fetchComments(id);
      return ArticleDetail.fromJson(articleDetailData, comments);
    } else {
      print('fetch article detail response code e');
      return exampleDetail;
    }
    }catch(e){
      print("fetch article detail e: $e");
      return exampleDetail;
    }
  }

  Future<List<Comment>> _fetchComments(String articleId) async {
    try{
    final response = await RequestClient.client.get(Uri.parse(
        '$base64Url/volunteer/article/detail/$articleId/comment'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((comment) => Comment.fromJson(comment)).toList();
    } else {
      print('fetch article comments response code e');
      return commentsss;
    }
    }catch(e){
      print("fetch article comments e: $e");
      return commentsss;
    }
  }
}

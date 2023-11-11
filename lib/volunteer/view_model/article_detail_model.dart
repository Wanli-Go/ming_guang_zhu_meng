import 'package:ming_guang/volunteer/model/model_article_detail.dart';
import 'package:ming_guang/volunteer/services/articles_service.dart';

class ArticleDetailModel {
  final ArticleService service = ArticleService();
  final String id;

  ArticleDetailModel({required this.id});

  Future<ArticleDetail> fetchArticleDetail() async {
    return service.fetchArticleDetail(id);
  }

  void likeArticle(String id){
    service.likeArticle(id);
  }
}

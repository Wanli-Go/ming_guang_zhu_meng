import 'package:ming_guang/volunteer/model/model_article_brief.dart';
import 'package:ming_guang/volunteer/services/articles_service.dart';

class ArticlesModel{

  ArticleService service = ArticleService();

  List<ArticleBrief>? tempArticles;
  Future<List<ArticleBrief>> fetchArticles() async{
    return tempArticles ??= await service.fetchArticles();
  }

  int _pageNum = 1;

  Future<List<ArticleBrief>> refresh() async{
    _pageNum += 1;
    tempArticles = await service.fetchArticles(pageNum: _pageNum);
    return tempArticles!;
  }

  Future<List<ArticleBrief>> fetchFavorites() async{
    return await service.fetchFavorites();
  }

  Future<List<ArticleBrief>> search(String? keyWord) async{
    if(keyWord==null)return[];
    return service.fetchArticlesWithFavorites(keyWord);
  }
}

import '../model/comment.dart';

class ArticleDetail {
  final String id;
  final String title;
  final String publishDate;
  final String author;
  final String content;
  final String contentPic;
  final List<Comment> comments;

  ArticleDetail(
      {
      required this.id,
      required this.title,
      required this.publishDate,
      required this.author,
      required this.content,
      required this.contentPic,
      required this.comments});

  factory ArticleDetail.fromJson(Map<String, dynamic> json, List<Comment> comments) {

    return ArticleDetail(
      id: json['data']['id'].toString(),
      title: json['data']['title'],
      publishDate: json['data']['articleTime'],
      author: json['data']['authorName'],
      content: json['data']['content'],
      contentPic: json['data']['contentPic'],
      comments: comments,
    );
  }
}



final List<Comment> exampleComment = commentsss;

final ArticleDetail exampleDetail = ArticleDetail(
    id: "1",
    title: '学习语｜弘扬奉献、友爱、互助、进步的志愿精神',
    publishDate: '2022/12/05',
    author: '人民网',
    content:
        '今天是第37个国际志愿者日。志愿服务是社会文明进步的重要标志。习近平总书记在党的二十大报告中强调：“完善志愿服务制度和工作体系。”党的十八大以来，广大志愿者、志愿服务组织、志愿服务工作者积极响应党和人民号召，弘扬和践行社会主义核心价值观，走进社区、走进乡村、走进基层，为他人送温暖、为社会作贡献，充分彰显了理想信念、爱心善意、责任担当，成为人民有信仰、国家有力量、民族有希望的生动体现。党建网梳理了习近平总书记部分相关重要论述，与您一起学习领会。\n		志愿服务是社会文明进步的重要标志\n    青奥会不仅是体育竞技的舞台，也是中国青年和各国青年分享青春、交流思想、畅谈未来的舞台。作为志愿者，无论是在台前还是幕后，无论是迎来送往还是默默值守，都可以在这场青春盛会中展现自己的风采。\n    ——2014年7月，习近平给“南京青奥会志愿者”的回信    \n志愿者事业要同“两个一百年”奋斗目标、同建设社会主义现代化国家同行。志愿服务是社会文明进步的重要标志，是广大志愿者奉献爱心的重要渠道。\n    ——2019年1月17日，习近平在天津考察时的讲话\n    能够参加北京冬奥会、冬残奥会的志愿服务工作，是人生难得的机会，希望大家振奋精神、鼓足干劲，团结协作、共同努力，确保冬奥期间各项服务保障工作顺利，让各国参赛人员充分感受到中国人民的热情好客和文明礼貌，感受到春天般的温暖。\n    ——2022年1月4日，习近平在北京考察2022年冬奥会、冬残奥会筹办备赛工作时的讲话\n    弘扬奉献、友爱、互助、进步的志愿精神，继续以实际行动书写新时代的雷锋故事\n    广大青年要把正确的道德认知、自觉的道德养成、积极的道德实践紧密结合起来，自觉树立和践行社会主义核心价值观，带头倡导良好社会风气。\n    要倡导社会文明新风，带头学雷锋，积极参加志愿服务，主动承担社会责任，热诚关爱他人，多做扶贫济困、扶弱助残的实事好事，以实际行动促进社会进步。\n    ——2013年5月4日，习近平在同各界优秀青年代表座谈时的讲话\n    希望你们弘扬奉献、友爱、互助、进步的志愿精神，坚持与祖国同行、为人民奉献，以青春梦想、用实际行动为实现中国梦作出新的更大贡献。\n    ——2013年12月5日，习近平给华中农业大学“本禹志愿服务队”的回信\n    希望广大志愿者、志愿服务组织、志愿服务工作者立足新时代、展现新作为，弘扬奉献、友爱、互助、进步的志愿精神，继续以实际行动书写新时代的雷锋故事。\n    ——2019年7月23日，习近平致中国志愿服务联合会第二届会员代表大会的贺信\n    为志愿服务搭建更多平台，给予更多支持，推进志愿服务制度化常态化\n    各级党委和政府要为志愿服务搭建更多平台，给予更多支持，推进志愿服务制度化常态化，凝聚广大人民群众共同为实现“两个一百年”奋斗目标、实现中华民族伟大复兴的中国梦贡献力量。\n    ——2019年7月23日，习近平致中国志愿服务联合会第二届会员代表大会的贺信\n    广大公安民警、疾控工作人员、社区工作人员等坚守岗位、日夜值守，广大新闻工作者不畏艰险、深入一线，广大志愿者等真诚奉献、不辞辛劳，为疫情防控作出了重大贡献。\n    ——2020年2月23日，习近平在统筹推进新冠肺炎疫情防控和经济社会发展工作部署会议上的讲话\n    要在全社会广泛弘扬奉献、友爱、互助、进步的志愿精神，更好发挥志愿服务的积极作用，促进社会文明进步。要弘扬奥林匹克精神，发挥奥林匹克促进人类和平发展的重要作用，为人类文明进步贡献更多中国智慧和中国力量。\n    ——2022年4月8日，习近平在北京冬奥会、冬残奥会总结表彰大会上的讲话',
    contentPic: 'assets/images/brief1-1.jpg',
    comments: exampleComment);

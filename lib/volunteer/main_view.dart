import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/themes/community_theme.dart';
import 'package:ming_guang/volunteer/themes/main_theme.dart';
import 'package:ming_guang/volunteer/view/community.dart';
import 'package:ming_guang/volunteer/view/home_page.dart';
import 'package:ming_guang/volunteer/view/favorites.dart';
import 'package:ming_guang/volunteer/view/task_list.dart';
import 'package:ming_guang/volunteer/view_model/articles_model.dart';
import 'package:ming_guang/volunteer/view_model/main_model.dart';
import 'package:ming_guang/volunteer/view_model/notifiers/notifier_bottom_nav.dart';
import 'package:ming_guang/volunteer/view_model/notifiers/notifier_update_task_info.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  int keyForRefreshMain = 0; // set the key for missions so that it rebuilds
  int keyForRefreshTask = 10000;

  bool debug = false;

  ArticlesModel articlesModel = ArticlesModel();

  MainView({super.key});

  static const model = MainModel();

  @override
  Widget build(BuildContext context) {
    print("Yes?");
    return Consumer<BottomNavNotifier>(builder: (context, bottomNotifier, c) {
      print("BUILD!BUILD!");

      bool isInCommunityPage = bottomNotifier.index == 2;
      double width = MediaQuery.of(context).size.width;

      return Scaffold(
        
        backgroundColor: backgroundColor,

        appBar: AppBar(
          toolbarHeight: width * 0.14,
            backgroundColor: isInCommunityPage ? commAppBarColor: appBarColor,
            title: isInCommunityPage 
              ? const Center(child: Text("志愿社区"))
              : const Center(child: Text("明光筑梦·志愿者")),
            leading: isInCommunityPage 
              ? Icon(Icons.abc, size: 50, color: Colors.transparent) : 
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () => model.personalBottonClicked(context),
              ),

            // Search bar for community    
            bottom: !isInCommunityPage ? null : PreferredSize(
              preferredSize: const Size.fromHeight(72), // 标准的工具栏高度
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 13, right: 13, bottom: 8, top: 8),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        // 使用Expanded来确保TextField可以填充剩余空间
                        child: TextField(
                          onSubmitted: (value) => model.searchClicked(context, value),
                          decoration: const InputDecoration(
                            hintText: '搜索......',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actions:  isInCommunityPage 
              ? [Icon(Icons.abc, size: 50, color: Colors.transparent)] :
              [IconButton(
                icon: const Icon(Icons.markunread),
                onPressed: () {
                  model.messageBottonClicked(context);
                },
              ),
            ]),


        body: IndexedStack(
          index: bottomNotifier.index,
          children: [
            Consumer<TaskInfoUpdateNotifier>(
              builder: (context, notifier, c) {
                if(debug != false) {
                  keyForRefreshMain += 1;
                }
                return HomePageBody(key: GlobalObjectKey(keyForRefreshMain), bottomNotifier: bottomNotifier);
              }
            ),
            Consumer<TaskInfoUpdateNotifier>(
              builder: (context, notifier, c) {
                if(debug != false) {
                  keyForRefreshTask += 1;
                }
                print(debug);
                return TaskList(key: GlobalObjectKey(keyForRefreshTask),);
              }
            ),
            CommunityBody(model: articlesModel,),
          ],
        ),



        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: isInCommunityPage ? commHighlight : highlight,
          currentIndex: bottomNotifier.index,
          onTap: (value) {
            debug = true;
            print("VALUE CHANGED!");
            keyForRefreshMain -= 1;
            keyForRefreshTask -= 1;// Make sure the pages don't refresh
            bottomNotifier.changeIndex(value);
            },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.pages_rounded,
                  size: 30,
                ),
                label: "主页"),
            BottomNavigationBarItem(
                icon: Icon(Icons.security_update_good, size: 30),
                label: "任务批改"),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_alt_outlined, size: 30), label: "志愿社区"),
          ],
        ),



        floatingActionButton: ! isInCommunityPage
            ? null
            : FloatingActionButton(
                backgroundColor: commHighlight,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FavoritesPage(model: articlesModel,)),
                  );
                },
                child: const Icon(Icons.hotel_class),
              ),
      );
    });
  }
}

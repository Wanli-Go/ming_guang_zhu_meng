import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ming_guang/example/my_app.dart';
import 'package:provider/provider.dart';
import '../model/model.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TapNotifier>(
      builder: (context, notifier, child) => 
      ListView.builder(
    
        itemCount: items.length,
        
        itemBuilder: (context, index) {
          final item = items[index];

          ListTile listTile;

          if(!notifier.changed) {
            listTile = ListTile(
              onTap: () => notifier.change(),
              title: Text(item.title),
              subtitle: Text(item.subtitle),
            );
          } else{
            listTile = ListTile(
              onTap: () => notifier.change(),
              title: Text(item.title),
              subtitle: Text(item.alternatetitle), // Display alternate title
              tileColor: Colors.lime.withOpacity(0.8),
            );
          }
          return listTile;
        },
      )

    );
  }
}


class IconExample extends StatelessWidget {
  const IconExample({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children:[
      const DynamicBackgroundScreen(),
      Container(
        width: size.width * 0.9,
        height: size.height * 0.8,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(30)
        ),
        child: Column(children: [
          SizedBox(height: size.height*0.2), 
          SizedBox(height: size.height*0.6, 
                    child: const ItemList())
          ],) 
      ),
      Positioned(
        left: size.width * 0.2,
        top: -10,
        child: Image.network(
          "https://cdn.pixabay.com/photo/2016/11/25/07/00/diamond-1857736_1280.png",
          width: size.width*0.6,
          ),
      )
      ]
    );
  }
}

class DynamicBackgroundScreen extends StatefulWidget {
  const DynamicBackgroundScreen({super.key});

  @override
  _DynamicBackgroundScreenState createState() => _DynamicBackgroundScreenState();
}

class _DynamicBackgroundScreenState extends State<DynamicBackgroundScreen> {
  Color _backgroundColor = Colors.blue;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      setState(() {
        _backgroundColor = Color.fromRGBO(
          _random.nextInt(256),
          _random.nextInt(256),
          _random.nextInt(256),
          1,
        ).withOpacity(0.6);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 3),
        curve: Curves.easeInOut,
        color: _backgroundColor,
      ),
    );
  }
}

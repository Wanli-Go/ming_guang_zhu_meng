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
      builder: (context, notifier, child) => ListView.builder(
    
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
              tileColor: Colors.lime.withOpacity(0.3),
            );
          }
          return listTile;
        },
      )

    );
  }
}

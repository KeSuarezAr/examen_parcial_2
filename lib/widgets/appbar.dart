import 'package:flutter/material.dart';
import 'package:popup_menu/popup_menu.dart';

Widget appBar(BuildContext context) {
  GlobalKey btnKey = GlobalKey();

  return Padding(
    padding: const EdgeInsets.only(right: 15.0),
    child: GestureDetector(
      key: btnKey,
      child: const Icon(Icons.menu),
      onTap: () {
        PopupMenu menu = PopupMenu(
          config: const MenuConfig(
            backgroundColor: Colors.white,
            highlightColor: Colors.black,
            lineColor: Colors.black,
            type: MenuType.list,
            itemWidth: 100,
          ),
          items: [
            MenuItem(
              title: 'Home',
              textStyle: const TextStyle(color: Colors.black),
              image: const Icon(Icons.home),
            ),
            MenuItem(
              title: 'Tareas',
              textStyle: const TextStyle(color: Colors.black),
              image: const Icon(Icons.list_alt),
            )
          ],
          onClickMenu: (MenuItemProvider item) {
            switch (item.menuTitle) {
              case 'Home':
                Navigator.pushNamed(context, 'home');
                break;
              case 'Tareas':
                Navigator.pushNamed(context, 'lista_tareas');
                break;
            }
          },
          context: context,
        );
        menu.show(widgetKey: btnKey);
      },
    ),
  );
}

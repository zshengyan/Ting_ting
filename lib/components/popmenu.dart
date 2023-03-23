import 'package:flutter/material.dart';

import 'menu.dart';

class Popmenu {
  static Future showPopupMenu(BuildContext context,
      LongPressStartDetails details, List<Context> items) {
    final List<PopupMenuItem> popupMenuItems = [];
    for (Context item in items) {
      PopupMenuItem popupMenuItem = PopupMenuItem(
        // PopupMenuItem 的坑，默认为8，点击到边矩的地方会无反应
        padding: const EdgeInsets.all(0),
        // onTap: item.onTap,
        child: Builder(builder: (context0) {
          // 这里需要使用 新的 context ，不然点击会无反应。
          // 区分现有的 context
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (item.onTap != null) {
                item.onTap!();
              }
            },
            child: Container(
              width: 300,
              height: 98,
              decoration: const BoxDecoration(
                  color: Color(0xFFFFEE8A),
                  borderRadius: BorderRadius.vertical(),
                  border: Border(
                      top: BorderSide(width: 5, color: Color(0xFF303030)),
                      left: BorderSide(width: 5, color: Color(0xFF303030)),
                      right: BorderSide(width: 5, color: Color(0xFF303030)),
                      bottom: BorderSide(width: 5, color: Color(0xFF303030)))),
              child: Container(
                child: item.text,
              ),
            ),
          );
        }),
      );

      popupMenuItems.add(popupMenuItem);
    }

    RenderBox? renderBox =
        Overlay.of(context)?.context.findRenderObject() as RenderBox;

    // 表示位置（在画面边缘会自动调整位置）
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy,
        details.globalPosition.dx + 110, // 菜单显示位置X轴坐标
        details.globalPosition.dy - 40, // 菜单显示位置Y轴坐标
      ),
      Offset.zero & renderBox.size,
    );

    return showMenu(
        context: context,
        position: position,
        items: popupMenuItems,
        useRootNavigator: true);
  }
}

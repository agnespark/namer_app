import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum _Menu { preview, share, getLink, remove, Logout }

class ProfileWidget {
  Widget() {
    return PopupMenuButton<_Menu>(
      icon: const Icon(Icons.more_vert),
      onSelected: (_Menu item) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<_Menu>>[
        const PopupMenuItem<_Menu>(
          value: _Menu.preview,
          child: ListTile(
            leading: Icon(Icons.person_outlined),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'logstack',
                  style: TextStyle(
                    color: Color(0xFF233651),
                    fontSize: 16,
                    fontFamily: 'Noto Sans KR',
                  ),
                ),
                Text(
                  'applednajs@gmail.com',
                  style: TextStyle(
                    color: Color(0xFF233651),
                    fontSize: 12,
                    fontFamily: 'Noto Sans KR',
                  ),
                ),
              ],
            ),
          ),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem<_Menu>(
          value: _Menu.share,
          child: ListTile(
            leading: Icon(Icons.share_outlined),
            title: Text('Share'),
          ),
        ),
        const PopupMenuItem<_Menu>(
          value: _Menu.getLink,
          child: ListTile(
            leading: Icon(Icons.link_outlined),
            title: Text('Get link'),
          ),
        ),
        const PopupMenuItem<_Menu>(
          value: _Menu.remove,
          child: ListTile(
            leading: Icon(Icons.delete_outline),
            title: Text('Remove'),
          ),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem<_Menu>(
          value: _Menu.Logout,
          child: ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text('Logout'),
          ),
        ),
      ],
    );
  }
}

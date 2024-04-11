import 'dart:html';

// 프로필은 page에 넣어야함 ! controller도 같은 폴더 안에!
import 'package:flutter/material.dart';
import 'package:namer_app/pages/shimmer/constants.dart';

enum _Menu { userInfo, name, team, position, Logout }

class ProfileWidget {
  textfield() {}

  Widget() {
    return PopupMenuButton<_Menu>(
      padding: const EdgeInsets.all(0.0),
      icon: const Icon(
        Icons.person,
        color: primaryColor,
      ),
      onSelected: (_Menu item) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<_Menu>>[
        const PopupMenuItem<_Menu>(
          value: _Menu.userInfo,
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
        PopupMenuItem<_Menu>(
          value: _Menu.name,
          child: Container(
            // width: 192,
            height: 32,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 160,
                    height: 32,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: InkWell(
                      onTap: () {
                        // 클릭 시 동작, onSelected 콜백이 있으면 필요 없을 수 있음
                        print("InkWell tapped");
                      },
                      child: Icon(
                        Icons.edit,
                        size: 24,
                      ),
                    ),
                    // child: GestureDetector(
                    //   onTap: () {
                    //     Navigator.pop(
                    //         context, 'menu1'); // 팝업 메뉴 닫고 onSelected 호출
                    //   },
                    //   child: MouseRegion(
                    //     onEnter: (event) {},
                    //     child: Icon(
                    //       Icons.edit,
                    //       size: 24,
                    //     ),
                    //   ),
                    // ),
                  ),
                ]),
          ),
        ),
        PopupMenuItem<_Menu>(
          value: _Menu.team,
          child: Container(
            // width: 192,
            height: 32,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 160,
                    height: 32,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Team',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: InkWell(
                      onTap: () {
                        // 클릭 시 동작, onSelected 콜백이 있으면 필요 없을 수 있음
                        print("InkWell tapped");
                      },
                      child: Icon(
                        Icons.edit,
                        size: 24,
                      ),
                    ),
                  ),
                ]),
          ),
        ),
        PopupMenuItem<_Menu>(
          value: _Menu.position,
          child: Container(
            // width: 192,
            height: 32,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 160,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Position',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: InkWell(
                      onTap: () {
                        // 클릭 시 동작, onSelected 콜백이 있으면 필요 없을 수 있음
                        print("InkWell tapped");
                      },
                      child: Icon(
                        Icons.edit,
                        size: 24,
                      ),
                    ),
                  ),
                ]),
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<_Menu>(
          value: _Menu.Logout,
          onTap: () => print('logout 되었습니다.'),
          child: ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text('Logout'),
          ),
        ),
      ],
    );
  }
}

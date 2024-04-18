// import 'package:easy_sidemenu/easy_sidemenu.dart';
// import 'package:flutter/material.dart';
// import 'package:namer_app/pages/dashboard/dashboard.dart';
// import 'package:namer_app/pages/datetime/datetime.dart';
// import 'package:namer_app/pages/lounge/lounge.dart';
// import 'package:namer_app/pages/sampling/sampling.dart';
// import 'package:namer_app/pages/shimmer/news_page.dart';
// import 'package:namer_app/pages/table/table.dart';
// import 'package:namer_app/pages/textfield/textfield.dart';

// class EasyNavMainPage extends StatefulWidget {
//   const EasyNavMainPage({Key? key}) : super(key: key);

//   @override
//   _EasyNavMainPageState createState() => _EasyNavMainPageState();
// }

// class _EasyNavMainPageState extends State<EasyNavMainPage> {
//   PageController pageController = PageController();
//   SideMenuController sideMenu = SideMenuController();

//   @override
//   void initState() {
//     sideMenu.addListener((index) {
//       pageController.jumpToPage(index);
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//       ),
//       body: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           SideMenu(
//             controller: sideMenu,
//             style: SideMenuStyle(
//               // showTooltip: false,
//               displayMode: SideMenuDisplayMode.open,
//               showHamburger: false,
//               hoverColor: Colors.blue[100],
//               selectedHoverColor: Colors.blue[100],
//               selectedColor: Colors.lightBlue,
//               // selectedTitleTextStyle: const TextStyle(color: Colors.white),
//               selectedIconColor: Colors.white,
//               arrowOpen: Colors.blue,
//               // decoration: BoxDecoration(
//               //   borderRadius: BorderRadius.all(Radius.circular(10)),
//               // ),
//               // backgroundColor: Colors.grey[200]
//             ),
//             title: Column(
//               children: [
//                 ConstrainedBox(
//                   constraints: const BoxConstraints(
//                     maxHeight: 150,
//                     maxWidth: 150,
//                   ),
//                   child: Image.asset(
//                     'assets/images/easy_sidemenu.png',
//                   ),
//                 ),
//                 const Divider(
//                   indent: 8.0,
//                   endIndent: 8.0,
//                 ),
//               ],
//             ),
//             footer: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.lightBlue[50],
//                     borderRadius: BorderRadius.circular(12)),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
//                   child: Text(
//                     'mohada',
//                     style: TextStyle(fontSize: 15, color: Colors.grey[800]),
//                   ),
//                 ),
//               ),
//             ),
//             items: [
//               SideMenuItem(
//                 title: 'Dashboard',
//                 onTap: (index, _) {
//                   print(index);
//                   sideMenu.changePage(index);
//                 },
//                 badgeContent: const Text(
//                   '3',
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 // tooltipContent: "This is a tooltip for Dashboard item",
//               ),
//               SideMenuItem(
//                 title: 'Users',
//                 onTap: (index, _) {
//                   print(index);
//                   sideMenu.changePage(index);
//                 },
//               ),
//               SideMenuExpansionItem(
//                 title: "Expansion Item",
//                 children: [
//                   SideMenuItem(
//                     title: 'Expansion Item 1',
//                     onTap: (index, _) {
//                       print(index);
//                       sideMenu.changePage(index);
//                     },
//                     badgeContent: const Text(
//                       '3',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     tooltipContent: "Expansion Item 1",
//                   ),
//                   SideMenuItem(
//                     title: 'Expansion Item 2',
//                     onTap: (index, _) {
//                       print(index);
//                       sideMenu.changePage(index);
//                     },
//                   )
//                 ],
//               ),
//               SideMenuItem(
//                 title: 'Files',
//                 onTap: (index, _) {
//                   sideMenu.changePage(index);
//                 },
//                 // trailing: Container(
//                 //     decoration: const BoxDecoration(
//                 //         color: Colors.amber,
//                 //         borderRadius: BorderRadius.all(Radius.circular(6))),
//                 //     child: Padding(
//                 //       padding: const EdgeInsets.symmetric(
//                 //           horizontal: 6.0, vertical: 3),
//                 //       child: Text(
//                 //         'New',
//                 //         style: TextStyle(fontSize: 11, color: Colors.grey[800]),
//                 //       ),
//                 //     )),
//               ),
//               SideMenuItem(
//                 title: 'Download',
//                 onTap: (index, _) {
//                   sideMenu.changePage(index);
//                 },
//               ),
//               // SideMenuItem(
//               //   builder: (context, displayMode) {
//               //     return const Divider(
//               //       endIndent: 8,
//               //       indent: 8,
//               //     );
//               //   },
//               // ),
//               SideMenuItem(
//                 title: 'Settings',
//                 onTap: (index, _) {
//                   sideMenu.changePage(index);
//                 },
//               ),
//               // SideMenuItem(
//               //   onTap:(index, _){
//               //     sideMenu.changePage(index);
//               //   },
//               //   icon: const Icon(Icons.image_rounded),
//               // ),
//               // SideMenuItem(
//               //   title: 'Only Title',
//               //   onTap:(index, _){
//               //     sideMenu.changePage(index);
//               //   },
//               // ),
//               const SideMenuItem(
//                 title: 'Exit',
//               ),
//             ],
//           ),
//           const VerticalDivider(
//             width: 0,
//           ),
//           Expanded(
//             child: PageView(
//               controller: pageController,
//               children: [
//                 DashboardPage(),
//                 DateTimePage(),
//                 LoungePage(),
//                 SamplingPage(),
//                 NewsPage(),
//                 TablePage(),
//                 TextFieldPage(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

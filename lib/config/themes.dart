import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
    useMaterial3: false,
    // brightness: Brightness.light,
    primaryColor: Colors.green,
    primaryColorLight: Colors.yellow,
    primaryColorDark: Colors.orange,
    secondaryHeaderColor: Colors.blue,
    textTheme: const TextTheme(
            // bodyLarge: TextStyle(color: Color(0xff113311), fontSize: 20),
            // bodyMedium: TextStyle(color: Color(0xff223344), fontSize: 20),
            )
        .apply(
      fontFamily: 'NotoSansKR',
    ),
    // splashColor: Colors.transparent,
    // highlightColor: Colors.transparent,
    // colorScheme: ColorScheme(
    //   brightness: Brightness.light,
    //   primary: Colors.red,
    //   secondary: Colors.yellow,
    //   surface: Colors.blue,
    //   background: Colors.indigo,
    //   error: Colors.purple,
    //   onPrimary: Colors.white,
    //   onSecondary: Colors.black,
    //   onSurface: Colors.white,
    //   onBackground: Colors.white,
    //   onError: Colors.white,
    // ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.red[600], fontSize: 20),
      focusColor: Color(0xff37375C),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Color(0xff37375C)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Color(0xff37375C)),
      ),
      // fillColor: Colors.white,
      // filled: true,
      isDense: true,
      iconColor: Color(0xff37375C),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.green; // 체크된 상태일 때 색상
          }
          return Colors.transparent; // 체크되지 않은 상태일 때 색상
        },
      ),
      side: BorderSide(color: Colors.grey[400]!, width: 1.0),
      visualDensity: VisualDensity(
        horizontal: -2.0, // 가로 크기 조절
        vertical: -2.0, // 세로 크기 조절
      ),
    ),
    splashColor: Colors.transparent,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black, // 버튼의 배경색
        textStyle: TextStyle(color: Colors.white), // 버튼 텍스트의 색상
        shape: RoundedRectangleBorder(
          // 버튼 모양 설정
          borderRadius: BorderRadius.circular(8.0), // 원하는 각도 설정
        ),
        padding:
            EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // 내부 여백 설정
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.white, // Dialog background color
      elevation: 4.0, // Dialog elevation
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50), // Dialog shape
      ),
    ),
  );
}

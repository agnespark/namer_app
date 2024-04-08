import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
    useMaterial3: false,
    // brightness: Brightness.light,
    primaryColor: Color(0xFF148FEF), // primary500
    primaryColorDark: Color(0xFF1481E1), // primary600
    primaryColorLight: Color(0xFFE2F1FD), // priamry50
    textTheme: TextTheme(
      // Heading/Regular/06 (QS 대제목)
      displayLarge: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w400,
        height: 0.06,
        letterSpacing: -0.48,
      ),
      // Heading/06
      displayMedium: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 0.06,
        letterSpacing: -0.48,
      ),
      // Subheading/03
      headlineLarge: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 0.09,
        letterSpacing: -0.19,
      ),
      // Body/Regular/300
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w300,
        height: 0.09,
      ),
      // Body/Regular/400
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 0.09,
      ),
      // Body/Small/300 (기본폰트)
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w300,
        height: 0.10,
      ),
      // Body/Small/400
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 0.10,
      ),
    ).apply(
      fontFamily: 'NotoSansKR',
    ),
    // fontFamilyFallback: ,
    splashColor: Colors.transparent,
    // disabledColor: ,
    // dividerColor: ,
    // focusColor: ,
    // highlightColor: ,
    // hintColor: ,
    // hoverColor: ,
    // iconTheme: ,
    // buttonTheme: ,
    dialogTheme: DialogTheme(
      backgroundColor: Colors.white, // Dialog background color
      elevation: 4.0, // Dialog elevation
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50), // Dialog shape
      ),
    ),
    // dividerTheme: ,
    // dropdownMenuTheme: ,
    // expansionTileTheme: ,
    // filledButtonTheme: ,
    // iconButtonTheme: ,
    // outlinedButtonTheme: ,
    // progressIndicatorTheme: ,
    // radioTheme: ,
    // snackBarTheme: ,
    // tooltipTheme: ,
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
  );
}

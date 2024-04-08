import 'package:flutter/material.dart';
import 'package:namer_app/config/color.dart';

class Themes {
  static final light = ThemeData(
    useMaterial3: false,
    // brightness: Brightness.light,
    // primaryColor: Color(0xFF148FEF), // primary500
    // primaryColorDark: Color(0xFF1481E1), // primary600
    // primaryColorLight: Color(0xFFE2F1FD), // priamry50
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
    fontFamilyFallback: ['latin'],
    splashColor: Colors.transparent,
    disabledColor: Color(0xFFCDD2D8),
    dividerColor: Colors.black.withOpacity(0.11999999731779099),
    // focusColor: ,
    // highlightColor: ,
    hintColor: grayMain,
    // hoverColor: ,
    // iconTheme: ,
    // dividerTheme: ,
    // dropdownMenuTheme: ,
    // expansionTileTheme: ,
    // filledButtonTheme: ,
    // outlinedButtonTheme: ,
    // elevatedButtonTheme:
    buttonTheme: ButtonThemeData(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // 버튼의 BorderRadius 설정
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4), // Dialog shape
      ),
    ),
    iconTheme: IconThemeData(
      color: grayMain,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: primaryMain,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return primaryDark;
          }
          return grayLight;
        },
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    // tooltipTheme: ,
    inputDecorationTheme: InputDecorationTheme(
      focusColor: Color(0xFFCDD2D8),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Color(0xFFCDD2D8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Color(0xFFCDD2D8)),
      ),
      // fillColor: Colors.white,
      // filled: true,
      isDense: true,
    ),
    // checkboxTheme: CheckboxThemeData(
    //   fillColor: MaterialStateProperty.resolveWith<Color?>(
    //     (Set<MaterialState> states) {
    //       if (states.contains(MaterialState.selected)) {
    //         return primaryMain; // 체크된 상태일 때 색상
    //       }
    //       return Color(0x99000000); // 체크되지 않은 상태일 때 색상
    //     },
    //   ),
    //   side: BorderSide(color: Colors.grey[400]!, width: 1.0),
    //   visualDensity: VisualDensity(
    //     horizontal: -2.0, // 가로 크기 조절
    //     vertical: -2.0, // 세로 크기 조절
    //   ),
    // ),
  );
}

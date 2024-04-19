import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/config/color.dart';

class DialogWidget {
  DialogWidget(this.text, this.onPressed);
  final String text;
  final VoidCallback onPressed;

  Widget(String buttonText, Color buttonColor) {
    return AlertDialog(
      iconPadding: EdgeInsets.only(top: 16, left: 16, right: 16),
      icon: Container(
        alignment: Alignment.centerRight,
        child: IconButton(
          icon: Icon(
            Icons.close,
            size: 16,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: 'Noto Sans KR',
          fontWeight: FontWeight.w400,
        ),
      ),
      contentPadding:
          const EdgeInsets.only(left: 59.5, right: 59.5, top: 0, bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      actions: [
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: TextButton(
            onPressed: () => Get.back(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.50, color: Color(0xFFCDD2D8)),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                '취소',
                style: TextStyle(
                  color: Color(0xFFCDD2D8),
                  fontSize: 14,
                  fontFamily: 'Noto Sans KR',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: TextButton(
            onPressed: onPressed,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.50, color: buttonColor),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    buttonText,
                    style: TextStyle(
                      color: buttonColor,
                      fontSize: 14,
                      fontFamily: 'Noto Sans KR',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }

  confirm() {
    Color buttonColor = primaryDark;
    String buttonText = '확인';
    Get.dialog(
      Widget(buttonText, buttonColor),
    );
  }

  delete() {
    Color buttonColor = redMain;
    String buttonText = '삭제';
    Get.dialog(
      Widget(buttonText, buttonColor),
    );
  }

  cancel() {
    Color buttonColor = redMain;
    String buttonText = '해제';
    Get.dialog(
      Widget(buttonText, buttonColor),
    );
  }

  close() {
    Color buttonColor = redMain;
    String buttonText = '닫기';
    Get.dialog(
      Widget(buttonText, buttonColor),
    );
  }
}


// DialogWidget.confirm()

// DialogWidget.delete()

// DialogWidget.close()

// DialogWidget.cancel()
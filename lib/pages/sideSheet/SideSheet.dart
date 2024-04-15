import 'package:flutter/material.dart';
import 'package:namer_app/component/profile.dart';
import 'package:namer_app/component/detail.dart';

class SideSheetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    DetailWidget().Widget(context);
                  },
                  child: Text('OPEN LEFT SIDE SHEET WITH RETURN DATA')),
              SizedBox(height: 10),
              ProfileWidget().Widget(),
            ],
          ),
        ),
      ),
    );
  }
}

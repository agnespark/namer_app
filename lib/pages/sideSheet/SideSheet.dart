import 'package:flutter/material.dart';
import 'package:namer_app/pages/sideSheet/detail.dart';
import 'package:side_sheet/side_sheet.dart';

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
                    SideSheet.right(
                      body: DetailWidget(),
                      context: context,
                      width: MediaQuery.of(context).size.width * 0.6,
                    );
                  },
                  child: Text('OPEN LEFT SIDE SHEET WITH RETURN DATA')),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

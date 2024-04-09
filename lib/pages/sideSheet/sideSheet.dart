import 'package:flutter/material.dart';
import 'package:namer_app/component/side_sheet.dart';

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
                    SideSheetWidget(context).double_save_delete();
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

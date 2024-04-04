import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:side_sheet/side_sheet.dart';

void main() {
  runApp(SideSheetPage());
}

class SideSheetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Side Sheet',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: MyHomePage(title: 'Side Sheet Example'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = 'no data';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () async {
                    final data = await SideSheet.right(
                      body: bodyWithReturnArgs(context),
                      context: context,
                      width: MediaQuery.of(context).size.width * 0.6,
                    );

                    setState(() {
                      text = data;
                    });
                  },
                  child: Text('OPEN LEFT SIDE SHEET WITH RETURN DATA')),
              SizedBox(height: 10),
              Text('Arguments: $text')
            ],
          ),
        ),
      ),
    );
  }
}

Widget bodyWithReturnArgs(context) {
  return Container(
    alignment: Alignment.topCenter,
    child: Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context, 'Data returns from left side sheet');
            // Navigator.pop(context, 'Data returns from left side sheet');
          },
          icon: Icon(Icons.close),
        ),
        Text('Body')
      ],
    ),
  );
}

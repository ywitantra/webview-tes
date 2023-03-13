import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewView extends StatefulWidget {
  bool? isFromDashboard = false;
  NewView({Key? key, this.isFromDashboard}) : super(key: key);

  @override
  State<NewView> createState() => _NewViewState();
}

class _NewViewState extends State<NewView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          titleSpacing: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xff323232)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Row(
            children: [
              Text(
                'Help',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'DIN Next LT Pro',
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000000)),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SafeArea(
                child: Column(
                  children: [
                    Container(
                      height: screenHeight,
                      child: WebView(
                        initialUrl: widget.isFromDashboard == true
                            ? 'https://help.doku.com'
                            : 'https://help.doku.com/en/support/solutions/66000285319',
                        javascriptMode: JavascriptMode.unrestricted,
                        gestureRecognizers: Set()
                          ..add(Factory<VerticalDragGestureRecognizer>(
                                  () => VerticalDragGestureRecognizer())),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

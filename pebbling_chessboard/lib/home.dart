import 'package:flutter/material.dart';
import 'package:pebbling_chessboard/select_level_screen.dart';
import 'package:pebbling_chessboard/widgets/ButtonWidget.dart';
import 'package:pebbling_chessboard/widgets/TextWidget.dart';
import 'help_screen.dart';
import 'package:pebbling_chessboard/widgets/background.dart';



class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  var size,height,width;

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: SizedBox(
        height: height, width: width,
        child: BackgroundWidget(
          child: Column(
            children: [
              SizedBox(height: height*0.08,),
              getLogo(),
              SizedBox(height: height*0.03),
              ButtonWidget(title: 'Play',onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectLevelScreen()),
                );
              },
                ),
              SizedBox(height: height*0.03),
              ButtonWidget(title: 'Help',onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HelpScreen()),
                  );
                },)
            ],
          ),
        ),
      ),
    );
  }

  Widget getLogo(){
    return Stack(
      children: [
        Positioned(
            child: Image.asset("assets/images/chessboard.png",height: height*0.43, width: width*0.9,)
        ),
        Positioned(
          top: height*0.035,
          left: width*0.23,
          child: textWidget("Can you", Color(0xffE1B310), Color(0xff8D0404), width*0.15, 17, "Flavors"),),
        Positioned(
          top: height*0.092,
          left: width*0.23,
          child: textWidget("Escape?", Color(0xffE1B310), Color(0xff8D0404), width*0.15, 17, "Flavors"),),
      ],
    );
  }


}
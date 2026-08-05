import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pebbling_chessboard/widgets/level_circle.dart';
import 'package:shared_preferences/shared_preferences.dart';

int t = 0;
class SelectLevelScreen extends StatefulWidget {
  const SelectLevelScreen({Key? key}) : super(key: key);

  @override
  State<SelectLevelScreen> createState() => SelectLevelScreenState();
}

class SelectLevelScreenState extends State<SelectLevelScreen> {
  var size, height, width;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadUnlockedLevel();
    Timer(
        const Duration(milliseconds: 1),
        () => _scrollController
            .jumpTo(_scrollController.position.maxScrollExtent));
  }

  Future<void> _loadUnlockedLevel() async {
    final prefs = await SharedPreferences.getInstance();
    LevelCircleWidget.unlockedLevelNotifier.value = prefs.getInt('unlockedLevel') ?? 1;
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child:
        // Column(
        //   children: [
        //     SizedBox(
        //       height: height*0.1,
        //     ),
        //     textWidget( "Select Level",  Colors.black, const Color(0xffFFA51E),
        //         MediaQuery.of(context).size.width * 0.09, 17, "Rye"),
        //     SizedBox(
        //       height: height*0.2,
        //     ),
        //     Row(
        //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         SizedBox(
        //           // width: width*0.01,
        //         ),
        //         IconButton(
        //             onPressed: (){
        //
        //             },
        //             icon: Icon(Icons.arrow_left, color: Color(0xffFFA51E),size: 75,)
        //         ),
        //         SizedBox(
        //           width: width*0.01,
        //         ),
        //         Container(
        //           height: height*0.5,
        //           width: width*0.7,
        //           color: Color(0xffFFA51E),
        //         ),
        //         SizedBox(
        //           width: width*0.01,
        //         ),
        //         IconButton(
        //             onPressed: (){
        //
        //             },
        //             icon: Icon(Icons.arrow_right, color: Color(0xffFFA51E),size: 75,)
        //         ),
        //         SizedBox(
        //           width: width*0.01,
        //         ),
        //       ],
        //     )
        //   ],
        // ),
        SingleChildScrollView(
          controller: _scrollController,
          child: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    // Image.asset("assets/images/path2.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                  ],
                ),
              ),
              Positioned(
                bottom: 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                levelNumber: 1,
              )),
              Positioned(
                  bottom: 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 2,
                  )),
              Positioned(
                  bottom: 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 3,
                  )),
              Positioned(
                  bottom: 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 4,
                  )),
              Positioned(
                  bottom: 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 5,
                  )),
              Positioned(
                  bottom: 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 6,
                  )),
              Positioned(
                  bottom: 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 7,
                  )),
              Positioned(
                  bottom: 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 8,
                  )),

              Positioned(
                  bottom: 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 9,
                  )),
              Positioned(
                  bottom: 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 10,
                  )),
              Positioned(
                  bottom: 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 11,
                  )),
              Positioned(
                  bottom: 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 12,
                  )),
              Positioned(
                  bottom: 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 13,
                  )),
              Positioned(
                  bottom: 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 14,
                  )),
              Positioned(
                  bottom: 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 15,
                  )),

              /// 2nd

              Positioned(
                  bottom: 1340 + 80/*height*1.572*/,
                  left: width*0.51,
                  child: const LevelCircleWidget(
                    levelNumber: 16,
                  )),
              Positioned(
                  bottom: 1340 +150/*height*1.572*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 17,
                  )),

              Positioned(
                  bottom: 1340 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 18,
                  )),
              Positioned(
                  bottom: 1340 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 19,
                  )),
              Positioned(
                  bottom: 1340 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 20,
                  )),
              Positioned(
                  bottom: 1340 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 21,
                  )),
              Positioned(
                  bottom: 1340 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 22,
                  )),
              Positioned(
                  bottom: 1340 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 23,
                  )),

              Positioned(
                  bottom: 1340 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 24,
                  )),
              Positioned(
                  bottom: 1340 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 25,
                  )),
              Positioned(
                  bottom: 1340 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 26,
                  )),
              Positioned(
                  bottom: 1340 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 27,
                  )),
              Positioned(
                  bottom: 1340 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 28,
                  )),
              Positioned(
                  bottom: 1340 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 29,
                  )),
              Positioned(
                  bottom: 1340 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 30,
                  )),

              /// 3rd

              Positioned(
                  bottom: 2670 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 31,
                  )),
              Positioned(
                  bottom: 2670 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 32,
                  )),
              Positioned(
                  bottom: 2670 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 33,
                  )),
              Positioned(
                  bottom: 2670 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 34,
                  )),
              Positioned(
                  bottom: 2670 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 35,
                  )),
              Positioned(
                  bottom: 2670 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 36,
                  )),
              Positioned(
                  bottom: 2670 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 37,
                  )),
              Positioned(
                  bottom: 2670 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 38,
                  )),

              Positioned(
                  bottom: 2670 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 39,
                  )),
              Positioned(
                  bottom: 2670 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 40,
                  )),
              Positioned(
                  bottom: 2670 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 41,
                  )),
              Positioned(
                  bottom: 2670 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 42,
                  )),
              Positioned(
                  bottom: 2670 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 43,
                  )),
              Positioned(
                  bottom: 2670 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 44,
                  )),
              Positioned(
                  bottom: 2670 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 45,
                  )),

              /// 4th

              Positioned(
                  bottom: 4000 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 46,
                  )),
              Positioned(
                  bottom: 4000 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 47,
                  )),
              Positioned(
                  bottom: 4000 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 48,
                  )),
              Positioned(
                  bottom: 4000 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 49,
                  )),
              Positioned(
                  bottom: 4000 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 50,
                  )),
              Positioned(
                  bottom: 4000 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 51,
                  )),
              Positioned(
                  bottom: 4000 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 52,
                  )),
              Positioned(
                  bottom: 4000 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 53,
                  )),

              Positioned(
                  bottom: 4000 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 54,
                  )),
              Positioned(
                  bottom: 4000 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 55,
                  )),
              Positioned(
                  bottom: 4000 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 56,
                  )),
              Positioned(
                  bottom: 4000 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 57,
                  )),
              Positioned(
                  bottom: 4000 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 58,
                  )),
              Positioned(
                  bottom: 4000 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 59,
                  )),
              Positioned(
                  bottom: 4000 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 60,
                  )),


              /// 5th


              Positioned(
                  bottom: 5330 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 61,
                  )),
              Positioned(
                  bottom: 5330 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 62,
                  )),
              Positioned(
                  bottom: 5330 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 63,
                  )),
              Positioned(
                  bottom: 5330 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 64,
                  )),
              Positioned(
                  bottom: 5330 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 65,
                  )),
              Positioned(
                  bottom: 5330 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 66,
                  )),
              Positioned(
                  bottom: 5330 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 67,
                  )),
              Positioned(
                  bottom: 5330 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 68,
                  )),

              Positioned(
                  bottom: 5330 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 69,
                  )),
              Positioned(
                  bottom: 5330 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 70,
                  )),
              Positioned(
                  bottom: 5330 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 71,
                  )),
              Positioned(
                  bottom: 5330 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 72,
                  )),
              Positioned(
                  bottom: 5330 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 73,
                  )),
              Positioned(
                  bottom: 5330 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 74,
                  )),
              Positioned(
                  bottom: 5330 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 75,
                  )),

              /// 6th


              Positioned(
                  bottom: 6670 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 76,
                  )),
              Positioned(
                  bottom: 6670 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 77,
                  )),
              Positioned(
                  bottom: 6670 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 78,
                  )),
              Positioned(
                  bottom: 6670 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 79,
                  )),
              Positioned(
                  bottom: 6670 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 80,
                  )),
              Positioned(
                  bottom: 6670 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 81,
                  )),
              Positioned(
                  bottom: 6670 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 82,
                  )),
              Positioned(
                  bottom: 6670 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 83,
                  )),

              Positioned(
                  bottom: 6670 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 84,
                  )),
              Positioned(
                  bottom: 6670 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 85,
                  )),
              Positioned(
                  bottom: 6670 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 86,
                  )),
              Positioned(
                  bottom: 6670 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 87,
                  )),
              Positioned(
                  bottom: 6670 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 88,
                  )),
              Positioned(
                  bottom: 6670 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 89,
                  )),
              Positioned(
                  bottom: 6670 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 90,
                  )),

              /// 7th


              Positioned(
                  bottom: 8000 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 91,
                  )),
              Positioned(
                  bottom: 8000 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 92,
                  )),
              Positioned(
                  bottom: 8000 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 93,
                  )),
              Positioned(
                  bottom: 8000 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 94,
                  )),
              Positioned(
                  bottom: 8000 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 95,
                  )),
              Positioned(
                  bottom: 8000 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 96,
                  )),
              Positioned(
                  bottom: 8000 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 97,
                  )),
              Positioned(
                  bottom: 8000 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 98,
                  )),

              Positioned(
                  bottom: 8000 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 99,
                  )),
              Positioned(
                  bottom: 8000 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 100,
                  )),
              Positioned(
                  bottom: 8000 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 101,
                  )),
              Positioned(
                  bottom: 8000 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 102,
                  )),
              Positioned(
                  bottom: 8000 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 103,
                  )),
              Positioned(
                  bottom: 8000 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 104,
                  )),
              Positioned(
                  bottom: 8000 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 105,
                  )),

              /// 8th


              Positioned(
                  bottom: 9330 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 106,
                  )),
              Positioned(
                  bottom: 9330 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 107,
                  )),
              Positioned(
                  bottom: 9330 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 108,
                  )),
              Positioned(
                  bottom: 9330 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 109,
                  )),
              Positioned(
                  bottom: 9330 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 110,
                  )),
              Positioned(
                  bottom: 9330 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 111,
                  )),
              Positioned(
                  bottom: 9330 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 112,
                  )),
              Positioned(
                  bottom: 9330 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 113,
                  )),

              Positioned(
                  bottom: 9330 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 114,
                  )),
              Positioned(
                  bottom: 9330 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 115,
                  )),
              Positioned(
                  bottom: 9330 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 116,
                  )),
              Positioned(
                  bottom: 9330 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 117,
                  )),
              Positioned(
                  bottom: 9330 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 118,
                  )),
              Positioned(
                  bottom: 9330 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 119,
                  )),
              Positioned(
                  bottom: 9330 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 120,
                  )),

              /// 9th


              Positioned(
                  bottom: 10670 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 121,
                  )),
              Positioned(
                  bottom: 10670 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 122,
                  )),
              Positioned(
                  bottom: 10670 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 123,
                  )),
              Positioned(
                  bottom: 10670 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 124,
                  )),
              Positioned(
                  bottom: 10670 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 125,
                  )),
              Positioned(
                  bottom: 10670 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 126,
                  )),
              Positioned(
                  bottom: 10670 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 127,
                  )),
              Positioned(
                  bottom: 10670 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 128,
                  )),

              Positioned(
                  bottom: 10670 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 129,
                  )),
              Positioned(
                  bottom: 10670 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 130,
                  )),
              Positioned(
                  bottom: 10670 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 131,
                  )),
              Positioned(
                  bottom: 10670 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 132,
                  )),
              Positioned(
                  bottom: 10670 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 133,
                  )),
              Positioned(
                  bottom: 10670 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 134,
                  )),
              Positioned(
                  bottom: 10670 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 135,
                  )),

              /// 10th


              Positioned(
                  bottom: 12010 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 136,
                  )),
              Positioned(
                  bottom: 12010 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 137,
                  )),
              Positioned(
                  bottom: 12010 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 138,
                  )),
              Positioned(
                  bottom: 12010 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 139,
                  )),
              Positioned(
                  bottom: 12010 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 140,
                  )),
              Positioned(
                  bottom: 12010 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 141,
                  )),
              Positioned(
                  bottom: 12010 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 142,
                  )),
              Positioned(
                  bottom: 12010 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 143,
                  )),

              Positioned(
                  bottom: 12010 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 144,
                  )),
              Positioned(
                  bottom: 12010 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 145,
                  )),
              Positioned(
                  bottom: 12010 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 146,
                  )),
              Positioned(
                  bottom: 12010 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 147,
                  )),
              Positioned(
                  bottom: 12010 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 148,
                  )),
              Positioned(
                  bottom: 12010 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 149,
                  )),
              Positioned(
                  bottom: 12010 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 150,
                  )),


              /// 11 th
              Positioned(
                  bottom: 13340 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 151,
                  )),
              Positioned(
                  bottom: 13340 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 152,
                  )),
              Positioned(
                  bottom: 13340 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 153,
                  )),
              Positioned(
                  bottom: 13340 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 154,
                  )),
              Positioned(
                  bottom: 13340 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 155,
                  )),
              Positioned(
                  bottom: 13340 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 156,
                  )),
              Positioned(
                  bottom: 13340 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 157,
                  )),
              Positioned(
                  bottom: 13340 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 158,
                  )),

              Positioned(
                  bottom: 13340 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 159,
                  )),
              Positioned(
                  bottom: 13340 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 160,
                  )),
              Positioned(
                  bottom: 13340 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 161,
                  )),
              Positioned(
                  bottom: 13340 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 162,
                  )),
              Positioned(
                  bottom: 13340 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 163,
                  )),
              Positioned(
                  bottom: 13340 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 164,
                  )),
              Positioned(
                  bottom: 13340 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 165,
                  )),


              /// 12 th
              Positioned(
                  bottom: 14670 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 166,
                  )),
              Positioned(
                  bottom: 14670 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 167,
                  )),
              Positioned(
                  bottom: 14670 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 168,
                  )),
              Positioned(
                  bottom: 14670 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 169,
                  )),
              Positioned(
                  bottom: 14670 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 170,
                  )),
              Positioned(
                  bottom: 14670 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 171,
                  )),
              Positioned(
                  bottom: 14670 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 172,
                  )),
              Positioned(
                  bottom: 14670 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 173,
                  )),

              Positioned(
                  bottom: 14670 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 174,
                  )),
              Positioned(
                  bottom: 14670 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 175,
                  )),
              Positioned(
                  bottom: 14670 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 176,
                  )),
              Positioned(
                  bottom: 14670 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 177,
                  )),
              Positioned(
                  bottom: 14670 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 178,
                  )),
              Positioned(
                  bottom: 14670 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 179,
                  )),
              Positioned(
                  bottom: 14670 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 180,
                  )),

              /// 13 th
              Positioned(
                  bottom: 16000 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 181,
                  )),
              Positioned(
                  bottom: 16000 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 182,
                  )),
              Positioned(
                  bottom: 16000 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 183,
                  )),
              Positioned(
                  bottom: 16000 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 184,
                  )),
              Positioned(
                  bottom: 16000 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 185,
                  )),
              Positioned(
                  bottom: 16000 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 186,
                  )),
              Positioned(
                  bottom: 16000 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 187,
                  )),
              Positioned(
                  bottom: 16000 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 188,
                  )),

              Positioned(
                  bottom: 16000 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 189,
                  )),
              Positioned(
                  bottom: 16000 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 190,
                  )),
              Positioned(
                  bottom: 16000 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 191,
                  )),
              Positioned(
                  bottom: 16000 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 192,
                  )),
              Positioned(
                  bottom: 16000 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 193,
                  )),
              Positioned(
                  bottom: 16000 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 194,
                  )),
              Positioned(
                  bottom: 16000 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 195,
                  )),

              /// 14 th
              Positioned(
                  bottom: 17330 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 196,
                  )),
              Positioned(
                  bottom: 17330 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 197,
                  )),
              Positioned(
                  bottom: 17330 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 198,
                  )),
              Positioned(
                  bottom: 17330 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 199,
                  )),
              Positioned(
                  bottom: 17330 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 200,
                  )),
              Positioned(
                  bottom: 17330 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 201,
                  )),
              Positioned(
                  bottom: 17330 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 202,
                  )),
              Positioned(
                  bottom: 17330 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 203,
                  )),

              Positioned(
                  bottom: 17330 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 204,
                  )),
              Positioned(
                  bottom: 17330 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 205,
                  )),
              Positioned(
                  bottom: 17330 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 206,
                  )),
              Positioned(
                  bottom: 17330 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 207,
                  )),
              Positioned(
                  bottom: 17330 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 208,
                  )),
              Positioned(
                  bottom: 17330 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 209,
                  )),
              Positioned(
                  bottom: 17330 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 210,
                  )),

              /// 15 th
              Positioned(
                  bottom: 18660 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 211,
                  )),
              Positioned(
                  bottom: 18660 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 212,
                  )),
              Positioned(
                  bottom: 18660 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 213,
                  )),
              Positioned(
                  bottom: 18660 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 214,
                  )),
              Positioned(
                  bottom: 18660 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 215,
                  )),
              Positioned(
                  bottom: 18660 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 216,
                  )),
              Positioned(
                  bottom: 18660 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 217,
                  )),
              Positioned(
                  bottom: 18660 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 218,
                  )),

              Positioned(
                  bottom: 18660 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 219,
                  )),
              Positioned(
                  bottom: 18660 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 220,
                  )),
              Positioned(
                  bottom: 18660 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 221,
                  )),
              Positioned(
                  bottom: 18660 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 222,
                  )),
              Positioned(
                  bottom: 18660 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 223,
                  )),
              Positioned(
                  bottom: 18660 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 224,
                  )),
              Positioned(
                  bottom: 18660 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 225,
                  )),

              /// 16 th
              Positioned(
                  bottom: 20000 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 226,
                  )),
              Positioned(
                  bottom: 19990 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 227,
                  )),
              Positioned(
                  bottom: 20000 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 228,
                  )),
              Positioned(
                  bottom: 20000 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 229,
                  )),
              Positioned(
                  bottom: 20000 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 230,
                  )),
              Positioned(
                  bottom: 20000 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 231,
                  )),
              Positioned(
                  bottom: 20000 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 232,
                  )),
              Positioned(
                  bottom: 20000 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 233,
                  )),

              Positioned(
                  bottom: 20000 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 234,
                  )),
              Positioned(
                  bottom: 20000 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 235,
                  )),
              Positioned(
                  bottom: 20000 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 236,
                  )),
              Positioned(
                  bottom: 20000 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 237,
                  )),
              Positioned(
                  bottom: 20000 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 238,
                  )),
              Positioned(
                  bottom: 20000 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 239,
                  )),
              Positioned(
                  bottom: 20000 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 240,
                  )),

              /// 16 th
              Positioned(
                  bottom: 20000 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 226,
                  )),
              Positioned(
                  bottom: 19990 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 227,
                  )),
              Positioned(
                  bottom: 20000 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 228,
                  )),
              Positioned(
                  bottom: 20000 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 229,
                  )),
              Positioned(
                  bottom: 20000 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 230,
                  )),
              Positioned(
                  bottom: 20000 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 231,
                  )),
              Positioned(
                  bottom: 20000 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 232,
                  )),
              Positioned(
                  bottom: 20000 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 233,
                  )),

              Positioned(
                  bottom: 20000 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 234,
                  )),
              Positioned(
                  bottom: 20000 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 235,
                  )),
              Positioned(
                  bottom: 20000 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 236,
                  )),
              Positioned(
                  bottom: 20000 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 237,
                  )),
              Positioned(
                  bottom: 20000 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 238,
                  )),
              Positioned(
                  bottom: 20000 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 239,
                  )),
              Positioned(
                  bottom: 20000 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 240,
                  )),

              /// 17 th
              Positioned(
                  bottom: 21340 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 241,
                  )),
              Positioned(
                  bottom: 21340 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 242,
                  )),
              Positioned(
                  bottom: 21340 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 243,
                  )),
              Positioned(
                  bottom: 21340 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 244,
                  )),
              Positioned(
                  bottom: 21340 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 245,
                  )),
              Positioned(
                  bottom: 21340 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 246,
                  )),
              Positioned(
                  bottom: 21340 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 247,
                  )),
              Positioned(
                  bottom: 21340 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 248,
                  )),

              Positioned(
                  bottom: 21340 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 249,
                  )),
              Positioned(
                  bottom: 21340 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 250,
                  )),
              Positioned(
                  bottom: 21340 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 251,
                  )),
              Positioned(
                  bottom: 21340 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 252,
                  )),
              Positioned(
                  bottom: 21340 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 253,
                  )),
              Positioned(
                  bottom: 21340 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 254,
                  )),
              Positioned(
                  bottom: 21340 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 255,
                  )),

              /// 18 th
              Positioned(
                  bottom: 22680 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 256,
                  )),
              Positioned(
                  bottom: 22680 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 257,
                  )),
              Positioned(
                  bottom: 22680 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 258,
                  )),
              Positioned(
                  bottom: 22680 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 259,
                  )),
              Positioned(
                  bottom: 22680 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 260,
                  )),
              Positioned(
                  bottom: 22680 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 261,
                  )),
              Positioned(
                  bottom: 22680 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 262,
                  )),
              Positioned(
                  bottom: 22680 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 263,
                  )),

              Positioned(
                  bottom: 22680 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 264,
                  )),
              Positioned(
                  bottom: 22680 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 265,
                  )),
              Positioned(
                  bottom: 22680 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 266,
                  )),
              Positioned(
                  bottom: 22680 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 267,
                  )),
              Positioned(
                  bottom: 22680 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 268,
                  )),
              Positioned(
                  bottom: 22680 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 269,
                  )),
              Positioned(
                  bottom: 22680 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 270,
                  )),

              /// 19 th
              Positioned(
                  bottom: 24020 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 271,
                  )),
              Positioned(
                  bottom: 24020 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 272,
                  )),
              Positioned(
                  bottom: 24020 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 273,
                  )),
              Positioned(
                  bottom: 24020 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 274,
                  )),
              Positioned(
                  bottom: 24020 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 275,
                  )),
              Positioned(
                  bottom: 24020 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 276,
                  )),
              Positioned(
                  bottom: 24020 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 277,
                  )),
              Positioned(
                  bottom: 24020 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 278,
                  )),

              Positioned(
                  bottom: 24020 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 279,
                  )),
              Positioned(
                  bottom: 24020 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 280,
                  )),
              Positioned(
                  bottom: 24020 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 281,
                  )),
              Positioned(
                  bottom: 24020 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 282,
                  )),
              Positioned(
                  bottom: 24020 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 283,
                  )),
              Positioned(
                  bottom: 24020 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 284,
                  )),
              Positioned(
                  bottom: 24020 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 285,
                  )),

              /// 20 th
              Positioned(
                  bottom: 25360 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 286,
                  )),
              Positioned(
                  bottom: 25360 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 287,
                  )),
              Positioned(
                  bottom: 25360 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 288,
                  )),
              Positioned(
                  bottom: 25360 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 289,
                  )),
              Positioned(
                  bottom: 25360 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 290,
                  )),
              Positioned(
                  bottom: 25360 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 291,
                  )),
              Positioned(
                  bottom: 25360 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 292,
                  )),
              Positioned(
                  bottom: 25360 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 293,
                  )),

              Positioned(
                  bottom: 25360 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 294,
                  )),
              Positioned(
                  bottom: 25360 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 295,
                  )),
              Positioned(
                  bottom: 25360 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 296,
                  )),
              Positioned(
                  bottom: 25360 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 297,
                  )),
              Positioned(
                  bottom: 25360 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 298,
                  )),
              Positioned(
                  bottom: 25360 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 299,
                  )),
              Positioned(
                  bottom: 25360 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 300,
                  )),

              /// 21 th
              Positioned(
                  bottom: 26700 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 301,
                  )),
              Positioned(
                  bottom: 26700 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 302,
                  )),
              Positioned(
                  bottom: 26700 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 303,
                  )),
              Positioned(
                  bottom: 26700 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 304,
                  )),
              Positioned(
                  bottom: 26700 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 305,
                  )),
              Positioned(
                  bottom: 26700 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 306,
                  )),
              Positioned(
                  bottom: 26700 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 307,
                  )),
              Positioned(
                  bottom: 26700 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 308,
                  )),

              Positioned(
                  bottom: 26700 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 309,
                  )),
              Positioned(
                  bottom: 26700 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 310,
                  )),
              Positioned(
                  bottom: 26700 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 311,
                  )),
              Positioned(
                  bottom: 26700 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 312,
                  )),
              Positioned(
                  bottom: 26700 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 313,
                  )),
              Positioned(
                  bottom: 26700 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 314,
                  )),
              Positioned(
                  bottom: 26700 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 315,
                  )),

              /// 22 th
              Positioned(
                  bottom: 28040 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 316,
                  )),
              Positioned(
                  bottom: 28040 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 317,
                  )),
              Positioned(
                  bottom: 28040 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 318,
                  )),
              Positioned(
                  bottom: 28040 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 319,
                  )),
              Positioned(
                  bottom: 28040 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 320,
                  )),
              Positioned(
                  bottom: 28040 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 321,
                  )),
              Positioned(
                  bottom: 28040 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 322,
                  )),
              Positioned(
                  bottom: 28040 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 323,
                  )),

              Positioned(
                  bottom: 28040 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 324,
                  )),
              Positioned(
                  bottom: 28040 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 325,
                  )),
              Positioned(
                  bottom: 28040 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 326,
                  )),
              Positioned(
                  bottom: 28040 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 327,
                  )),
              Positioned(
                  bottom: 28040 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 328,
                  )),
              Positioned(
                  bottom: 28040 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 329,
                  )),
              Positioned(
                  bottom: 28040 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 330,
                  )),

              /// 23 th
              Positioned(
                  bottom: 29350 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 331,
                  )),
              Positioned(
                  bottom: 29350 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 332,
                  )),
              Positioned(
                  bottom: 29350 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 333,
                  )),
              Positioned(
                  bottom: 29350 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 334,
                  )),
              Positioned(
                  bottom: 29350 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 335,
                  )),
              Positioned(
                  bottom: 29350 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 336,
                  )),
              Positioned(
                  bottom: 29350 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 337,
                  )),
              Positioned(
                  bottom: 29350 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 338,
                  )),

              Positioned(
                  bottom: 29350 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 339,
                  )),
              Positioned(
                  bottom: 29350 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 340,
                  )),
              Positioned(
                  bottom: 29350 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 341,
                  )),
              Positioned(
                  bottom: 29350 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 342,
                  )),
              Positioned(
                  bottom: 29350 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 343,
                  )),
              Positioned(
                  bottom: 29350 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 344,
                  )),
              Positioned(
                  bottom: 29350 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 345,
                  )),

              /// 24 th
              Positioned(
                  bottom: 30690 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 346,
                  )),
              Positioned(
                  bottom: 30690 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 347,
                  )),
              Positioned(
                  bottom: 30690 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 348,
                  )),
              Positioned(
                  bottom: 30690 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 349,
                  )),
              Positioned(
                  bottom: 30690 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 350,
                  )),
              Positioned(
                  bottom: 30690 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 351,
                  )),
              Positioned(
                  bottom: 30690 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 352,
                  )),
              Positioned(
                  bottom: 30690 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 353,
                  )),

              Positioned(
                  bottom: 30690 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 354,
                  )),
              Positioned(
                  bottom: 30690 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 355,
                  )),
              Positioned(
                  bottom: 30690 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 356,
                  )),
              Positioned(
                  bottom: 30690 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 347,
                  )),
              Positioned(
                  bottom: 30690 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 348,
                  )),
              Positioned(
                  bottom: 30690 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 349,
                  )),
              Positioned(
                  bottom: 30690 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 350,
                  )),
              /// 25 th
              Positioned(
                  bottom: 32010 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 351,
                  )),
              Positioned(
                  bottom: 32010 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 352,
                  )),
              Positioned(
                  bottom: 32010 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 353,
                  )),
              Positioned(
                  bottom: 32010 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 354,
                  )),
              Positioned(
                  bottom: 32010 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 355,
                  )),
              Positioned(
                  bottom: 32010 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 356,
                  )),
              Positioned(
                  bottom: 32010 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 357,
                  )),
              Positioned(
                  bottom: 32010 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 358,
                  )),

              Positioned(
                  bottom: 32010 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 359,
                  )),
              Positioned(
                  bottom: 32010 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 360,
                  )),
              Positioned(
                  bottom: 32010 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 361,
                  )),
              Positioned(
                  bottom: 32010 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 362,
                  )),
              Positioned(
                  bottom: 32010 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 363,
                  )),
              Positioned(
                  bottom: 32010 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 364,
                  )),
              Positioned(
                  bottom: 32010 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 365,
                  )),


              /// 26 th
              Positioned(
                  bottom: 33330 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 366,
                  )),
              Positioned(
                  bottom: 33330 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 367,
                  )),
              Positioned(
                  bottom: 33330 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 368,
                  )),
              Positioned(
                  bottom: 33330 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 369,
                  )),
              Positioned(
                  bottom: 33330 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 370,
                  )),
              Positioned(
                  bottom: 33330 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 371,
                  )),
              Positioned(
                  bottom: 33330 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 372,
                  )),
              Positioned(
                  bottom: 33330 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 373,
                  )),

              Positioned(
                  bottom: 33330 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 374,
                  )),
              Positioned(
                  bottom: 33330 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 375,
                  )),
              Positioned(
                  bottom: 33330 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 376,
                  )),
              Positioned(
                  bottom: 33330 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 377,
                  )),
              Positioned(
                  bottom: 33330 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 378,
                  )),
              Positioned(
                  bottom: 33330 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 379,
                  )),
              Positioned(
                  bottom: 33330 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 380,
                  )),


              /// 27 th
              Positioned(
                  bottom: 34670 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 381,
                  )),
              Positioned(
                  bottom: 34670 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 382,
                  )),
              Positioned(
                  bottom: 34670 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 383,
                  )),
              Positioned(
                  bottom: 34670 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 384,
                  )),
              Positioned(
                  bottom: 34670 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 385,
                  )),
              Positioned(
                  bottom: 34670 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 386,
                  )),
              Positioned(
                  bottom: 34670 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 387,
                  )),
              Positioned(
                  bottom: 34670 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 388,
                  )),

              Positioned(
                  bottom: 34670 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 389,
                  )),
              Positioned(
                  bottom: 34670 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 390,
                  )),
              Positioned(
                  bottom: 34670 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 391,
                  )),
              Positioned(
                  bottom: 34670 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 392,
                  )),
              Positioned(
                  bottom: 34670 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 393,
                  )),
              Positioned(
                  bottom: 34670 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 394,
                  )),
              Positioned(
                  bottom: 34670 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 395,
                  )),


              /// grasses

              Positioned(
                  bottom: height*0.4,
                  left: width*0.6,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),
              Positioned(
                  bottom: height*0.7,
                  right: width*0.6,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),
              Positioned(
                  bottom: height*1.3,
                  left: width*0.5,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),
              Positioned(
                  bottom: height*1.8,
                  left: width*0.6,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),
              Positioned(
                  bottom: height*5.98,
                  right: width*0.47,
                  child: Image.asset("assets/images/stone.png", width: 150, height: 150,)),
              //72
              Positioned(
                  bottom: 6300,
                  left: width*0.47,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),
              //60
              Positioned(
                  bottom: 5260,
                  right: width*0.47,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),
              //51
              Positioned(
                  bottom: 5000,
                  left: width*0.47,
                  child: Image.asset("assets/images/stone.png", width: 150, height: 150,)),
              //45
              Positioned(
                  bottom: 3900,
                  right: width*0.47,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),
              //42
              Positioned(
                  bottom: 3550,
                  left: width*0.47,
                  child: Image.asset("assets/images/stone.png", width: 150, height: 150,)),
              //38
              Positioned(
                  bottom: 3250,
                  left: width*0.5,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),
              //30
              Positioned(
                  bottom: 2600,
                  right: width*0.47,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),
              //27
              Positioned(
                  bottom: 2350,
                  left: width*0.47,
                  child: Image.asset("assets/images/stone.png", width: 150, height: 150,)),

              //15
              Positioned(
                  bottom: 1260,
                  right: width*0.48,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),

              //12
              Positioned(
                  bottom: 1010,
                  left: width*0.48,
                  child: Image.asset("assets/images/stone.png", width: 150, height: 150,)),


              Positioned(
                bottom: 0.0,
                child: SizedBox(
                  width: width,
                  height: height * 0.11,
                  child: Image.asset(
                    "assets/images/grass.png",
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

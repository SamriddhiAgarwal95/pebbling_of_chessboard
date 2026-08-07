import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pebbling_chessboard/widgets/level_circle.dart';

class SelectLevelScreen extends StatefulWidget {
  const SelectLevelScreen({Key? key}) : super(key: key);

  @override
  State<SelectLevelScreen> createState() => SelectLevelScreenState();
}

class SelectLevelScreenState extends State<SelectLevelScreen> {
  var size, height, width;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Scroll to the bottom (Level 1)
    Timer(
        const Duration(milliseconds: 100),
        () {
          if (_scrollController.hasClients) {
            _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    // Original positions for levels 1-15
    final List<double> bottoms = [80, 150, 225, 280, 350, 420, 510, 600, 680, 750, 850, 950, 1080, 1150, 1260];
    final List<double> lefts = [0.51, 0.3, 0.546, 0.3, 0.5, 0.27, 0.49, 0.3, 0.47, 0.27, 0.468, 0.32, 0.25, 0.5, 0.46];
    
    // Batch offsets to match the original vertical structure
    final List<double> batchOffsets = List.generate(27, (index) => index * 1335.0);

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
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Stack(
            children: [
              // 1. Path Background layer
              Center(
                child: Column(
                  children: List.generate(27, (index) => Image.asset("assets/images/path2_new.png")),
                ),
              ),

              // 2. Decorative Elements layer (Rendered before level circles so icons stay on top)
              Positioned(bottom: height*0.4, left: width*0.6, child: Image.asset("assets/images/stone.png", width: 250, height: 250)),
              Positioned(bottom: height*0.7, right: width*0.6, child: Image.asset("assets/images/stone.png", width: 250, height: 250)),
              Positioned(bottom: height*1.3, left: width*0.5, child: Image.asset("assets/images/stone.png", width: 250, height: 250)),
              Positioned(bottom: height*1.8, left: width*0.6, child: Image.asset("assets/images/stone.png", width: 250, height: 250)),
              Positioned(bottom: height*5.98, right: width*0.47, child: Image.asset("assets/images/stone.png", width: 150, height: 150)),
              Positioned(bottom: 6300, left: width*0.47, child: Image.asset("assets/images/stone.png", width: 250, height: 250)),
              Positioned(bottom: 5260, right: width*0.47, child: Image.asset("assets/images/stone.png", width: 250, height: 250)),
              Positioned(bottom: 5000, left: width*0.47, child: Image.asset("assets/images/stone.png", width: 150, height: 150)),
              Positioned(bottom: 3900, right: width*0.47, child: Image.asset("assets/images/stone.png", width: 250, height: 250)),
              Positioned(bottom: 3550, left: width*0.47, child: Image.asset("assets/images/stone.png", width: 150, height: 150)),
              Positioned(bottom: 3250, left: width*0.5, child: Image.asset("assets/images/stone.png", width: 250, height: 250)),
              Positioned(bottom: 2600, right: width*0.47, child: Image.asset("assets/images/stone.png", width: 250, height: 250)),
              Positioned(bottom: 2350, left: width*0.47, child: Image.asset("assets/images/stone.png", width: 150, height: 150)),
              Positioned(bottom: 1260, right: width*0.48, child: Image.asset("assets/images/stone.png", width: 250, height: 250)),
              Positioned(bottom: 1010, left: width*0.48, child: Image.asset("assets/images/stone.png", width: 150, height: 150)),
              Positioned(
                bottom: 0.0,
                child: SizedBox(
                  width: width,
                  height: height * 0.11,
                  child: Image.asset("assets/images/grass.png", fit: BoxFit.cover),
                ),
              ),

              // 3. Level Circles layer (Rendered last for full clickability)
              ...List.generate(395, (index) {
                int levelNum = index + 1;
                int batchIndex = index ~/ 15;
                int innerIndex = index % 15;
                
                if (batchIndex >= batchOffsets.length) return const SizedBox();

                return Positioned(
                  bottom: batchOffsets[batchIndex] + bottoms[innerIndex],
                  left: width * lefts[innerIndex],
                  child: LevelCircleWidget(levelNumber: levelNum),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

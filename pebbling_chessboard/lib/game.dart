import 'package:flutter/material.dart';
import 'package:pebbling_chessboard/prison/prison.dart';
import 'package:pebbling_chessboard/widgets/TextWidget.dart';
import 'package:pebbling_chessboard/widgets/background.dart';

class GamePage extends StatefulWidget {
  final int level;
  const GamePage({Key? key, required this.level}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late List<int> haveClone;
  var size, height, width;
  int moves = 0;
  int position = 1; 
  bool hasWon = false;

  @override
  void initState() {
    super.initState();
    // Grid: 8x8 (64) for levels 1-10, 15x8 (120) for levels 11+
    haveClone = widget.level > 10 ? List.generate(120, (index) => 0) : List.generate(64, (index) => 0);
    _initializeLevel();
  }

  void _initializeLevel() {
    moves = 30; 
    hasWon = false;
    position = 1;

    // Levels 1-10 initialization (strictly same as original)
    if (widget.level <= 6) { 
      haveClone[56] = 1; 
    } else if (widget.level == 7 || widget.level == 8) { 
      haveClone[57] = 1; haveClone[48] = 1; 
    } else if (widget.level == 9) { 
      haveClone[56] = 1; haveClone[57] = 1; 
    } else if (widget.level == 10) { 
      haveClone[56] = 1; haveClone[48] = 1; 
    } 
    // Levels 11-15 initialization
    else if (widget.level == 11) {
      haveClone[112] = 1;
    } else if (widget.level == 12) {
      haveClone[112] = 1; haveClone[113] = 1;
    } else if (widget.level == 13) {
      haveClone[112] = 1; haveClone[97] = 1;
    } else if (widget.level == 14) {
      haveClone[112] = 1; haveClone[113] = 1; haveClone[97] = 1; haveClone[98] = 1;
    } else if (widget.level == 15) {
      haveClone[111] = 1; haveClone[112] = 1; haveClone[113] = 1;
    } 
    else {
      if (widget.level > 10) {
        haveClone[112] = 1;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
        appBar: AppBar(
          title: textWidget("Level ${widget.level}", Colors.white, Colors.white, width * 0.08, 1, "Sans Francisco"),
          backgroundColor: Colors.black,
          elevation: 0,
          automaticallyImplyLeading: true,
        ),
        body: Container(
          height: height, width: width,
          child: BackgroundWidget(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: widget.level > 10 ? 10 : height * 0.1),
                    SizedBox(
                        width: widget.level > 10 ? 900 : 400,
                        height: widget.level > 10 ? 500 : 400,
                        child: Center(
                          child: Stack(
                            children: [
                              AspectRatio(
                                aspectRatio: 1.0,
                                child: widget.level > 10
                                    ? Image.asset('assets/images/board3.jpeg', fit: BoxFit.fill)
                                    : Image.asset("images/orange_board.png", package: 'flutter_chess_board', fit: BoxFit.cover),
                              ),
                              Positioned(
                                left: _getCageLeftOffset(width),
                                bottom: 0,
                                child: Prison().getPrison(widget.level),
                              ),
                              AspectRatio(aspectRatio: 1.0, child: _buildGridView()),
                              
                              // Victory message overlay
                              if (hasWon && widget.level <= 15)
                                Center(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: textWidget("YOU WON!", const Color(0xffFFA51E), Colors.black, 60, 3, "Rye"),
                                  ),
                                ),
                            ],
                          ),
                        )),
                    const SizedBox(height: 20),
                    if (widget.level > 10) _buildDirectionSwitcher(),
                    _buildMovesDisplay(width),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  double _getCageLeftOffset(double screenWidth) {
    if (widget.level <= 10) return 0;
    int pos = Prison().cagePosition(widget.level);
    switch (pos) {
      case 1: return screenWidth * 0.39;
      case 2: return screenWidth * 0.33;
      case 3: return screenWidth * 0.26;
      default: return screenWidth * 0.457;
    }
  }

  Widget _buildGridView() {
    int cols = widget.level > 10 ? 15 : 8;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: cols, childAspectRatio: widget.level > 10 ? 0.535 : 1.0),
      itemCount: haveClone.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => haveClone[index] == 1 ? _buildPebble(index, cols) : const SizedBox(),
    );
  }

  Widget _buildPebble(int index, int cols) {
    return Padding(
      padding: EdgeInsets.all(widget.level > 10 ? 2.0 : 7.0),
      child: GestureDetector(
        onTap: () => _onPebbleTap(index, cols),
        child: CircleAvatar(backgroundColor: Colors.red[800]),
      ),
    );
  }

  void _onPebbleTap(int index, int cols) {
    if (hasWon || moves <= 0) return;

    int r = index ~/ cols;
    int c = index % cols;
    int? t1, t2;

    if (widget.level <= 10) {
      if (r > 0 && c < 7) { t1 = index - 8; t2 = index + 1; }
    } else {
      if (position == 1 && r > 0 && c < cols - 1) { t1 = index - cols; t2 = index + 1; }
      else if (position == 2 && r > 0 && c > 0) { t1 = index - cols; t2 = index - 1; }
    }

    if (t1 != null && t2 != null && haveClone[t1] == 0 && haveClone[t2] == 0) {
      setState(() {
        haveClone[index] = 0;
        haveClone[t1!] = 1;
        haveClone[t2!] = 1;
        moves--;
        
        // Victory check logic
        if (widget.level >= 1 && widget.level <= 15) {
          if (_isPrisonEmpty()) {
            if (widget.level == 8) {
              Future.delayed(const Duration(milliseconds: 600), () {
                if (mounted) setState(() { hasWon = true; });
              });
            } else if (widget.level >= 11) {
              Future.delayed(const Duration(milliseconds: 100), () {
                if (mounted) setState(() { hasWon = true; });
              });
            } else {
              hasWon = true;
            }
          }
        }
      });
    }
  }

  bool _isPrisonEmpty() {
    List<int> prison = _getPrisonIndicesForLevel();
    return prison.every((idx) => haveClone[idx] == 0);
  }

  List<int> _getPrisonIndicesForLevel() {
    switch (widget.level) {
      // 1-10 logic kept same (including level 8 fix)
      case 1: return [56];
      case 2: return [56, 57];
      case 3: return [56, 48, 57];
      case 4: return [56, 48, 57, 49];
      case 5: return [56, 48, 40];
      case 6: return [56, 57, 48, 40];
      case 7: return [56, 48]; 
      case 8: return [56, 57, 58, 48, 40]; 
      case 9: return [56, 57]; 
      case 10: return [56, 48];
      // 11-15 prison indices
      case 11: return [112];
      case 12: return [112, 113];
      case 13: return [112, 97];
      case 14: return [112, 113, 97, 98];
      case 15: return [111, 112, 113];
      default: return widget.level > 10 ? [112] : [56, 48, 57];
    }
  }

  Widget _buildDirectionSwitcher() {
    return Column(
      children: [
        RawMaterialButton(
          onPressed: () => setState(() { position = position == 1 ? 2 : 1; }),
          elevation: 4.0, fillColor: Colors.white,
          shape: const CircleBorder(), padding: const EdgeInsets.all(10),
          child: Icon(position == 1 ? Icons.north_east : Icons.north_west, color: Colors.black, size: 30),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildMovesDisplay(double width) {
    return Container(
      width: width * 0.45,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          textWidget("MOVES", Colors.white, Colors.black, 14, 1, "Sans Francisco"),
          textWidget(moves.toString(), const Color(0xffFFA51E), Colors.black, 26, 1, "Sans Francisco"),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pebbling_chessboard/prison/prison.dart';
import 'package:pebbling_chessboard/widgets/TextWidget.dart';
import 'package:pebbling_chessboard/widgets/background.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    // Moves grow slightly with level, but not too much to exceed board capacity (120 cells)
    int extraMoves = widget.level > 20 ? (widget.level - 20) * 2 : 0;
    if (extraMoves > 40) extraMoves = 40; // Cap moves so player has to be strategic
    moves = 30 + extraMoves;
    hasWon = false;
    position = 1;

    // ✅ Reset all cells to 0 before placing pebbles (fixes restart & stale pebble bugs)
    for (int i = 0; i < haveClone.length; i++) {
      haveClone[i] = 0;
    }

    // Populate initial pebbles from the prison indices
    List<int> initialPebbles = _getPrisonIndicesForLevel();
    for (int idx in initialPebbles) {
      if (idx >= 0 && idx < haveClone.length) {
        haveClone[idx] = 1;
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
                              if (widget.level <= 20)
                                Positioned(
                                  left: _getCageLeftOffset(width),
                                  bottom: 0,
                                  child: Prison().getPrison(widget.level),
                                )
                              else
                                Positioned.fill(
                                  child: CustomPaint(
                                    painter: DynamicCagePainter(
                                      indices: _getPrisonIndicesForLevel(),
                                      cols: 15,
                                    ),
                                  ),
                                ),
                              AspectRatio(aspectRatio: 1.0, child: _buildGridView()),
                              
                              // Victory message overlay — shown for ALL levels
                              if (hasWon)
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
      padding: EdgeInsets.zero,
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
        
        // ✅ Victory check — works for ALL levels
        if (_isPrisonEmpty()) {
          _unlockNextLevel(widget.level + 1);
          
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
      });
    }
  }

  Future<void> _unlockNextLevel(int nextLevel) async {
    final prefs = await SharedPreferences.getInstance();
    int currentUnlocked = prefs.getInt('unlockedLevel') ?? 1;
    if (nextLevel > currentUnlocked) {
      await prefs.setInt('unlockedLevel', nextLevel);
    }
  }

  bool _isPrisonEmpty() {
    List<int> prison = _getPrisonIndicesForLevel();
    return prison.every((idx) => haveClone[idx] == 0);
  }

  List<int> _getPrisonIndicesForLevel() {
    if (widget.level <= 20) {
      switch (widget.level) {
        // Levels 1-10 (8x8 board)
        case 1: return [56];
        case 2: return [56, 57];
        case 3: return [56, 48, 57];
        case 4: return [56, 48, 57, 49];
        case 5: return [56, 48, 40];
        case 6: return [56, 57, 48, 40];
        case 7: return [56, 48]; // Aligning with the prison logic
        case 8: return [56, 57, 58, 48, 40];
        case 9: return [56, 57];
        case 10: return [56, 48];
        // Levels 11-15 (15x8 board)
        case 11: return [112];
        case 12: return [112, 113];
        case 13: return [112, 97];
        case 14: return [112, 113, 97, 98];
        case 15: return [111, 112, 113];
        // Levels 16-20
        case 16: return [112, 113, 97];
        case 17: return [112, 113, 97, 82];
        case 18: return [112, 97, 82, 98];
        case 19: return [112, 113, 97, 98];
        case 20: return [112, 113, 97, 98, 82];
        default: return widget.level > 10 ? [112] : [56, 48, 57];
      }
    } else {
      // Algorithmically generate prison for levels > 20
      // Scale complexity as requested: Easy (2-3), Medium (4-5), Hard (5-6)
      int numPebbles;
      if (widget.level <= 30) {
        numPebbles = 2 + (widget.level % 2); // Alternates 2 and 3 clones
      } else if (widget.level <= 45) {
        numPebbles = 4 + (widget.level % 2); // Alternates 4 and 5 clones
      } else {
        numPebbles = 5 + (widget.level % 2); // Alternates 5 and 6 clones
      }
      
      Set<int> prison = {112};
      // Keep shape somewhat compact but random
      List<int> candidates = [112 - 15, 112 - 1, 112 + 1]; 
      
      int seed = widget.level;
      int nextRandom() {
        seed = (seed * 1103515245 + 12345) & 0x7fffffff;
        return seed;
      }
      
      while (prison.length < numPebbles && candidates.isNotEmpty) {
        int rIdx = nextRandom() % candidates.length;
        int chosen = candidates.removeAt(rIdx);
        
        if (!prison.contains(chosen)) {
          int r = chosen ~/ 15;
          int c = chosen % 15;
          // Constrain the shape to stay in lower-middle section so player has room to split pebbles upwards
          if (r >= 4 && r <= 7 && c >= 4 && c <= 10) {
            prison.add(chosen);
            if (r > 0) candidates.add(chosen - 15);
            if (r < 7) candidates.add(chosen + 15);
            if (c > 0) candidates.add(chosen - 1);
            if (c < 14) candidates.add(chosen + 1);
          }
        }
      }
      return prison.toList();
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

class DynamicCagePainter extends CustomPainter {
  final List<int> indices;
  final int cols;

  DynamicCagePainter({required this.indices, required this.cols});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeJoin = StrokeJoin.miter
      ..strokeCap = StrokeCap.square;

    // Use 0.535 as the aspect ratio based on _buildGridView logic
    double cellWidth = size.width / cols;
    double cellHeight = cellWidth / 0.535; 

    Path path = Path();
    for (int index in indices) {
      int r = index ~/ cols;
      int c = index % cols;

      double left = c * cellWidth;
      double top = r * cellHeight;
      double right = (c + 1) * cellWidth;
      double bottom = (r + 1) * cellHeight;

      if (!indices.contains(index - cols)) {
        path.moveTo(left, top);
        path.lineTo(right, top);
      }
      if (!indices.contains(index + cols)) {
        path.moveTo(left, bottom);
        path.lineTo(right, bottom);
      }
      if (!indices.contains(index - 1) || c == 0) {
        path.moveTo(left, top);
        path.lineTo(left, bottom);
      }
      if (!indices.contains(index + 1) || c == cols - 1) {
        path.moveTo(right, top);
        path.lineTo(right, bottom);
      }
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

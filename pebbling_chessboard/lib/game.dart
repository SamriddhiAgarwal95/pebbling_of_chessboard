import 'dart:async';
import 'package:flutter/material.dart';
import 'victory_screen.dart';
import 'package:pebbling_chessboard/prison/prison.dart';
import 'package:pebbling_chessboard/widgets/TextWidget.dart';
import 'package:pebbling_chessboard/widgets/particle_effect.dart';
import 'package:pebbling_chessboard/widgets/background.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'solver.dart';

class GamePage extends StatefulWidget {
  final int level;
  final bool isMultiplayer;
  const GamePage({Key? key, required this.level, this.isMultiplayer = false}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late List<int> haveClone;
  late List<int> currentPrison;
  Timer? _turnTimer;
  int _turnTimeRemaining = 0;
  int winner = 0;
  var size, height, width;
  int moves = 0;
  int position = 1; 
  bool hasWon = false;
  int _hintIndex = -1;
  bool _isAutoPlaying = false;
  List<Map<String, dynamic>> _moveHistory = [];
  // Multiplayer tracking
  int currentPlayer = 1;
  int player1Score = 0;
  int player2Score = 0;

  // Particle effect state
  List<ParticleInfo> _particleInfos = [];

  int get availableQuads {
    if (widget.level <= 100) return 1;
    if (widget.level <= 250) return 2;
    return 4;
  }

  @override
  void dispose() {
    _turnTimer?.cancel();
    super.dispose();
  }

  void _startTurnTimer() {
    // Cancel any existing timer
    _turnTimer?.cancel();
    // Set turn time (e.g., 15 seconds)
    _turnTimeRemaining = 15;
    _turnTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        if (_turnTimeRemaining > 0) {
          _turnTimeRemaining--;
        } else {
          // Time's up: switch player and restart timer
          timer.cancel();
          currentPlayer = currentPlayer == 1 ? 2 : 1;
          _startTurnTimer();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // Grid: 8x8 (64) for levels 1-10, 15x8 (120) for levels 11+
    haveClone = widget.level > 10 ? List.generate(120, (index) => 0) : List.generate(64, (index) => 0);
    _initializeLevel();
    if (widget.isMultiplayer) _startTurnTimer();
  }

  void _initializeLevel() {
    hasWon = false;
    position = 1;
    _hintIndex = -1;
    _isAutoPlaying = false;

    currentPrison = _getPrisonIndicesForLevel();

    // ✅ Reset all cells to 0 before placing pebbles (fixes restart & stale pebble bugs)
    for (int i = 0; i < haveClone.length; i++) {
      haveClone[i] = 0;
    }

    // Populate initial pebbles from the prison indices
    for (int idx in currentPrison) {
      if (idx >= 0 && idx < haveClone.length) {
        haveClone[idx] = 1;
      }
    }

    if (widget.level <= 20) {
      int extraMoves = widget.level > 10 ? (widget.level - 10) * 2 : 0;
      moves = 30 + extraMoves;
    } else {
      var solution = Solver.solveBoard(haveClone, currentPrison, 15, 30, availableQuads);
      if (solution != null) {
        moves = solution.length + 10;
      } else {
        moves = 40;
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
                  children: [        // Turn indicator for multiplayer
        if (widget.isMultiplayer)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Player $currentPlayer's turn",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(width: 20),
                Text("Score 1: $player1Score", style: const TextStyle(color: Colors.white)),
                const SizedBox(width: 10),
                Text("Score 2: $player2Score", style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
        // Turn timer display for multiplayer
        if (widget.isMultiplayer)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Turn time: $_turnTimeRemaining s', style: const TextStyle(color: Colors.white, fontSize: 16)),
          ),    
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
                                      indices: currentPrison,
                                      cols: 15,
                                    ),
                                  ),
                                ),
                              AspectRatio(aspectRatio: 1.0, child: _buildGridView()),
            // Particle bursts overlay
            for (var info in _particleInfos)
              ParticleBurst(
                key: info.key,
                position: info.position,
                cellSize: info.cellSize,
                onCompleted: () {
                  setState(() {
                    _particleInfos.removeWhere((i) => i.key == info.key);
                  });
                },
              ),
                              
                              // Victory message overlay — shown for ALL levels
                              if (hasWon)
                                Center(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        textWidget("YOU WON!", const Color(0xffFFA51E), Colors.transparent, 40, 1, "Rye"),
                                        const SizedBox(height: 20),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GamePage(level: widget.level + 1, isMultiplayer: widget.isMultiplayer)));
                                          },
                                          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffFFA51E)),
                                          child: const Text("Next Level", style: TextStyle(color: Colors.black, fontSize: 20)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              if (moves <= 0 && !hasWon && !_isAutoPlaying)
                                Center(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                    decoration: BoxDecoration(color: Colors.black.withOpacity(0.8), borderRadius: BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        textWidget("OUT OF MOVES", Colors.red, Colors.transparent, 30, 1, "Rye"),
                                        const SizedBox(height: 20),
                                        ElevatedButton(
                                          onPressed: _initializeLevel,
                                          child: const Text("Retry", style: TextStyle(fontSize: 18)),
                                        ),
                                        if (!widget.isMultiplayer)
                                          ElevatedButton(
                                            onPressed: () {
                                              _unlockNextLevel(widget.level + 1);
                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GamePage(level: widget.level + 1)));
                                            },
                                            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                                            child: const Text("Skip Level", style: TextStyle(fontSize: 18, color: Colors.white)),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        )),
                    const SizedBox(height: 20),
                    if (availableQuads > 1) _buildDirectionSwitcher(),
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
    bool isHint = index == _hintIndex;
    return Padding(
      padding: EdgeInsets.all(widget.level > 10 ? 2.0 : 7.0),
      child: GestureDetector(
        onTap: () => _onPebbleTap(index, cols),
        child: Container(
          decoration: isHint ? BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: Colors.yellow, blurRadius: 10, spreadRadius: 2)],
          ) : null,
          child: CircleAvatar(backgroundColor: isHint ? Colors.yellow : Colors.red[800]),
        ),
      ),
    );
  }

  void _onPebbleTap(int index, int cols, {bool isAuto = false}) {
    if (hasWon || (!isAuto && moves <= 0) || (_isAutoPlaying && !isAuto)) return;

    int r = index ~/ cols;
    int c = index % cols;
    int? t1, t2;

    if (widget.level <= 10) {
      // 8x8 board: only two possible moves (up-right) based on original game rules
      if (r > 0 && c < cols - 1) {
        t1 = index - cols; // up
        t2 = index + 1;    // right
      }
    } else {
      // 15x8 board: handle all four diagonal directions based on current position
      int maxR = (haveClone.length ~/ cols) - 1;
      if (position == 1 && r > 0 && c < cols - 1) {
        // north-east
        t1 = index - cols; // up
        t2 = index + 1;    // right
      } else if (position == 2 && r > 0 && c > 0) {
        // north-west
        t1 = index - cols; // up
        t2 = index - 1;    // left
      } else if (position == 3 && r < maxR && c < cols - 1) {
        // south-east
        t1 = index + cols; // down
        t2 = index + 1;    // right
      } else if (position == 4 && r < maxR && c > 0) {
        // south-west
        t1 = index + cols; // down
        t2 = index - 1;    // left
      }
    }

    // Validate that both target cells exist and are empty before performing the move
    if (t1 != null && t2 != null) {
      if (haveClone[t1] != 0 || haveClone[t2] != 0) {
        // One of the destination cells is occupied – cancel move
        return;
      }
    }

    // Record current state before performing move for undo
      _moveHistory.add({
        'haveClone': List<int>.from(haveClone),
        'moves': moves,
        'position': position,
        'hasWon': hasWon,
        'currentPlayer': currentPlayer,
        'player1Score': player1Score,
        'player2Score': player2Score,
      });

    // Add particle effect at original pebble location
    _addParticleInfo(r, c, cols);
    setState(() {
        haveClone[index] = 0;
        haveClone[t1!] = 1;
        haveClone[t2!] = 1;
        moves--;
        // Update scores and switch turn in multiplayer mode
      // Multiplayer logic: score only when a pebble leaves the prison
      if (widget.isMultiplayer) {
        // Increment score if the moved pebble originated from the prison area
        if (currentPrison.contains(index)) {
          if (currentPlayer == 1) {
            player1Score++;
          } else {
            player2Score++;
          }
        }
        // Switch to the other player
        currentPlayer = currentPlayer == 1 ? 2 : 1;
        // Reset turn timer for the new player
        _startTurnTimer();
      }
      // ✅ Victory check — works for ALL levels
      if (_isPrisonEmpty()) {
        // Determine winner (the player who just made the winning move)
        winner = widget.isMultiplayer ? (currentPlayer == 1 ? 2 : 1) : 0;
        _unlockNextLevel(widget.level + 1);
        if (mounted) setState(() { hasWon = true; _isAutoPlaying = false; });
        // Navigate to distinct victory screen
        WidgetsBinding.instance.addPostFrameCallback((_){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => VictoryScreen(
                winner: winner,
                player1Score: player1Score,
                player2Score: player2Score,
              ),
            ),
          );
        });
        return;
      }
    });

  }

  void _undoMove() {
    if (_moveHistory.isEmpty) return;
    setState(() {
      final lastState = _moveHistory.removeLast();
        haveClone = List<int>.from(lastState['haveClone']);
        moves = lastState['moves'];
        position = lastState['position'];
        hasWon = lastState['hasWon'];
        // Restore multiplayer state
        currentPlayer = lastState['currentPlayer'];
        player1Score = lastState['player1Score'];
        player2Score = lastState['player2Score'];
        _particleInfos.clear(); // Optional: clear particles on undo
    });
  }

  // Fields to store cell dimensions for particle positioning

  void _addParticleInfo(int row, int col, int cols) {
    // Compute cell dimensions based on current board configuration
    double cellWidth = widget.level > 10 ? 900.0 / cols : 400.0 / cols;
    double aspect = widget.level > 10 ? 0.535 : 1.0;
    double cellHeight = cellWidth / aspect;
    final pos = Offset(col * cellWidth, row * cellHeight);
    final info = ParticleInfo(position: pos, cellSize: cellWidth, key: UniqueKey());
    setState(() {
      _particleInfos.add(info);
    });
  }

  Future<void> _unlockNextLevel(int nextLevel) async {
    final prefs = await SharedPreferences.getInstance();
    int currentUnlocked = prefs.getInt('unlockedLevel') ?? 1;
    if (nextLevel > currentUnlocked) {
      await prefs.setInt('unlockedLevel', nextLevel);
    }
  }

  bool _isPrisonEmpty() {
    return currentPrison.every((idx) => haveClone[idx] == 0);
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
      int numPebbles;
      if (widget.level <= 30) numPebbles = 2;
      else numPebbles = 3;
      
      int seed = widget.level;
      int nextRandom() {
        seed = (seed * 1103515245 + 12345) & 0x7fffffff;
        return seed;
      }
      
      int attempts = 0;
      while (attempts < 20) {
        attempts++;
        Set<int> prison = {112};
        List<int> candidates = [112 - 15, 112 - 1, 112 + 1]; 
        
        while (prison.length < numPebbles && candidates.isNotEmpty) {
          int rIdx = nextRandom() % candidates.length;
          int chosen = candidates.removeAt(rIdx);
          
          if (!prison.contains(chosen)) {
            int r = chosen ~/ 15;
            int c = chosen % 15;
            if (r >= 4 && r <= 7 && c >= 4 && c <= 10) {
              prison.add(chosen);
              if (r > 0) candidates.add(chosen - 15);
              if (r < 7) candidates.add(chosen + 15);
              if (c > 0) candidates.add(chosen - 1);
              if (c < 14) candidates.add(chosen + 1);
            }
          }
        }
        
        List<int> tempBoard = List.filled(120, 0);
        for (int p in prison) tempBoard[p] = 1;
        var solution = Solver.solveBoard(tempBoard, prison.toList(), 15, 18, availableQuads);
        if (solution != null) {
          return prison.toList();
        }
      }
      
      // Fallback if all attempts fail
      return [112, 113, 97];
    }
  }

  Widget _buildDirectionSwitcher() {
    IconData getIconForPosition() {
      switch (position) {
        case 1: return Icons.north_east;
        case 2: return Icons.north_west;
        case 3: return Icons.south_east;
        case 4: return Icons.south_west;
        default: return Icons.north_east;
      }
    }
    
    return Column(
      children: [
        RawMaterialButton(
          onPressed: () {
            setState(() {
              if (availableQuads == 2) {
                position = position == 1 ? 2 : 1;
              } else if (availableQuads == 4) {
                position = position == 4 ? 1 : position + 1;
              }
            });
          },
          elevation: 4.0, fillColor: Colors.white,
          shape: const CircleBorder(), padding: const EdgeInsets.all(10),
          child: Icon(getIconForPosition(), color: Colors.black, size: 30),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildMovesDisplay(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: _showHint,
          icon: const Icon(Icons.lightbulb, color: Colors.yellow, size: 30),
          tooltip: "Hint",
        ),
        // Undo button
        IconButton(
          onPressed: _undoMove,
          icon: const Icon(Icons.undo, color: Colors.orange, size: 30),
          tooltip: "Undo",
        ),
        Container(
          width: width * 0.45,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              textWidget("MOVES", Colors.white, Colors.black, 14, 1, "Sans Francisco"),
              textWidget(moves.toString(), const Color(0xffFFA51E), Colors.black, 26, 1, "Sans Francisco"),
            ],
          ),
        ),
        IconButton(
          onPressed: _autoSolve,
          icon: const Icon(Icons.smart_toy, color: Colors.blue, size: 30),
          tooltip: "Show Solution",
        ),
      ],
    );
  }

  void _showHint() {
    if (moves <= 0 || hasWon) return;
    var solution = Solver.solveBoard(haveClone, currentPrison, widget.level > 10 ? 15 : 8, 12, availableQuads);
    if (solution != null && solution.isNotEmpty) {
      setState(() { _hintIndex = solution.first.index; });
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) setState(() { _hintIndex = -1; });
      });
    } else {
      // Fallback: highlight any pebble in the prison
      for (int idx in currentPrison) {
        if (haveClone[idx] == 1) {
          setState(() { _hintIndex = idx; });
          Future.delayed(const Duration(seconds: 2), () {
            if (mounted) setState(() { _hintIndex = -1; });
          });
          break;
        }
      }
    }
  }

  void _autoSolve() async {
    if (hasWon || _isAutoPlaying) return;
    setState(() { _isAutoPlaying = true; _hintIndex = -1; });
    while (_isAutoPlaying && !_isPrisonEmpty()) {
      var solution = Solver.solveBoard(haveClone, currentPrison, widget.level > 10 ? 15 : 8, 14, availableQuads);
      if (solution == null || solution.isEmpty) {
        if (mounted) {
          setState(() { _isAutoPlaying = false; });
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('State too complex to auto-solve. Please restart level.')));
        }
        break;
      }
      
      Move nextMove = solution.first;
      if (mounted) setState(() { position = nextMove.position; });
      await Future.delayed(const Duration(milliseconds: 300));
      
      if (mounted) _onPebbleTap(nextMove.index, widget.level > 10 ? 15 : 8, isAuto: true);
      await Future.delayed(const Duration(milliseconds: 500));
    }
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
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// Helper class for particle effect tracking
class ParticleInfo {
  final Offset position;
  final double cellSize;
  final UniqueKey key;

  ParticleInfo({required this.position, required this.cellSize, required this.key});
}

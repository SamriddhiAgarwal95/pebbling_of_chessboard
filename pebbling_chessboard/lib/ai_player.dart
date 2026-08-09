import 'package:pebbling_chessboard/solver.dart';
import 'package:pebbling_chessboard/game.dart';

enum DifficultyLevel { easy, medium, hard }

class AIPlayer {
  /// Returns the best move for the given board configuration.
  /// Reuses the existing Solver to obtain a solution sequence.
  /// If a solution exists, the first move is used as the AI move.
  static Move? getBestMove({
    required List<int> board,
    required List<int> prisonIndices,
    required int level,
    required DifficultyLevel difficulty,
  }) {
    var solution = Solver.solveBoard(
      board,
      prisonIndices,
      level > 10 ? 15 : 8,
      difficulty == DifficultyLevel.easy
          ? 8
          : difficulty == DifficultyLevel.medium
              ? 12
              : 15,
      level > 10 ? 4 : 2,
    );
    if (solution != null && solution.isNotEmpty) {
      return solution.first;
    }
    return null;
  }
}

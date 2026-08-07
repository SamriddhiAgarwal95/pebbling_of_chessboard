import 'dart:collection';

class Move {
  final int index;
  final int position;
  Move(this.index, this.position);
}

class Solver {
  static List<Move>? solveBoard(List<int> currentBoard, List<int> prisonIndices, int cols, int maxDepth, int availableQuads) {
    BigInt initialState = BigInt.zero;
    for (int i = 0; i < currentBoard.length; i++) {
      if (currentBoard[i] == 1) initialState |= (BigInt.one << i);
    }

    BigInt prisonMask = BigInt.zero;
    for (int idx in prisonIndices) {
      prisonMask |= (BigInt.one << idx);
    }

    if ((initialState & prisonMask) == BigInt.zero) return [];

    Queue<BigInt> q = Queue<BigInt>();
    Map<BigInt, BigInt> parent = {};
    Map<BigInt, Move> parentMove = {};
    Map<BigInt, int> depth = {};

    q.add(initialState);
    depth[initialState] = 0;

    int totalCells = currentBoard.length;

    while (q.isNotEmpty) {
      BigInt state = q.removeFirst();
      int d = depth[state]!;

      if (d >= maxDepth) continue;

      for (int i = 0; i < totalCells; i++) {
        if ((state & (BigInt.one << i)) != BigInt.zero) {
          int r = i ~/ cols;
          int c = i % cols;

          // Try Pos 1 (North-East)
          if (availableQuads >= 1 && r > 0 && c < cols - 1) {
            int t1 = i - cols;
            int t2 = i + 1;
            if ((state & (BigInt.one << t1)) == BigInt.zero && (state & (BigInt.one << t2)) == BigInt.zero) {
              BigInt nextState = state & ~(BigInt.one << i);
              nextState |= (BigInt.one << t1);
              nextState |= (BigInt.one << t2);

              if (!depth.containsKey(nextState)) {
                parent[nextState] = state;
                parentMove[nextState] = Move(i, 1);
                depth[nextState] = d + 1;
                if ((nextState & prisonMask) == BigInt.zero) return _buildPath(nextState, parent, parentMove);
                q.add(nextState);
              }
            }
          }

          // Try Pos 2 (North-West)
          if (availableQuads >= 2 && r > 0 && c > 0) {
            int t1 = i - cols;
            int t2 = i - 1;
            if ((state & (BigInt.one << t1)) == BigInt.zero && (state & (BigInt.one << t2)) == BigInt.zero) {
              BigInt nextState = state & ~(BigInt.one << i);
              nextState |= (BigInt.one << t1);
              nextState |= (BigInt.one << t2);

              if (!depth.containsKey(nextState)) {
                parent[nextState] = state;
                parentMove[nextState] = Move(i, 2);
                depth[nextState] = d + 1;
                if ((nextState & prisonMask) == BigInt.zero) return _buildPath(nextState, parent, parentMove);
                q.add(nextState);
              }
            }
          }

          // Try Pos 3 (South-East)
          if (availableQuads >= 4 && r < (totalCells ~/ cols) - 1 && c < cols - 1) {
            int t1 = i + cols;
            int t2 = i + 1;
            if ((state & (BigInt.one << t1)) == BigInt.zero && (state & (BigInt.one << t2)) == BigInt.zero) {
              BigInt nextState = state & ~(BigInt.one << i);
              nextState |= (BigInt.one << t1);
              nextState |= (BigInt.one << t2);

              if (!depth.containsKey(nextState)) {
                parent[nextState] = state;
                parentMove[nextState] = Move(i, 3);
                depth[nextState] = d + 1;
                if ((nextState & prisonMask) == BigInt.zero) return _buildPath(nextState, parent, parentMove);
                q.add(nextState);
              }
            }
          }

          // Try Pos 4 (South-West)
          if (availableQuads >= 4 && r < (totalCells ~/ cols) - 1 && c > 0) {
            int t1 = i + cols;
            int t2 = i - 1;
            if ((state & (BigInt.one << t1)) == BigInt.zero && (state & (BigInt.one << t2)) == BigInt.zero) {
              BigInt nextState = state & ~(BigInt.one << i);
              nextState |= (BigInt.one << t1);
              nextState |= (BigInt.one << t2);

              if (!depth.containsKey(nextState)) {
                parent[nextState] = state;
                parentMove[nextState] = Move(i, 4);
                depth[nextState] = d + 1;
                if ((nextState & prisonMask) == BigInt.zero) return _buildPath(nextState, parent, parentMove);
                q.add(nextState);
              }
            }
          }
        }
      }
    }
    return null;
  }

  static List<Move> _buildPath(BigInt endState, Map<BigInt, BigInt> parent, Map<BigInt, Move> parentMove) {
    List<Move> path = [];
    BigInt curr = endState;
    while (parent.containsKey(curr)) {
      path.add(parentMove[curr]!);
      curr = parent[curr]!;
    }
    return path.reversed.toList();
  }
}

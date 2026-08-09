import 'package:flutter/material.dart';

class VictoryScreen extends StatelessWidget {
  final int winner; // 0 for solo, 1 or 2 for multiplayer
  final int player1Score;
  final int player2Score;

  const VictoryScreen({
    Key? key,
    required this.winner,
    required this.player1Score,
    required this.player2Score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title;
    String subtitle;
    if (winner == 0) {
      title = 'YOU WON!';
      subtitle = 'Great job solving the puzzle.';
    } else if (winner == 1) {
      title = "Player 1 Dominates the Board!";
      subtitle = "Congratulations, Player 1!";
    } else {
      title = "Player 2 Dominates the Board!";
      subtitle = "Congratulations, Player 2!";
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.amber, fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.white70, fontSize: 20),
            ),
            const SizedBox(height: 24),
            Text(
              'Score 1: $player1Score',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            Text(
              'Score 2: $player2Score',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              child: const Text('Back to Home', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}

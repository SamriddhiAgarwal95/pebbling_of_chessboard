import 'package:flutter/material.dart';

class VictoryScreen extends StatelessWidget {
  final int winner; // 0 for solo, 1 or 2 for multiplayer
  final int player1Score;
  final int player2Score;
  final bool isVsComputer;

  const VictoryScreen({
    Key? key,
    required this.winner,
    required this.player1Score,
    required this.player2Score,
    this.isVsComputer = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title;
    String subtitle;
    if (isVsComputer) {
      if (winner == 1) {
        title = "YOU WON!";
        subtitle = "You outsmarted the AI!";
      } else if (winner == 2) {
        title = "AI WON!";
        subtitle = "The AI defeated you!";
      } else {
        title = "IT'S A TIE!";
        subtitle = "A well-fought battle!";
      }
    } else if (winner == 0) {
      title = 'YOU WON!';
      subtitle = 'Great job solving the puzzle.';
    } else if (winner == 1) {
      title = "Player 1 Dominates the Board!";
      subtitle = "Congratulations, Player 1!";
    } else if (winner == 2) {
      title = "Player 2 Dominates the Board!";
      subtitle = "Congratulations, Player 2!";
    } else {
      title = "IT'S A TIE!";
      subtitle = "Both players played equally well!";
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
              isVsComputer ? 'Your Score: $player1Score' : 'Score 1: $player1Score',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            Text(
              isVsComputer ? 'AI Score: $player2Score' : 'Score 2: $player2Score',
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

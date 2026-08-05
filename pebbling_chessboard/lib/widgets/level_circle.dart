import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../game.dart';
import '../level_screen.dart';
import 'TextWidget.dart';

var size, height, width;

class LevelCircleWidget extends StatelessWidget {
  final int levelNumber;
  static ValueNotifier<int> unlockedLevelNotifier = ValueNotifier<int>(1);

  const LevelCircleWidget({
    Key? key,
    required this.levelNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return ValueListenableBuilder<int>(
      valueListenable: unlockedLevelNotifier,
      builder: (context, unlockedLevel, child) {
        bool isLocked = levelNumber > unlockedLevel;

        return GestureDetector(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black, // border color
              shape: BoxShape.circle,
            ),
            height: height * 0.17,
            width: width * 0.17,
            child: CircleAvatar(
              backgroundColor: isLocked ? Colors.grey : const Color(0xff86B5EC),
              child: isLocked
                  ? Icon(Icons.lock, color: Colors.black, size: width * 0.08)
                  : textWidget(levelNumber.toString(), Colors.black, Colors.black,
                      levelNumber >= 100 ? width * 0.08 : width * 0.1, 1, "Rye"),
            ),
          ),
          onTap: () async {
            if (!isLocked) {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LevelScreen(level: levelNumber)),
              );
              // Refresh the lock state when returning from the game screen
              final prefs = await SharedPreferences.getInstance();
              unlockedLevelNotifier.value = prefs.getInt('unlockedLevel') ?? 1;
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Level is locked! Complete previous levels first.',
                        style: TextStyle(fontFamily: 'Sans Francisco'))),
              );
            }
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pebbling_chessboard/widgets/TextWidget.dart';

import 'game.dart';
import 'home.dart';

class LevelScreen extends StatefulWidget {
  final int level;

  const LevelScreen({Key? key, required this.level}) : super(key: key);

  @override
  State<LevelScreen> createState() => LevelScreenState();
}

class LevelScreenState extends State<LevelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.height * 0.75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.elliptical(
                      MediaQuery.of(context).size.width * 0.75,
                      MediaQuery.of(context).size.height * 0.75,
                    )),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xffFFA51E),
                        offset: Offset(5.0, 5.0),
                        blurRadius: 50.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: MediaQuery.of(context).size.height * 0.65,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff2F1F4A),
                        offset: Offset(5.0, 5.0),
                        blurRadius: 15.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.17,
                left: MediaQuery.of(context).size.width / 2 -
                    MediaQuery.of(context).size.width * 0.46,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                    Padding(
                      padding: const EdgeInsets.only(left: 80, right: 80),
                      child: textWidget(
                        "Level ${widget.level}",
                        Colors.black,
                        const Color(0xffFFA51E),
                        MediaQuery.of(context).size.width * 0.09,
                        17,
                        "Rye",
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                    Center(
                      child: Row(
                        children: [
                          Icon(Icons.star_border,
                              size: MediaQuery.of(context).size.width * 0.12,
                              color: const Color(0xffFFA51E)),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                          Icon(Icons.star_border,
                              size: MediaQuery.of(context).size.width * 0.12,
                              color: const Color(0xffFFA51E)),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                          Icon(Icons.star_border,
                              size: MediaQuery.of(context).size.width * 0.12,
                              color: const Color(0xffFFA51E)),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.4),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xffFFA51E)),
                          elevation: MaterialStateProperty.all<double>(10.0),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GamePage(level: widget.level),
                            ),
                          );
                        },
                        label: const Text(
                          "PLAY",
                          style: TextStyle(color: Colors.black, fontSize: 30.0),
                        ),
                        icon: const Icon(Icons.play_circle_filled,
                            color: Colors.black, size: 30.0),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // ◀ Previous Level button
                        Container(
                          height: MediaQuery.of(context).size.width * 0.13,
                          width: MediaQuery.of(context).size.width * 0.13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 0),
                                blurRadius: 2,
                                spreadRadius: 2,
                                color: Colors.black26,
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              if (widget.level > 1) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        LevelScreen(level: widget.level - 1),
                                  ),
                                );
                              }
                            },
                            child: Icon(
                              Icons.skip_previous,
                              size: MediaQuery.of(context).size.width * 0.1,
                              color: widget.level > 1 ? Colors.black : Colors.black38,
                            ),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                        // 🏠 Home button
                        Container(
                          height: MediaQuery.of(context).size.width * 0.13,
                          width: MediaQuery.of(context).size.width * 0.13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 0),
                                blurRadius: 2,
                                spreadRadius: 2,
                                color: Colors.black26,
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()),
                                (route) => false,
                              );
                            },
                            child: Icon(
                              Icons.home,
                              size: MediaQuery.of(context).size.width * 0.1,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                        // 🔄 Restart button
                        Container(
                          height: MediaQuery.of(context).size.width * 0.13,
                          width: MediaQuery.of(context).size.width * 0.13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 0),
                                blurRadius: 2,
                                spreadRadius: 2,
                                color: Colors.black26,
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      GamePage(level: widget.level),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.sync_alt,
                              size: MediaQuery.of(context).size.width * 0.08,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
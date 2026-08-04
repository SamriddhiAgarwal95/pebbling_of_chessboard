import 'package:flutter/material.dart';

class Prison {
  Widget getPrison(int level) {
    switch (level) {
      case 1:
        return prison(50.0, 50.0, const Color.fromARGB(255, 33, 150, 243));
      case 2:
        return prison(50.0, 95.0, const Color.fromARGB(255, 33, 150, 243));
      case 3:
        return levelprisons(720.0, 3);
      case 4:
        return prison(95.0, 95.0, const Color.fromARGB(255, 33, 150, 243));
      case 5:
        return levelprisons(720.0, 5);
      case 6:
        return levelprisons(720.0, 6);
      case 7:
        return levelprisons(720.0, 3);
      case 8:
        return levelprisons(720.0, 6);
      case 9:
        return prison(50.0, 95.0, const Color.fromARGB(255, 33, 150, 243));
      case 10:
        return prison(95.0, 50.0, const Color.fromARGB(255, 33, 150, 243));
      default:
        // Safe default for all other levels to prevent crashes
        if (level >= 11 && level <= 15) {
           if(level == 11) return prison(48.0, 30.0, const Color.fromARGB(255, 33, 150, 243));
           if(level == 12) return prison(48.0, 55.0, const Color.fromARGB(255, 33, 150, 243));
           if(level == 13) return prison(94.0, 30.0, const Color.fromARGB(255, 33, 150, 243));
           if(level == 14) return prison(94.0, 55.0, const Color.fromARGB(255, 33, 150, 243));
           if(level == 15) return prison(48.0, 80.0, const Color.fromARGB(255, 33, 150, 243));
        }
        return levelprisons(720.0, 14);
    }
  }

  Widget prison(double height, double width, Color boxColor) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: boxColor, width: 4.0),
      ),
    );
  }

  int cagePosition(int level) {
    if (level < 15) return 0;
    return 1;
  }
}

Widget levelprisons(double width, int level) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 2.0, left: 2.0),
    child: CustomPaint(
      size: Size(width, (width * 0.625).toDouble()),
      painter: levelPainter(level),
    ),
  );
}

CustomPainter levelPainter(int level) {
  switch (level) {
    case 3: return Prison3Painter();
    case 5: return Prison5Painter();
    case 6: return Prison6Painter();
    case 14: return level14CagePainter();
    case 16: return level16CagePainter();
    case 17: return level17CagePainter();
    case 18: return level18CagePainter();
    case 19: return level19CagePainter();
    case 20: return level20CagePainter();
    case 21: return level21CagePainter();
    case 22: return level22CagePainter();
    case 24: return level24CagePainter();
    case 25: return level25CagePainter();
    default:
      return level14CagePainter();
  }
}

class level14CagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()..color = const Color.fromARGB(255, 33, 150, 243)..style = PaintingStyle.stroke..strokeWidth = 5;
    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(0, size.height * 0.8);
    path0.lineTo(size.width * 0.0340000, size.height * 0.8);
    path0.lineTo(size.width * 0.0340000, size.height * 0.9);
    path0.lineTo(size.width * 0.0675000, size.height * 0.9);
    path0.lineTo(size.width * 0.0675000, size.height);
    path0.close();
    canvas.drawPath(path0, paint0);
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class level16CagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()..color = const Color.fromARGB(255, 33, 150, 243)..style = PaintingStyle.stroke..strokeWidth = 5;
    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(0, size.height * 0.9);
    path0.lineTo(size.width * 0.0340000, size.height * 0.9);
    path0.lineTo(size.width * 0.0340000, size.height * 0.8);
    path0.lineTo(size.width * 0.0675000, size.height * 0.8);
    path0.lineTo(size.width * 0.0675000, size.height * 0.9);
    path0.lineTo(size.width * 0.1000000, size.height * 0.9);
    path0.lineTo(size.width * 0.1000000, size.height);
    path0.close();
    canvas.drawPath(path0, paint0);
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class level17CagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()..color = const Color.fromARGB(255, 33, 150, 243)..style = PaintingStyle.stroke..strokeWidth = 5;
    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(0, size.height * 0.9);
    path0.lineTo(size.width * 0.0340000, size.height * 0.9);
    path0.lineTo(size.width * 0.0340000, size.height * 0.8);
    path0.lineTo(size.width * 0.0675000, size.height * 0.8);
    path0.lineTo(size.width * 0.0675000, size.height * 0.9);
    path0.lineTo(size.width * 0.1340000, size.height * 0.9);
    path0.lineTo(size.width * 0.1340000, size.height);
    path0.close();
    canvas.drawPath(path0, paint0);
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class level18CagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()..color = const Color.fromARGB(255, 33, 150, 243)..style = PaintingStyle.stroke..strokeWidth = 5;
    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(0, size.height * 0.9);
    path0.lineTo(size.width * 0.0340000, size.height * 0.9);
    path0.lineTo(size.width * 0.0340000, size.height * 0.7);
    path0.lineTo(size.width * 0.0675000, size.height * 0.7);
    path0.lineTo(size.width * 0.0675000, size.height * 0.9);
    path0.lineTo(size.width * 0.1000000, size.height * 0.9);
    path0.lineTo(size.width * 0.1000000, size.height);
    path0.close();
    canvas.drawPath(path0, paint0);
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class level19CagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()..color = const Color.fromARGB(255, 33, 150, 243)..style = PaintingStyle.stroke..strokeWidth = 5;
    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(0, size.height * 0.8);
    path0.lineTo(size.width * 0.0340000, size.height * 0.8);
    path0.lineTo(size.width * 0.0675000, size.height * 0.8);
    path0.lineTo(size.width * 0.0675000, size.height * 0.9);
    path0.lineTo(size.width * 0.1000000, size.height * 0.9);
    path0.lineTo(size.width * 0.1000000, size.height);
    path0.close();
    canvas.drawPath(path0, paint0);
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class level20CagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()..color = const Color.fromARGB(255, 33, 150, 243)..style = PaintingStyle.stroke..strokeWidth = 5;
    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(0, size.height * 0.9);
    path0.lineTo(size.width * 0.0340000, size.height * 0.9);
    path0.lineTo(size.width * 0.0340000, size.height * 0.8);
    path0.lineTo(size.width * 0.1000000, size.height * 0.8);
    path0.lineTo(size.width * 0.1000000, size.height * 0.9);
    path0.lineTo(size.width * 0.1340000, size.height * 0.9);
    path0.lineTo(size.width * 0.1340000, size.height);
    path0.close();
    canvas.drawPath(path0, paint0);
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class level21CagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()..color = const Color.fromARGB(255, 33, 150, 243)..style = PaintingStyle.stroke..strokeWidth = 5;
    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(0, size.height * 0.9);
    path0.lineTo(size.width * 0.0340000, size.height * 0.9);
    path0.lineTo(size.width * 0.0340000, size.height * 0.7);
    path0.lineTo(size.width * 0.0670000, size.height * 0.7);
    path0.lineTo(size.width * 0.0670000, size.height * 0.9);
    path0.lineTo(size.width * 0.1340000, size.height * 0.9);
    path0.lineTo(size.width * 0.1340000, size.height);
    path0.close();
    canvas.drawPath(path0, paint0);
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class level22CagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()..color = const Color.fromARGB(255, 33, 150, 243)..style = PaintingStyle.stroke..strokeWidth = 5;
    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(0, size.height * 0.8);
    path0.lineTo(size.width * 0.0340000, size.height * 0.8);
    path0.lineTo(size.width * 0.0670000, size.height * 0.8);
    path0.lineTo(size.width * 0.0670000, size.height * 0.9);
    path0.lineTo(size.width * 0.1340000, size.height * 0.9);
    path0.lineTo(size.width * 0.1340000, size.height);
    path0.close();
    canvas.drawPath(path0, paint0);
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class level24CagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()..color = const Color.fromARGB(255, 33, 150, 243)..style = PaintingStyle.stroke..strokeWidth = 5;
    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(0, size.height * 0.9);
    path0.lineTo(size.width * 0.0340000, size.height * 0.9);
    path0.lineTo(size.width * 0.0340000, size.height * 0.7);
    path0.lineTo(size.width * 0.0670000, size.height * 0.7);
    path0.lineTo(size.width * 0.0670000, size.height * 0.8);
    path0.lineTo(size.width * 0.1000000, size.height * 0.8);
    path0.lineTo(size.width * 0.1000000, size.height);
    path0.close();
    canvas.drawPath(path0, paint0);
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class level25CagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()..color = const Color.fromARGB(255, 33, 150, 243)..style = PaintingStyle.stroke..strokeWidth = 5;
    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(0, size.height * 0.9);
    path0.lineTo(size.width * 0.0670000, size.height * 0.9);
    path0.lineTo(size.width * 0.0670000, size.height * 0.8);
    path0.lineTo(size.width * 0.1340000, size.height * 0.8);
    path0.lineTo(size.width * 0.1340000, size.height);
    path0.close();
    canvas.drawPath(path0, paint0);
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Prison3Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()..color = const Color.fromARGB(255, 33, 150, 243)..style = PaintingStyle.stroke..strokeWidth = 4;
    Path path0 = Path();
    path0.moveTo(0, size.height * 0.8010000);
    path0.lineTo(size.width * 0.0628125, size.height * 0.8005000);
    path0.lineTo(size.width * 0.0625000, size.height * 0.9000000);
    path0.lineTo(size.width * 0.1250000, size.height * 0.9000000);
    path0.lineTo(size.width * 0.1256250, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, size.height * 0.9000000);
    path0.lineTo(0, size.height * 0.8010000);
    path0.close();
    canvas.drawPath(path0, paint0);
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Prison5Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()..color = const Color.fromARGB(255, 33, 150, 243)..style = PaintingStyle.stroke..strokeWidth = 4;
    Path path0 = Path();
    path0.moveTo(size.width * 0.0625000, size.height * 0.7000000);
    path0.lineTo(size.width * 0.0625000, size.height * 0.9000000);
    path0.lineTo(size.width * 0.1250000, size.height * 0.9000000);
    path0.lineTo(size.width * 0.1250000, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, size.height * 0.7000000);
    path0.lineTo(size.width * 0.0625000, size.height * 0.7000000);
    path0.close();
    canvas.drawPath(path0, paint0);
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Prison6Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()..color = const Color.fromARGB(255, 33, 150, 243)..style = PaintingStyle.stroke..strokeWidth = 4;
    Path path0 = Path();
    path0.moveTo(size.width * 0.0012625, size.height * 0.6960200);
    path0.lineTo(size.width * 0.0012625, size.height * 0.9960200);
    path0.lineTo(size.width * 0.1887625, size.height * 0.9960200);
    path0.lineTo(size.width * 0.1887625, size.height * 0.8960200);
    path0.lineTo(size.width * 0.0637625, size.height * 0.8960200);
    path0.lineTo(size.width * 0.0637625, size.height * 0.6960200);
    path0.lineTo(size.width * 0.0012625, size.height * 0.6960200);
    path0.close();
    canvas.drawPath(path0, paint0);
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

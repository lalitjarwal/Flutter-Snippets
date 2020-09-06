import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Dart Lang';
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      title: title,
      home: ClipPathDemo(),
    );
  }
}

class ClipPathDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [


          ClipPath(
              clipper: ClipTriangle(),
              child: Container(
                height: 200,
                 width: 200, 
                 color: Colors.red)
                 ),


          ClipPath(
              clipper: DiamondClipper(),
              child: Container(height: 300, width: 200, color: Colors.red)),
          ClipPath(
              clipper: WaveClipper(),
              child: Container(height: 200, width: 200, color: Colors.red)),
        ],
      ),
    ));
  }
}

class ClipTriangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width / 2, 0) //starting point for path
      ..lineTo(size.width, size.height) //first side of triangle
      ..lineTo(0, size.height) //second side of triangle
      ..close(); //close the shape
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class DiamondClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0, size.height / 2)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 30);
    final firstControlPoint = Offset(size.width / 4, size.height);
    final firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    final secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    final secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Dart Lang';
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      title: title,
      home: FabMenuDemo() ,
    );
  }
}

class FabMenuDemo extends StatefulWidget {
  @override
  _FabMenuDemoState createState() => _FabMenuDemoState();
}

class _FabMenuDemoState extends State<FabMenuDemo>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  Animation rotationAnimation;
  final pageController = PageController();

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
                width: size.width,
                height: size.height,
                color: Colors.greenAccent,
                child: Center(child: Icon(Icons.person, size: 36))),
            Container(
                width: size.width,
                height: size.height,
                color: Colors.pinkAccent,
                child: Center(child: Icon(Icons.camera_alt, size: 36))),
            Container(
                width: size.width,
                height: size.height,
                color: Colors.purpleAccent,
                child: Center(child: Icon(Icons.add_box, size: 36)))
          ],
        ),
        floatingActionButton: Container(
          width: size.width,
          height: size.height,
          // padding: const EdgeInsets.all(12),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              Transform.translate(
                offset: Offset.fromDirection(getRadiansFromDegree(270),
                    degOneTranslationAnimation.value * 100),
                child: Transform(
                  transform: Matrix4.rotationZ(
                      getRadiansFromDegree(rotationAnimation.value))
                    ..scale(degOneTranslationAnimation.value),
                  alignment: Alignment.center,
                  child: CircularButton(
                    color: Colors.blue,
                    width: 50,
                    height: 50,
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onClick: () {
                      buildAnimateToPage(2);
                      print('First Button');
                    },
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset.fromDirection(getRadiansFromDegree(225),
                    degTwoTranslationAnimation.value * 100),
                child: Transform(
                  transform: Matrix4.rotationZ(
                      getRadiansFromDegree(rotationAnimation.value))
                    ..scale(degTwoTranslationAnimation.value),
                  alignment: Alignment.center,
                  child: CircularButton(
                    color: Colors.black,
                    width: 50,
                    height: 50,
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                    onClick: () {
                      buildAnimateToPage(1);
                      print('Second button');
                    },
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset.fromDirection(getRadiansFromDegree(180),
                    degThreeTranslationAnimation.value * 100),
                child: Transform(
                  transform: Matrix4.rotationZ(
                      getRadiansFromDegree(rotationAnimation.value))
                    ..scale(degThreeTranslationAnimation.value),
                  alignment: Alignment.center,
                  child: CircularButton(
                    color: Colors.orangeAccent,
                    width: 50,
                    height: 50,
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    onClick: () {
                      buildAnimateToPage(0);
                      print('Third Button');
                    },
                  ),
                ),
              ),
              Transform(
                transform: Matrix4.rotationZ(
                    getRadiansFromDegree(rotationAnimation.value)),
                alignment: Alignment.center,
                child: CircularButton(
                  color: Colors.red,
                  width: 60,
                  height: 60,
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onClick: () {
                    if (animationController.isCompleted) {
                      animationController.reverse();
                    } else {
                      animationController.forward();
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }

  Future<void> buildAnimateToPage(int page) {
    return pageController.animateToPage(page,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function onClick;

  CircularButton(
      {this.color, this.width, this.height, this.icon, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(icon: icon, enableFeedback: true, onPressed: onClick),
    );
  }
}

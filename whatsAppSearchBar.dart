import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Dart Lang';
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      title: title,
      home: SearchBarDemo(),
    );
  }
}

class SearchBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: Center(
        child: Container(),
      ),
    );
  }
}

class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  _DefaultAppBarState createState() => _DefaultAppBarState();
}

class _DefaultAppBarState extends State<DefaultAppBar>
    with SingleTickerProviderStateMixin {
  double rippleStartX, rippleStartY;
  AnimationController _controller;
  Animation _animation;
  bool isInSearchMode = false;

  @override
  initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.addStatusListener(animationStatusListener);
  }

  animationStatusListener(AnimationStatus animationStatus) {
    if (animationStatus == AnimationStatus.completed) {
      setState(() {
        isInSearchMode = true;
      });
    }
  }

  void onSearchTapUp(TapUpDetails details) {
    setState(() {
      rippleStartX = details.globalPosition.dx;
      rippleStartY = details.globalPosition.dy;
    });

    print("pointer location $rippleStartX, $rippleStartY");
    _controller.forward();
  }

  cancelSearch() {
    setState(() {
      isInSearchMode = false;
    });

    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(children: [
      AppBar(
        title: Text("WhatsApp"),
        actions: <Widget>[
          GestureDetector(
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            onTapUp: onSearchTapUp,
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return CustomPaint(
            painter: MyPainter(
              containerHeight: widget.preferredSize.height,
              center: Offset(rippleStartX ?? 0, rippleStartY ?? 0),
              radius: _animation.value * screenWidth,
              context: context,
            ),
          );
        },
      ),
      isInSearchMode
          ? (SearchBar(
              onCancelSearch: cancelSearch,
            ))
          : (Container())
    ]);
  }
}

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  SearchBar({
    Key key,
    @required this.onCancelSearch,
  }) : super(key: key);

  final VoidCallback onCancelSearch;

  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar>
    with SingleTickerProviderStateMixin {
  String searchQuery = '';
  TextEditingController _searchFieldController = TextEditingController();
  var _showCancel = false;
  clearSearchQuery() {
    _searchFieldController.clear();

    _searchFieldController.text = null;
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    _searchFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: widget.onCancelSearch,
            ),
            Expanded(
              child: TextField(
                autofocus: true,
                controller: _searchFieldController,
                cursorColor: Colors.green,
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  //prefixIcon: Icon(Icons.search, color: Colors.white),
                  hintText: "Search...",
                  //hintStyle: TextStyle(color: Colors.white),
                  suffixIcon: _showCancel
                      ? InkWell(
                          child: Icon(Icons.close, color: Colors.black),
                          onTap: clearSearchQuery,
                        )
                      : null,
                ),
                onChanged: (value) {
                  if (_searchFieldController.text.isNotEmpty)
                    setState(() {
                      _showCancel = true;
                    });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final Offset center;
  final double radius, containerHeight;
  final BuildContext context;

  Color color;
  double statusBarHeight, screenWidth;

  MyPainter({this.context, this.containerHeight, this.center, this.radius}) {
    color = Colors.white;
    statusBarHeight = MediaQuery.of(context).padding.top;
    screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePainter = Paint();

    circlePainter.color = color;
    canvas.clipRect(
        Rect.fromLTWH(0, 0, screenWidth, containerHeight + statusBarHeight));
    canvas.drawCircle(center, radius, circlePainter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

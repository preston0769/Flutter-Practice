import 'package:flutter/material.dart';
import 'package:fluttery/layout.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Tinder Matching",
      home: new MyHomePage(),
      theme: new ThemeData(primaryColorBrightness: Brightness.light),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _buildAppBar() {
    return new AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: new IconButton(
        icon: new Icon(
          Icons.person,
          color: Colors.grey,
          size: 40.0,
        ),
        onPressed: () {},
      ),
      title: new FlutterLogo(
        size: 30.0,
        colors: Colors.red,
      ),
      actions: <Widget>[
        new IconButton(
            icon: new Icon(Icons.chat_bubble, size: 40.0, color: Colors.grey)),
      ],
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0.0,
      child: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new RoundIconButton.small(
                icon: Icons.refresh,
                iconColor: Colors.orange,
                onPressed: () {},
              ),
              new RoundIconButton.large(
                icon: Icons.clear,
                iconColor: Colors.red,
                onPressed: () {},
              ),
              new RoundIconButton.small(
                icon: Icons.star,
                iconColor: Colors.blue,
                onPressed: () {},
              ),
              new RoundIconButton.large(
                icon: Icons.favorite,
                iconColor: Colors.green,
                onPressed: () {},
              ),
              new RoundIconButton.small(
                icon: Icons.lock,
                iconColor: Colors.purple,
                onPressed: () {},
              ),
            ]),
      ),
    );
  }

  Widget _buildCardStack() {
    return new AnchoredOverlay(
      showOverlay: true,
      child: new Center(),
      overlayBuilder: (BuildContext context, Rect anchorBounds, Offset anchor) {
        return CenterAbout(
          position: anchor,
          child: new Container(
            width: anchorBounds.width,
            height: anchorBounds.height,
            padding: const EdgeInsets.all(16.0),
            child: new ProfileCard(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      body: _buildCardStack(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double size;
  final VoidCallback onPressed;

  RoundIconButton.large({this.icon, this.iconColor, this.onPressed})
      : size = 60.0;

  RoundIconButton.small({this.icon, this.iconColor, this.onPressed})
      : size = 50.0;

  RoundIconButton({this.icon, this.iconColor, this.onPressed, this.size});

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: size,
      height: size,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            new BoxShadow(color: const Color(0x22000000), blurRadius: 10.0)
          ]),
      child: new RawMaterialButton(
        shape: new CircleBorder(),
        elevation: 0.0,
        child: new Icon(icon, color: iconColor),
        onPressed: onPressed,
      ),
    );
  }
}

class ProfileCard extends StatefulWidget {
  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {


  Widget _buildBackground() {
    return new PhotoBrowser(photoAssets: [
      'assets/image1.jpg',
      'assets/image2.jpg',
      'assets/image3.jpg',
      'assets/image4.jpg',
    ], visiblePhoneIndex: 0);
  }

  Widget _buildProfileSynopsis() {
    return new Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: new Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.8)])),
        padding: const EdgeInsets.all(24.0),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Text(
                    'Fist Last',
                    style: new TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                  new Text(
                    'Some description',
                    style: new TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ],
              ),
            ),
            new Icon(
              Icons.info,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(10.0),
          boxShadow: [
            new BoxShadow(
                color: const Color(0x11000000),
                blurRadius: 5.0,
                spreadRadius: 2.0)
          ]),
      child: ClipRRect(
        borderRadius: new BorderRadius.circular(10.0),
        child: new Material(
            child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[_buildBackground(), _buildProfileSynopsis()],
        )),
      ),
    );
  }
}

class PhotoBrowser extends StatefulWidget {
  final List<String> photoAssets;
  final int visiblePhoneIndex;

  PhotoBrowser({this.photoAssets, this.visiblePhoneIndex});

  @override
  _PhotoBrowserState createState() => _PhotoBrowserState();
}

enum DirectionFlag { NonDetermined, SlideLeft, SlideRight }

class _PhotoBrowserState extends State<PhotoBrowser>
    with SingleTickerProviderStateMixin {
  int visiblePhoneIndex;
  int nextVisiblePhoneIndex;
  RenderBox renderBox;
  DirectionFlag directionFlag = DirectionFlag.NonDetermined;
  AnimationController slideController;
  Animation<double> _animation;
  double widgetWidth = 350.0;

  @override
  void initState() {
    super.initState();
    visiblePhoneIndex = widget.visiblePhoneIndex;
    nextVisiblePhoneIndex = visiblePhoneIndex;
    slideController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 300))
      ..addListener(_update)
      ..addStatusListener(_statusListener);
    _animation = new Tween<double>(begin: 0.0, end: widgetWidth)
        .animate(slideController);
  }

  _update() {
    setState(() {});
  }

  _statusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      visiblePhoneIndex = nextVisiblePhoneIndex;
      slideController.value = 0.0;
    }
  }

  Widget _buildAnimatedEffect() {
    print('Animated valude: ${_animation?.value}');
    int flag = 0;
    if (directionFlag == DirectionFlag.SlideLeft) flag = -1;
    if (directionFlag == DirectionFlag.SlideRight) flag = 1;
    return Stack(
      fit: StackFit.expand,
      children: [
        Transform(
            transform:
                Matrix4.translationValues(flag * _animation.value, 0.0, 0.0),
            child: Opacity(
              opacity: 1.0 - slideController.value,
              child: Image.asset(
                widget.photoAssets[visiblePhoneIndex],
                fit: BoxFit.cover,
              ),
            )),
        Transform(
          transform: Matrix4.translationValues(
              -1 * flag * widgetWidth + flag * _animation.value, 0.0, 0.0),
          child: Opacity(
              opacity: slideController.value,
              child: Image.asset(
                widget.photoAssets[nextVisiblePhoneIndex],
                fit: BoxFit.cover,
              )),
        ),
      ],
    );
  }

  @override
  void didUpdateWidget(PhotoBrowser oldWidget) {
    super.didUpdateWidget(oldWidget);
    // if (widget.visiblePhoneIndex != oldWidget.visiblePhoneIndex) {
    //   visiblePhoneIndex = widget.visiblePhoneIndex;
    // }
  }

  void _prevImage() {
    directionFlag = DirectionFlag.SlideRight;
    setState(() {
      nextVisiblePhoneIndex = visiblePhoneIndex > 0 ? visiblePhoneIndex - 1 : 0;

      if (nextVisiblePhoneIndex >= 0) slideController.forward();
    });
  }

  void _nextImage() {
    renderBox = context.findRenderObject();
    directionFlag = DirectionFlag.SlideLeft;
    setState(() {
      nextVisiblePhoneIndex = visiblePhoneIndex < widget.photoAssets.length - 1
          ? visiblePhoneIndex + 1
          : visiblePhoneIndex;
      if (nextVisiblePhoneIndex < widget.photoAssets.length)
        slideController.forward();
    });
  }

  Widget _buildPhotoControls() {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new GestureDetector(
          onTap: _prevImage,
          child: new FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 1.0,
            alignment: Alignment.topLeft,
            child: new Container(color: Colors.transparent),
          ),
        ),
        new GestureDetector(
          onTap: _nextImage,
          child: new FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 1.0,
            alignment: Alignment.topRight,
            child: new Container(color: Colors.transparent),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        //Photo
        _buildAnimatedEffect(),
        // new Image.asset(
        //   widget.photoAssets[visiblePhoneIndex],
        //   fit: BoxFit.cover,
        // ),
        //Photo Indicator

        //Controls
        _buildPhotoControls()
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:our_lives/common/album_card.dart';
import 'package:our_lives/common/tab_text.dart';
import 'package:our_lives/models/album.dart';

class HorizontalTabLayout extends StatefulWidget {
  @override
  _HorizontalTabLayoutState createState() => _HorizontalTabLayoutState();
}

class _HorizontalTabLayoutState extends State<HorizontalTabLayout>
    with SingleTickerProviderStateMixin {
  int selectedTabIndex = 0;
  AnimationController _controller;
  Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(-0.05, 0)).animate(_controller);
    // _animation = Tween<Offset>(begin: 0.0, end: 1.0).animate(_controller);
  }

  Future<dynamic> playAnimation() async {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        height: 400.0,
        child: Stack(children: <Widget>[
          Positioned(
            left: 0,
            bottom: 0,
            top: 0,
            width: 80.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TabText(
                    text: 'Albums',
                    isSelected: selectedTabIndex == 0,
                    onTabTap: () {
                      onTabTap(0);
                    },
                  ),
                  TabText(
                      text: 'Favorite',
                      isSelected: selectedTabIndex == 1,
                      onTabTap: () {
                        onTabTap(1);
                      }),
                  TabText(
                      text: '...',
                      // isSelected: selectedTabIndex == 2,
                      // onTabTap: () {
                      //   onTabTap(2);
                      // }
                    )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80.0),
            child: FutureBuilder(
              future: playAnimation(),
              builder: (context, snapshot) {
                return SlideTransition(
                    position: _animation,
                    child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: getList(selectedTabIndex),
                  ),
                );
              }
            ),
          )
        ]),
      ),
    );
  }

  List<Widget> getList(index) {
    return [
      [
        AlbumCard(album: memeAlbum),
        AlbumCard(album: memeAlbum),
        AlbumCard(album: memeAlbum),
        AlbumCard(album: memeAlbum)
      ],
      [
        AlbumCard(album: memeAlbum),
        AlbumCard(album: memeAlbum)
      ],
    ][index];
  }

  void onTabTap(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }
}

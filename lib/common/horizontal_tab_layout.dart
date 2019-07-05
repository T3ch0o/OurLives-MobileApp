import 'package:flutter/material.dart';
import 'package:our_lives/common/album_card.dart';
import 'package:our_lives/common/tab_text.dart';
import 'package:our_lives/models/album.dart';

class HorizontalTabLayout extends StatefulWidget {
  @override
  _HorizontalTabLayoutState createState() => _HorizontalTabLayoutState();
}

class _HorizontalTabLayoutState extends State<HorizontalTabLayout> {
    int selectedTabIndex = 0;

    @override
    Widget build(BuildContext context) {
    return Container(
        height: 400,
          child: Stack(
                children: <Widget>[
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
                                        text: '...',
                                        isSelected: selectedTabIndex == 1,
                                        onTabTap: () {
                                            onTabTap(1);
                                        }
                                    ),
                                    TabText(
                                        text: '...',
                                        isSelected: selectedTabIndex == 2,
                                        onTabTap: () {
                                            onTabTap(2);
                                        }
                                    )
                                ],
                            ),
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          AlbumCard(album: memeAlbum),
                          AlbumCard(album: memeAlbum)
                        ],
                      ),
                    )
                ]
            ),
        );
    }

    onTabTap(int index) {
        setState(() {
            selectedTabIndex = index;
        });
    }
}
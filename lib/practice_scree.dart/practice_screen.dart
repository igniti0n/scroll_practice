import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scroll_practice/practice_scree.dart/list_item.dart';
import 'package:scroll_practice/practice_scree.dart/top_row.dart';

class PracticeScreen extends StatelessWidget {
  PracticeScreen({Key key}) : super(key: key);

//   @override
//   _PracticeScreenState createState() => _PracticeScreenState();
// }

// class _PracticeScreenState extends State<PracticeScreen> {
  final List<String> _dummyChildren = [
    'This is some item.',
    'I am another item too!',
    'I dont like other items.',
    'I am most cool item here.',
    'This is some item.',
    'I am another item too!',
    'I dont like other items.',
    'I am most cool item here.',
  ];

  final ScrollController _topScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;

    dev.log('GLAVNI BUILD');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [IconButton(icon: Icon(Icons.menu), onPressed: () {})],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            width: _screenSize.width,
          ),
          TopRow(
            scrollController: _topScrollController,

            //),
          ),
          Expanded(
            child: CustomScrollView(
              // physics: BouncingScrollPhysics(),
              controller: _topScrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 80,
                    width: _screenSize.width,
                  ),
                ),

                // SizedBox(
                //   height: 50,
                //   width: _screenSize.width,
                //   child: // Container(),

                SliverPersistentHeader(
                  pinned: true,
                  delegate: HeaderDelegate(),
                ),
                SliverPadding(
                  padding: EdgeInsets.all(10),
                  sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (ctx, index) => Align(
                      heightFactor: 0.74,
                      child: ListItem(
                        text: _dummyChildren[index],
                        scrollController: _topScrollController,
                        index: index,
                      ),
                    ),
                    childCount: _dummyChildren.length,
                  )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 40,
      color: Colors.white,
      child: Text(
        'Discover',
        style:
            Theme.of(context).textTheme.headline1.copyWith(color: Colors.black),
      ),
    );
  }

  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate.maxExtent != this.maxExtent ||
        oldDelegate.minExtent != this.minExtent;
  }
}

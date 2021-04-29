import 'package:flutter/material.dart';
import 'package:scroll_practice/practice_scree.dart/top_row.dart';

class PracticeScreen extends StatefulWidget {
  PracticeScreen({Key key}) : super(key: key);

  @override
  _PracticeScreenState createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [IconButton(icon: Icon(Icons.menu), onPressed: () {})],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TopRow(),
          ),
          SliverAppBar(
            title: Text('Discover'),
            pinned: true,
            backgroundColor: Colors.white,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (ctx, index) {},
            childCount: _dummyChildren.length,
          ))
        ],
      ),
    );
  }
}

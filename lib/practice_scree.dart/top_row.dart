import 'dart:math';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:animator/animator.dart';

class TopRow extends StatelessWidget {
  final ScrollController _scrollController;
  final AnimatorKey _animatorKey = AnimatorKey();
  TopRow({Key key, ScrollController scrollController})
      : this._scrollController = scrollController,
        super(key: key) {
    _scrollController.addListener(() {
      if (_scrollController.offset > 60 && _animatorKey.animation.isDismissed)
        _animatorKey.controller.forward();
      if (_scrollController.offset < 60 && _animatorKey.animation.isCompleted)
        _animatorKey.controller.reverse();
    });
  }

//   @override
//   _TopRowState createState() => _TopRowState();
// }

// class _TopRowState extends State<TopRow> {
//   bool _isClosed = false;

  @override
  // void initState() {
  //   super.initState();
  //   widget._scrollController.addListener(() {
  //     if (widget._scrollController.offset > 40 && !_isClosed)
  //       setState(() {
  //         dev.log('CLOSING' + widget._scrollController.offset.toString());
  //         _isClosed = true;
  //       });
  //     if (widget._scrollController.offset < 40 && _isClosed)
  //       setState(() {
  //         dev.log('OPENING' + widget._scrollController.offset.toString());
  //         _isClosed = false;
  //       });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    dev.log('building top');

    final Size _screenSize = MediaQuery.of(context).size;
    final double _itemHeight = 250;

    return
        // _screenSize.height * max(0, 50 - widget._scrollController.offset),
        Animator(
            animatorKey: _animatorKey,
            tween: Tween<double>(begin: 1, end: 0),
            duration: Duration(milliseconds: 350),
            triggerOnInit: false,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.all(10),
                child: FittedBox(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.scaleDown,
                  child: Row(
                    children: [
                      const TopWidget(),
                      const TopWidget(),
                      const TopWidget(),
                      const TopWidget(),
                      const TopWidget(),
                      const TopWidget(),
                      const TopWidget(),
                    ],
                  ),
                ),
              ),
            ),
            builder: (ctx, state, child) {
              dev.log('building');
              return FadeTransition(
                opacity: state.animation,
                child: Container(
                  height: _itemHeight * state.animation.value,
                  width: _screenSize.width,
                  child: child,
                ),
              );
            });
  }
}

class TopWidget extends StatelessWidget {
  const TopWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final Random _rand = Random();

    return
        // constraints: BoxConstraints(minHeight: 20),
        Container(
      height: 250,
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Color.fromARGB(
              255, _rand.nextInt(255), _rand.nextInt(255), _rand.nextInt(255)),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'This is a title',
            style: _textTheme.headline1,
          ),
          Text(
            'Thsi is subtitle',
            style: _textTheme.bodyText1,
          ),
          Spacer(),
        ],
      ),
    );
  }
}

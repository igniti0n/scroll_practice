import 'dart:math';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final String text;
  final ScrollController _scrollController;
  final int index;
  const ListItem(
      {Key key,
      @required this.text,
      ScrollController scrollController,
      this.index})
      : this._scrollController = scrollController,
        super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  void initState() {
    super.initState();

    widget._scrollController.addListener(update);
  }

  void update() {
    final double _offset = widget._scrollController.offset;
    // dev.log('scroll offset of list:' + _offset.toString());

    final _treshold = (40 + widget.index * 130);
    if (_offset > _treshold) {
      setState(() {
        _scale = max(0, ((_treshold + 50) - _offset) / 50);
      });
    } else {
      setState(() {
        _scale = 1;
      });
    }
  }

  @override
  void dispose() {
    widget._scrollController.removeListener(update);
    super.dispose();
  }

  double _scale = 1.0;
  final Random _rand = Random();

  @override
  Widget build(BuildContext context) {
    final TextStyle _style =
        Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black);

    return Opacity(
      opacity: _scale,
      child: Transform.scale(
        scale: _scale,
        child: Container(
          height: 160,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(width: 6),
            color: Colors.white,
            // Color.fromARGB(
            //     255, _rand.nextInt(255), _rand.nextInt(255), _rand.nextInt(255)),
          ),
          child: Text(
            widget.text,
            style: _style,
          ),
        ),
      ),
    );
  }
}

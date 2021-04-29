import 'package:flutter/material.dart';

class TopRow extends StatelessWidget {
  const TopRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ListView(
          scrollDirection: Axis.horizontal,
          children: [
            TopWidget(),
            TopWidget(),
            TopWidget(),
            TopWidget(),
            TopWidget(),
            TopWidget(),
            TopWidget(),
          ],
        )
      ],
    );
  }
}

class TopWidget extends StatelessWidget {
  const TopWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    return Container(
      child: Column(
        children: [
          Text(
            'This is a title',
            style: _textTheme.headline1,
          ),
          Text(
            'Thsi is subtitle',
            style: _textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}

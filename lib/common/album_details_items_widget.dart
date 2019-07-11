import 'package:flutter/material.dart';

import 'label_value_widget.dart';

class AlbumDetailsItemsWidget extends StatelessWidget {
  final TextStyle labelStyle, valueStyle;

  AlbumDetailsItemsWidget({this.labelStyle, this.valueStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        LabelValueWidget(
            value: '0',
            label: 'favourites',
            labelStyle: labelStyle,
            valueStyle: valueStyle),
        LabelValueWidget(
            value: '0',
            label: 'subscribers',
            labelStyle: labelStyle,
            valueStyle: valueStyle)
      ]
    );
  }
}

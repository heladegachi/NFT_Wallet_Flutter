import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultTextWidget extends StatelessWidget {
  final double textSize;
  final Color textColor;
  final String text;
  final FontWeight fontWeight;
  final Alignment alignment;
  const DefaultTextWidget({Key  key, this.textSize  , this.textColor = Colors.white, @required this.text, this.fontWeight, this.alignment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment!=null? alignment : null,
      child: Text(
        text,
        style: TextStyle(color: textColor?? Colors.white, fontSize: textSize?? 18,
            fontWeight: fontWeight?? FontWeight.normal ),
      ),
    );
  }
}

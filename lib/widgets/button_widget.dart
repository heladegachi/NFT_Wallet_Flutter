import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/index.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  final double buttonWidth;
  final Widget buttonIcon;
  const ButtonWidget({Key key, @required this.buttonText,
  @required this.onPressed,
      this.buttonWidth,  this.buttonIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width ;
    return Card(
      color: Colors.transparent,
      child: Container(
        width: buttonWidth!=null? buttonWidth : null ,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.5)),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: TextButton(
          onPressed: onPressed,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          buttonIcon != null? buttonIcon : Icon(Icons.arrow_downward_rounded, color: Colors.blue),
          SizedBox(
            width: 8,
          ),
          DefaultTextWidget(text: buttonText),
        ])),
      ),
    );
  }
}

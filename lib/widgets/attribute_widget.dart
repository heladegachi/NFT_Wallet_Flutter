import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/models/attribute_model.dart';
import 'package:flutter_project/widgets/default_text_widget.dart';

class AttributeWidget extends StatelessWidget {
  final Attribute attribute;
  const AttributeWidget({Key key, this.attribute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius:
            BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultTextWidget(text: attribute.name, textSize: 14,),
              DefaultTextWidget(text: attribute.type, textSize: 14)
            ],
          ),
        )
    );
  }
}

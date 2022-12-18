import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/default_text_widget.dart';

class NFTElementWidget extends StatelessWidget {
   final String nftImage;
   final String nftName;
   final int nftPoints;
  const NFTElementWidget({Key key,@required this.nftImage,@required this.nftName,@required this.nftPoints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 150,
            width: 170,
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      child: Image.asset(
                        nftImage,
                        fit: BoxFit.fill,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    )),
                Positioned(
                    top: 115,
                    left: 130,
                    height: 30,
                    child: CircleAvatar(
                        backgroundColor: Colors.black26,
                        child: Center(child: DefaultTextWidget(text: nftPoints.toString(), textSize: 14, ))))
              ],
            ),
          ),
          Container(
            height: 30,
            width: 170,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: DefaultTextWidget(
                    text: nftName,
                  )
                ),
                SizedBox(width: 8,),
                Icon(Icons.ac_unit_outlined, size:16, color: Colors.grey,)
              ],
            ),
          )
        ],
      ),
    );
  }
}

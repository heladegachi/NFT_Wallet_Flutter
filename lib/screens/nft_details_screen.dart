import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/models/attribute_model.dart';
import 'package:flutter_project/models/index.dart';
import 'package:flutter_project/widgets/attribute_widget.dart';
import 'package:flutter_project/widgets/default_text_widget.dart';
import 'package:flutter_project/widgets/index.dart';

class NftDetailsScreen extends StatefulWidget {
  final NFTElement nftElement;

  const NftDetailsScreen({Key key, this.nftElement}) : super(key: key);

  @override
  State<NftDetailsScreen> createState() => _NftDetailsScreenState();
}

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class _NftDetailsScreenState extends State<NftDetailsScreen> {
  NFTElement _nftElement;
  String _selectedMenu = '';
  String dropdownValue ;

  @override
  void initState() {
    _nftElement = widget.nftElement;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth= MediaQuery.of(context).size.width;
    double screenHeight= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Container(
              alignment: Alignment.center,
              child: DefaultTextWidget(
                text: _nftElement.name,
              )),

        actions: <Widget>[
          // This button presents popup menu items.
          PopupMenuButton<Menu>(
            // Callback that sets the selected popup menu item.
              onSelected: (Menu item) {
                setState(() {
                  _selectedMenu = item.name;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                const PopupMenuItem<Menu>(
                  value: Menu.itemOne,
                  child: Text('Item 1'),
                ),
                const PopupMenuItem<Menu>(
                  value: Menu.itemTwo,
                  child: Text('Item 2'),
                ),
                const PopupMenuItem<Menu>(
                  value: Menu.itemThree,
                  child: Text('Item 3'),
                ),
                const PopupMenuItem<Menu>(
                  value: Menu.itemFour,
                  child: Text('Item 4'),
                ),
              ]),
        ],),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: screenHeight/2,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Image.asset(_nftElement.nftPicture, fit: BoxFit.cover,)),
              ),
              SizedBox(height: 20,),
              ButtonWidget(
                buttonText: "Send",
              buttonIcon: Transform.rotate(child: Icon(Icons.arrow_upward_outlined,
                  color: Colors.blue),
               angle: 0.7),),
              SizedBox(height: 20,),
              DefaultTextWidget(text: "Description",
                fontWeight: FontWeight.bold,
                alignment: Alignment.centerLeft,),
              SizedBox(height: 20,),
              DefaultTextWidget(text: _nftElement.description,
                textSize: 16,
                textColor: Colors.grey,
                fontWeight: FontWeight.normal,
                alignment: Alignment.centerLeft,),
              SizedBox(height: 20,),
              Container(
                height: 300,
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3,
                      ),
                      itemCount: _nftElement.attributes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return  Container(
                            alignment: Alignment.centerLeft,
                            child:  AttributeWidget(
                              attribute: _nftElement.attributes[index],
                            )
                        );
                      }
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/data/local_data.dart';
import 'package:flutter_project/screens/nft_details_screen.dart';
import 'package:flutter_project/widgets/index.dart';

import '../models/index.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key key}) : super(key: key);

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen>
    with TickerProviderStateMixin{
   TabController _tabController  ;
   List<FilterOption> filterOptions;
   List<NFTElement> nftElements;

  @override
  void initState() {
    _tabController =   TabController(vsync: this, length: 3);

    filterOptions= [FilterOption( "All" ,null, true  ),
      FilterOption("Ethereum" ,null, false),
    FilterOption("Solana",  null, false),
    FilterOption("Bitcoin",  null, false),
    FilterOption("Luna",  null, false),
    FilterOption("Ethereum",  null, false),
    FilterOption("Bitcoin",  null, false)];

    nftElements= nftElementsList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width - 58;
    double screenHeight = MediaQuery.of(context).size.height - 18;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar:  AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon( Icons.person_outline_outlined),
          Row(
            children: [
              SizedBox(width: 16,),
              DefaultTextWidget( text: "Wallet 1 - 9H7" , fontWeight: FontWeight.bold,  ),
              SizedBox(width: 8,),
              Icon( Icons.keyboard_arrow_down_rounded),
            ],
          ),
          Icon( Icons.stacked_line_chart_rounded)
        ],
      ),),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Container(

                  child: new TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(
                        text: 'Coins',
                      ),
                      Tab(
                        text: 'Defi',
                      ),
                      Tab(
                        text: 'NFTs',
                      ),
                    ],
                  ),
                ),
                Container(
                  height: screenHeight,
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      Column(
                        children: [
                          Container(
                            height: 180,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      DefaultTextWidget(text: "TOTAL FLOOR VALUE", textSize: 14,
                                          textColor: Colors.grey),
                                      SizedBox(width: 8,),
                                      Icon(Icons.remove_red_eye_outlined, color: Colors.grey, size: 18 )
                                    ],
                                  ),
                                ),
                                DefaultTextWidget(text: "\$52,896.64", fontWeight: FontWeight.bold,
                                textSize: 36),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_drop_up_outlined, color: Colors.greenAccent,),
                                      SizedBox(width: 4,),
                                      DefaultTextWidget(text: "4.2%", textColor: Colors.greenAccent),
                                      SizedBox(width: 10,),
                                      DefaultTextWidget(text: "Past 24hrs" , textSize: 16,
                                      textColor: Colors.grey,),
                                      SizedBox(width: 10,),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          ButtonWidget(
                            buttonText: "Receive",
                            onPressed: (){
                              print("sdf");
                            },
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                                itemCount: filterOptions.length,
                                itemBuilder: (BuildContext context, int index){
                                  return Padding(
                                    padding: const EdgeInsets.only(right:16.0, top:8,
                                    bottom:8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: filterOptions[index].isSelected? Colors.blueAccent : null,
                                          border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.all(Radius.circular(10))),
                                      child: Center(child: Padding(
                                        padding: const EdgeInsets.only(top:8.0, bottom: 8,
                                            left: 22, right: 22),
                                        child: DefaultTextWidget( text: filterOptions[index].name,
                                        textSize: 14,
                                        textColor: Colors.white,),
                                      )),
                                    ),
                                  );
                                }),
                          ),

                          SizedBox(height: 20,),


                         Container(
                           height: 300,
                            child: GridView.builder(
                                itemCount: nftElements.length,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ), itemBuilder: (BuildContext context, int Index){
                              return  Container(
                                alignment: Alignment.centerLeft,
                                height: 250,
                                child:   GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, 
                                    MaterialPageRoute(builder: (context) =>
                                     NftDetailsScreen( nftElement: nftElements[Index],)));
                                  },
                                  child: NFTElementWidget(
                                    nftImage: nftElements[Index].nftPicture,
                                    nftPoints: nftElements[Index].nftPoints,
                                    nftName: nftElements[Index].name,
                                  ),
                                ),
                              );
                            }),
                          )


                        ],
                      ),
                      new Card(

                      ),
                      new Card(
                        child: new ListTile(
                          leading: const Icon(Icons.location_on),
                          title: new Text('nft'),
                          trailing: new IconButton(icon: const Icon(Icons.monetization_on), onPressed: () {}),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}

class FilterOption{
  String name;
  Icon icon;
  bool isSelected;
  FilterOption(this.name, this.icon, this.isSelected);
}
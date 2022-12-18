import 'package:flutter_project/models/cryptocurrency_model.dart';

import 'attribute_model.dart';

class NFTElement{
  final double price;
  final String name;
  final String nftPicture;
  final int nftPoints;
  final Cryptocurrency currency;
  final String description;
  final List<Attribute> attributes;


  NFTElement( this.name, this.price, this.nftPicture, this.nftPoints, this.currency, this.description, this.attributes);

}
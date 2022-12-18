

import 'package:flutter_project/models/attribute_model.dart';
import 'package:flutter_project/models/index.dart';
Cryptocurrency ethereum = Cryptocurrency("Ethereum", null);
Cryptocurrency bitcoin = Cryptocurrency("Bitcoin", null);
Cryptocurrency solana = Cryptocurrency("Solana", null);
Cryptocurrency luna = Cryptocurrency("Luna", null);

Attribute arms = Attribute("ARMS", "OG Trooper A1");
Attribute chest = Attribute("CHEST", "OG Heavy C2");
Attribute helmet= Attribute("HELMET", "OG Delta Trooper");
Attribute jaws = Attribute("JAWS", "OG Sabotage 57");

List<Attribute> attributes = [arms, chest, helmet, jaws];

String description = "The MekaVerse is a collection of 8,482 generative "
    "Mekas inspired by the Japanese Anime Universe.";

List<NFTElement> nftElementsList=[
NFTElement("Dronies", null,"assets/images/nft_6.jpg" , 12,  ethereum , description,  attributes ),
NFTElement("Doodles", null,"assets/images/nft_5.jpg" , 1, bitcoin,description, attributes ),
NFTElement("Dronies", null,"assets/images/nft_3.png" , 5, solana ,description, attributes),
NFTElement("Dronies", null,"assets/images/nft_7.jpg" , 26, ethereum,description, attributes ),
];
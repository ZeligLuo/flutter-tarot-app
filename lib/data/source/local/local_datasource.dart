import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tarot_app/data/source/local/models/tea_leaf_card.dart';

class LocalDataSource{
  static Future<void> initialize() async{
    WidgetsFlutterBinding.ensureInitialized();
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    Hive.registerAdapter<TeaLeafCardHiveModel>(TeaLeafCardHiveModelAdapter());

    await Hive.openBox<TeaLeafCardHiveModel>(TeaLeafCardHiveModel.boxKey);
  }

  static const String teaLeafDeckPath = "/assets/json_files/tea_leaf_deck.json";

  bool hasData(){
    final teaLeafCardBox = Hive.box<TeaLeafCardHiveModel>(TeaLeafCardHiveModel.boxKey);
    final isHasData = teaLeafCardBox.length > 0 ? true : false;

    return isHasData;
  }

  List<TeaLeafCardHiveModel> loadDeckFromHive(){
    final teaLeafCardBox = Hive.box<TeaLeafCardHiveModel>(TeaLeafCardHiveModel.boxKey);
    final teaLeafCardDeck = List.generate(teaLeafCardBox.length, (index) => teaLeafCardBox.getAt(index)).whereType<TeaLeafCardHiveModel>().toList();

    return teaLeafCardDeck;
  }

  Future<void> saveDeck(List<TeaLeafCardHiveModel> teaLeafDeck) async{
    final teaLeafDeckBox = Hive.box<TeaLeafCardHiveModel>(TeaLeafCardHiveModel.boxKey);
    final teaLeafDeckMaps = { for(var card in teaLeafDeck) card.id : card };
    teaLeafDeckBox.putAll(teaLeafDeckMaps);
  }

  Future<List<TeaLeafCardHiveModel>> getTeaLeafCardDeckFromLocalFile() async{
    final String deckResponse = await rootBundle.loadString("/assets/json_files/tea_leaf_deck.json");
    final deckData = (json.decode(deckResponse) as List).map((item) => TeaLeafCardHiveModel.fromJson(item)).toList();

    return deckData;
  }
}
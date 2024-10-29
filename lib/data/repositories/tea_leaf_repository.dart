import 'package:tarot_app/data/source/local/local_datasource.dart';
import 'package:tarot_app/data/source/local/models/tea_leaf_card.dart';

abstract class TeaLeafRepository{
  Future<List<TeaLeafCardHiveModel>> getTeaLeafCardDeck();
}

class TeaLeafDefaultRepository extends TeaLeafRepository{
  final LocalDataSource _localDataSource = LocalDataSource();

  Future<List<TeaLeafCardHiveModel>> getTeaLeafCardDeck() async{
    final hasCacheData = _localDataSource.hasData();

    if(!hasCacheData){
      final deckHiveModelData = await _localDataSource.getTeaLeafCardDeckFromLocalFile();
      _localDataSource.saveDeck(deckHiveModelData);
    }

    final teaLeafCardDeck = _localDataSource.loadDeckFromHive();
    return teaLeafCardDeck;
  }
}


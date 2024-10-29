import 'package:tarot_app/data/source/firebase/firebase_datasource.dart';
import 'package:tarot_app/data/source/firebase/models/tarot_card.dart';
import 'package:tarot_app/data/source/mappers/firebase_to_entity_mapper.dart';
import 'package:tarot_app/domain/entities/tarot_card.dart';

abstract class TarotRepository{
  Future<List<TarotCard>> getTarotDeck();
}

class TarotDefaultRepository extends TarotRepository{
  final FirebaseDataSource firebaseDataSource;

  TarotDefaultRepository({required this.firebaseDataSource});

  @override
  Future<List<TarotCard>> getTarotDeck() async{
    var firebaseCardDeck = await getFirebaseTarotCardDek();
    var entitiesTarotCardDeck = _convertFirebaseModelToEntities(firebaseCardDeck);

    return entitiesTarotCardDeck;
  }

  Future<List<FirebaseTarotCardModel>> getFirebaseTarotCardDek() async{
    final tarotDeckFirebaseModel = await firebaseDataSource.getTarotDeck();

    return tarotDeckFirebaseModel;
  }

  List<TarotCard> _convertFirebaseModelToEntities(List<FirebaseTarotCardModel> firebaseCardDeck){
    List<TarotCard> entitiesCardDeck = [];

    for (var firebaseTarotCard in firebaseCardDeck) {
      var entitiesTarotCard = firebaseTarotCard.toEntity();
      entitiesCardDeck.add(entitiesTarotCard);
    }

    return entitiesCardDeck;
  }
}
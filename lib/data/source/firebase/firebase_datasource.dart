import 'package:tarot_app/core/network_manager.dart';
import 'package:tarot_app/data/source/firebase/models/tarot_card.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../../firebase_options.dart';

class FirebaseDataSource{
  FirebaseDataSource();

  Future<List<FirebaseTarotCardModel>> getTarotDeck() async{
    List<FirebaseTarotCardModel> firebaseTarotCardList = [];

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    var tarotDeckFirebaseModel = FirebaseDatabase.instance.ref().child('tarot_deck');

    await tarotDeckFirebaseModel.once().then((snapshot){
      List<dynamic> tarotDeckJsonValues = snapshot.snapshot.value as List<dynamic>;

      for (var jsonCard in tarotDeckJsonValues) {
        Map<String, dynamic> cardAsMap = Map.from(jsonCard );
        var firebaseTarotCard = FirebaseTarotCardModel.fromJson(cardAsMap);
        firebaseTarotCardList.add(firebaseTarotCard);
      }
    });

    return firebaseTarotCardList;
  }
}
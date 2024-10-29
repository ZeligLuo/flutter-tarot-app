import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarot_app/data/repositories/tarot_repository.dart';
import 'package:tarot_app/domain/entities/tarot_card.dart';
import 'package:tarot_app/domain/entities/tarot_message.dart';
import 'package:tarot_app/domain/usecases/gemini_usecases.dart';
import 'package:tarot_app/domain/usecases/tarot_usecases.dart';
import 'package:tarot_app/presentation/states/tarot/tarot_state.dart';

class TarotCubit extends Cubit<TarotState>{
  TarotCubit(this._tarotRepository) : super(InitState()){
    _onLoadStarted();
  }

  final TarotRepository _tarotRepository;
  List<TarotCard> tarotDeck = [];
  List<TarotCard> pickedCards = [];
  List<int> pickedNumber = [];
  double chosenCardXPosition = 0;
  double chosenCardYPosition = 0;
  TarotMessage tarotMessage = TarotMessage();

  Future<void> _onLoadStarted() async{
    emit(LoadingState());

    tarotDeck = await TarotUseCases(tarotRepository: _tarotRepository).call();

    if(tarotDeck.isEmpty){
      emit(ErrorState());
    }
    else{
      emit(LoadedTarotState(tarotDeck));
      emit(OnPickingTarotCardState(false, pickedCards.length));
    }
  }

  void pickDailyTarot(){
    if(pickedNumber.length < 3){
      int randomInt = getRandomInt();
      pickedNumber.add(randomInt);
      var randomTarotCard = tarotDeck[randomInt];
      pickedCards.add(randomTarotCard);
      emit(OnPickingTarotCardState(true, pickedCards.length));
    }
  }

  int getRandomInt(){
    int randomInt = Random().nextInt(tarotDeck.length);
    if(!pickedNumber.contains(randomInt)){
      return randomInt;
    }

    return getRandomInt();
  }

  void pickOneCardCompleted() async{
    if(pickedCards.length < 3){
      emit(OnPickingTarotCardState(false, pickedCards));
    }
    else{
      emit(LoadingState());
      await GeminiUseCases().call(pickedCards).then((value){
        if(value != null){
          tarotMessage = value;
          emit(GenerateMessageCompleted(type: MessageType.Overall));
        }
        else{
          emit(ErrorState());
        }
      });
    }
  }

  void onChangeMessageType(String direction, GenerateMessageCompleted state){
    switch(state.type){
      case MessageType.Overall:
        if(direction == "Left"){
          emit(GenerateMessageCompleted(type: MessageType.Career));
        }
        else{
          emit(GenerateMessageCompleted(type: MessageType.Romance));
        }
        break;
      case MessageType.Career:
        if(direction == "Left"){
          emit(GenerateMessageCompleted(type: MessageType.Health));
        }
        else{
          emit(GenerateMessageCompleted(type: MessageType.Overall));
        }
        break;
      case MessageType.Romance:
        if(direction == "Left"){
          emit(GenerateMessageCompleted(type: MessageType.Overall));
        }
        else{
          emit(GenerateMessageCompleted(type: MessageType.Health));
        }
        break;
      case MessageType.Health:
        if(direction == "Left"){
          emit(GenerateMessageCompleted(type: MessageType.Romance));
        }
        else{
          emit(GenerateMessageCompleted(type: MessageType.Career));
        }
        break;
    }
  }
}
import 'package:equatable/equatable.dart';
import 'package:tarot_app/domain/entities/tarot_card.dart';
import 'package:tarot_app/domain/entities/tarot_message.dart';

abstract class TarotState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitState extends TarotState {}

class LoadingState extends TarotState {}

class ErrorState extends TarotState {}

class OnPickingTarotCardState extends TarotState{
  bool onPickingCard = false;
  int totalCardPicked = 0;

  OnPickingTarotCardState(this.onPickingCard, totalCardPicked);

  @override
  // TODO: implement props
  List<Object?> get props => [onPickingCard, totalCardPicked];

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    if(identical(this, other)){
      return true;
    }

    return (other is OnPickingTarotCardState) && other.onPickingCard == onPickingCard;
  }
}

class LoadedTarotState extends TarotState{
  final List<TarotCard> tarotDeck;

  LoadedTarotState(this.tarotDeck);

  @override
  // TODO: implement props
  List<Object?> get props => [tarotDeck];

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    if(identical(this, other)){
      return true;
    }

    return (other is LoadedTarotState) && other.tarotDeck.length == tarotDeck.length;
  }
}

enum MessageType { Overall, Romance, Career, Health }
class GenerateMessageCompleted extends TarotState{
  MessageType type;

  GenerateMessageCompleted({required this.type});

  @override
  // TODO: implement props
  List<Object?> get props => [type];
}
import 'package:tarot_app/core/usecase.dart';
import 'package:tarot_app/data/repositories/tarot_repository.dart';

class TarotUseCases implements NoParamsUseCase{
  TarotUseCases({required this.tarotRepository});

  TarotRepository tarotRepository;

  @override
  Future call() {
    // TODO: implement call
    return tarotRepository.getTarotDeck();
  }
}
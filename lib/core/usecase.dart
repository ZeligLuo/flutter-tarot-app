abstract class BaseUseCase<T>{
  const BaseUseCase();
}

abstract class UseCase<T, P> extends BaseUseCase<T>{
  UseCase() : super();

  Future<T> call(P params);
}

abstract class NoParamsUseCase<T> implements BaseUseCase<T>{
  NoParamsUseCase() : super();

  Future<T> call();
}
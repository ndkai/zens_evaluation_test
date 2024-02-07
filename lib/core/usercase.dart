

abstract class UseCase<T, R>{
  Future<T> call(R params);
}

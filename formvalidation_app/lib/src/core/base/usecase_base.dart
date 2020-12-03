
abstract class UseCaseBase<Type, Params> {
  Future<Type> call(Params params);
}

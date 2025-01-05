import 'dart:async';

abstract class Usecase<T, P> {
  FutureOr<T> call({required P params});
}

abstract class UsecaseEmptyParams<T, P> {
  FutureOr<T> call();
}

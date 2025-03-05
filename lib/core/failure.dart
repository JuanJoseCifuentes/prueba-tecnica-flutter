import 'package:equatable/equatable.dart';

  abstract class Failure extends Equatable {
    final String message;

    const Failure(this.message);

    @override
    List<Object?> get props => [message];
  }

  class ServerFailure extends Failure {
    const ServerFailure(super.message);

    @override
    String toString() => message;
  }

  class NotFoundFailure extends Failure {
    const NotFoundFailure(super.message);

    @override
    String toString() => message;
  }

  class LocalFailure extends Failure {
    const LocalFailure() : super('Local failure occurred');

    @override
    List<Object?> get props => [];
  }
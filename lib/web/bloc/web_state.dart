import 'package:equatable/equatable.dart';
import 'package:webyab/web_model.dart';

abstract class WebState extends Equatable {
  const WebState();

  @override
  List<Object?> get props => [];
}

class WebInitial extends WebState {}

class WebLoading extends WebState {}

class WebLoaded extends WebState {
  final List<WebModel> websites;

  const WebLoaded(this.websites);

  @override
  List<Object?> get props => [websites];
}

class WebError extends WebState {
  final String message;

  const WebError(this.message);

  @override
  List<Object?> get props => [message];
}

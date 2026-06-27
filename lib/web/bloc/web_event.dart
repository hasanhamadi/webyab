import 'package:equatable/equatable.dart';

abstract class WebEvent extends Equatable {
  const WebEvent();

  @override
  List<Object?> get props => [];
}

class GetWebEvent extends WebEvent {}

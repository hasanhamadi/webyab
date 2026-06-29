import 'package:equatable/equatable.dart';

abstract class WebShopEvent extends Equatable {
  const WebShopEvent();

  @override
  List<Object?> get props => [];
}

class GetWebEvent extends WebShopEvent {}

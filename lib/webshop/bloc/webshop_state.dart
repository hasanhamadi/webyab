import 'package:equatable/equatable.dart';
import 'package:webyab/webshop/web_shop_model.dart';

abstract class WebShopState extends Equatable {
  const WebShopState();

  @override
  List<Object?> get props => [];
}

class WebShopInitial extends WebShopState {}

class WebShopLoading extends WebShopState {}

class WebShopLoaded extends WebShopState {
  final List<WebShopModel> websites;

  const WebShopLoaded(this.websites);

  @override
  List<Object?> get props => [websites];
}

class WebShopError extends WebShopState {
  final String message;

  const WebShopError(this.message);

  @override
  List<Object?> get props => [message];
}

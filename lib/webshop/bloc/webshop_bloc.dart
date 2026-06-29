import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webyab/webshop/bloc/webshop_event.dart';
import 'package:webyab/webshop/bloc/webshop_state.dart';
import 'package:webyab/webshop/web_shop_repository.dart';

class WebShopBloc extends Bloc<WebShopEvent, WebShopState> {
  final WebShopRepository repository;

  WebShopBloc(this.repository) : super(WebShopInitial()) {
    on<GetWebEvent>(_getWebsites);
  }

  Future<void> _getWebsites(
    GetWebEvent event,
    Emitter<WebShopState> emit,
  ) async {
    emit(WebShopLoading());

    try {
      final result = await repository.getWebsites();

      emit(WebShopLoaded(result));
    } catch (e) {
      emit(WebShopError(e.toString()));
    }
  }
}

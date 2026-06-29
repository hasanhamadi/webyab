import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webyab/web/web_repository.dart';

import 'web_event.dart';
import 'web_state.dart';

class WebBloc extends Bloc<WebEvent, WebState> {
  final WebRepository repository;

  WebBloc(this.repository) : super(WebInitial()) {
    on<GetWebEvent>(_getWebsites);
  }

  Future<void> _getWebsites(GetWebEvent event, Emitter<WebState> emit) async {
    emit(WebLoading());

    try {
      final result = await repository.getWebsites();

      emit(WebLoaded(result));
    } catch (e) {
      emit(WebError(e.toString()));
    }
  }
}

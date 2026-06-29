import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:webyab/banner/banner_model.dart';
import 'package:webyab/banner/banner_repository.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRepository repository;

  BannerBloc(this.repository) : super(const BannerInitial()) {
    on<FetchBanners>(_onFetchBanners);
  }

  Future<void> _onFetchBanners(
    FetchBanners event,
    Emitter<BannerState> emit,
  ) async {
    emit(const BannerLoading());

    try {
      final List<BannerModel> banners = await repository.fetchBanners();

      if (banners.isEmpty) {
        emit(const BannerEmpty());
      } else {
        emit(BannerLoaded(banners));
      }
    } catch (e) {
      emit(BannerError(e.toString()));
    }
  }
}

part of 'banner_bloc.dart';

sealed class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object> get props => [];
}

/// Initial state
final class BannerInitial extends BannerState {
  const BannerInitial();
}

/// Loading state
final class BannerLoading extends BannerState {
  const BannerLoading();
}

/// Loaded state (success)
final class BannerLoaded extends BannerState {
  final List<BannerModel> banners;

  const BannerLoaded(this.banners);

  @override
  List<Object> get props => [banners];
}

/// Empty state (no data)
final class BannerEmpty extends BannerState {
  const BannerEmpty();
}

/// Error state
final class BannerError extends BannerState {
  final String message;

  const BannerError(this.message);

  @override
  List<Object> get props => [message];
}

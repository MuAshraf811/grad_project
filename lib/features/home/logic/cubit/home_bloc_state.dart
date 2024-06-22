part of 'home_bloc_cubit.dart';

sealed class HomeBlocState extends Equatable {
  const HomeBlocState();

  @override
  List<Object> get props => [];
}

final class HomeBlocInitial extends HomeBlocState {}

final class FetchingCategoryData extends HomeBlocState {}

final class CategoryDataFetchedSuccess extends HomeBlocState {}

final class FetchingCategoryDataError extends HomeBlocState {
  final String error;
  const FetchingCategoryDataError({required this.error});
}

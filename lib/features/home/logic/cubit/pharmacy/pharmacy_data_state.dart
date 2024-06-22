part of 'pharmacy_data_cubit.dart';

sealed class PharmacyDataState extends Equatable {
  const PharmacyDataState();

  @override
  List<Object> get props => [];
}

final class PharmacyDataInitial extends PharmacyDataState {}

final class FetchingPharmacyDetails extends PharmacyDataState {}

final class FetchingPharmacyDetailsSuccess extends PharmacyDataState {}

final class FetchingPharmacyDetailsError extends PharmacyDataState {
  final String error;
  const FetchingPharmacyDetailsError({required this.error});
}

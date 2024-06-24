part of 'doctors_cubit.dart';

sealed class DoctorsState extends Equatable {
  const DoctorsState();

  @override
  List<Object> get props => [];
}

final class DoctorsInitial extends DoctorsState {}

final class FetchingDoctorDataState extends DoctorsState {}

final class FetchingDoctorDataSuccessState extends DoctorsState {}

final class FetchingDoctorDataErrorState extends DoctorsState {}

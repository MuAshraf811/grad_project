import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/home/data/doctors.dart';
import 'package:graduation_project/features/home/models/doctors.dart';

part 'doctors_state.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  DoctorsCubit() : super(DoctorsInitial());

  List<DoctorsModel>? doctorsData;

  getDoctorsDetails() async {
    emit(FetchingDoctorDataState());
    try {
      final List<dynamic> res = await DoctorsDetaFetcher.getData();
      doctorsData = res.map((e) => DoctorsModel.fromJson(e)).toList();
      debugPrint('Fetching doctors data done');
      debugPrint(doctorsData.toString());
      emit(FetchingDoctorDataSuccessState());
    } catch (e) {
      debugPrint(e.toString());
      emit(FetchingDoctorDataErrorState());
    }
  }
}

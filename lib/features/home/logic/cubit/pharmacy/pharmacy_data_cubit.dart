import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation_project/features/home/data/pharmacy.dart';
import 'package:graduation_project/features/home/models/pharmacy_model.dart';
part 'pharmacy_data_state.dart';

class PharmacyDataCubit extends Cubit<PharmacyDataState> {
  PharmacyDataCubit() : super(PharmacyDataInitial());

  List<PharmacyModel>? pharmacyData;

  getPharmacyDetails() async {
    emit(FetchingPharmacyDetails());
    try {
      final List<dynamic> res = await PharmacyDetaFetcher.getData();
      pharmacyData = res.map((e) => PharmacyModel.fromJson(e)).toList();

      emit(FetchingPharmacyDetailsSuccess());
    } catch (e) {
      emit(FetchingPharmacyDetailsError(error: e.toString()));
    }
  }
}

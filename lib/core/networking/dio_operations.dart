import 'package:dio/dio.dart';

abstract class MainCrudOperations {
  getDataOperation();
  postDataOperation();
  deleteDataOperation();
  updateDataOperation();
}

class DioHelper implements MainCrudOperations {
  DioHelper({required this.dio});
  Dio dio;
  @override
  deleteDataOperation() {}

  @override
  getDataOperation() {}

  @override
  postDataOperation() {}

  @override
  updateDataOperation() {}
}

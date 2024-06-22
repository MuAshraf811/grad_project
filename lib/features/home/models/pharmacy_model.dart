class PharmacyModel {
  final String pharmacyId;
  final String pharmacyName;
  final String pharmacyLocation;
  final String closeTime;
  final String openTime;
  final String? pharmacyPhoneNum;
  final String? phone;
  final String pharmacyImagePath;

  PharmacyModel({
    required this.pharmacyId,
    required this.pharmacyName,
    required this.pharmacyImagePath,
    required this.pharmacyLocation,
    required this.pharmacyPhoneNum,
    required this.openTime,
    required this.closeTime,
    required this.phone,
  });
  factory PharmacyModel.fromJson(Map<String, dynamic> res) {
    return PharmacyModel(
        pharmacyId: res['id'] ?? 'ddddd',
        pharmacyName: res['name'] ?? 'ggg',
        pharmacyImagePath: res['image'] ?? '',
        phone: res['phone'] ?? '01152435311',
        pharmacyLocation: res['location'] ?? 'dddddd',
        pharmacyPhoneNum: res['phone'] ?? '',
        openTime: res['open_time'] ?? 'jj',
        closeTime: res['close_time'] ?? 'fgh');
  }
}

class DoctorsModel {
  final String firstName;
  final String lastName;
  final int price;
  final String location;
  final String doctorImage;
  final String specialization;
  final String email;

  DoctorsModel({
    required this.firstName,
    required this.lastName,
    required this.price,
    required this.location,
    required this.doctorImage,
    required this.specialization,
    required this.email,
  });

  factory DoctorsModel.fromJson(Map<String, dynamic> response) {
    return DoctorsModel(
        firstName: response['first_name'],
        lastName: response['last_name'],
        price: response['price_for_reservation'],
        location: response['location'],
        doctorImage: response['image'],
        specialization: response['specialization'],
        email: response['email']);
  }
}

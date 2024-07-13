class OuterChatModel {
  final String chatId;
  final String patientId;
  final String doctorId;
  final String doctorName;
  final String doctorImage;
  final String patientName;
  final String patientImage;
  final String doctorEmail;
  final String patientEmail;
  final String doctorBio;
  final String patientBio;
  final String docorTimeZone;
  final String patientTimeZone;

  OuterChatModel({
    required this.chatId,
    required this.patientId,
    required this.doctorId,
    required this.doctorName,
    required this.doctorImage,
    required this.patientName,
    required this.patientImage,
    required this.doctorEmail,
    required this.patientEmail,
    required this.patientBio,
    required this.doctorBio,
    required this.docorTimeZone,
    required this.patientTimeZone,
  });

  factory OuterChatModel.fromJson(Map<String, dynamic> res) {
    return OuterChatModel(
      chatId: res['id'],
      patientId: res['patient_profile']['id'],
      doctorId: res['doctor_profile']['id'],
      doctorBio: res['doctor_profile']['bio'] ?? 'No Bio',
      patientBio: res['patient_profile']['bio'] ?? 'No Bio',
      doctorName:
          "${res['doctor_profile']['first_name']} ${res['doctor_profile']['last_name']}",
      doctorImage: res['doctor_profile']['image'] ?? '',
      patientName:
          "${res['patient_profile']['first_name']} ${res['patient_profile']['last_name']}",
      patientImage: res['patient_profile']['image'] ?? '',
      doctorEmail: res['doctor_profile']['email'] ?? '',
      patientEmail: res['patient_profile']['email'] ?? '',
      docorTimeZone: res['doctor_profile']['timezone'] ?? '',
      patientTimeZone: res['doctor_profile']['timezone'] ?? '',
    );
  }
}

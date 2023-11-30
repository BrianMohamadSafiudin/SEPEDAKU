class SimModel {
  final String simImage;
  final String driverLicense;
  final String simNumber;
  final String name;
  final String dateBirth;
  final String gender;
  final String address;
  final String work;
  final String simPeriod;

  SimModel({
    required this.simImage,
    required this.name,
    required this.simNumber,
    required this.driverLicense,
    required this.dateBirth,
    required this.gender,
    required this.address,
    required this.work,
    required this.simPeriod,
  });

  Map<String, dynamic> toMap() {
    return {
      'simImage': simImage,
      'driverLicense': driverLicense,
      'name': name,
      'simNumber': simNumber,
      'dateBirth': dateBirth,
      'gender': gender,
      'address': address,
      'work': work,
      'simPeriod': simPeriod
    };
  }
}

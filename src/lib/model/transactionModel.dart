class TransactionModel {
  final String motor;
  final String imageMotor;
  final String nama;
  final DateTime mulaiRental;
  final DateTime selesaiRental;
  final int helm;
  final int totalPembayaran;
  final String lokasi;

  TransactionModel(
      {required this.motor,
      required this.imageMotor,
      required this.nama,
      required this.mulaiRental,
      required this.selesaiRental,
      required this.helm,
      required this.totalPembayaran,
      required this.lokasi});

  Map<String, dynamic> toMap() {
    return {
      'motor': motor,
      'imageMotor': imageMotor,
      'nama': nama,
      'mulaiRental': mulaiRental,
      'selesaiRental': selesaiRental,
      'helm': helm,
      'totalPembayaran': totalPembayaran,
      'lokasi': lokasi
    };
  }
}

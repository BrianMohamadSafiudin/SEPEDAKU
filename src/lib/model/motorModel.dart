class MotorModel {
  final String imageMotor;
  final String motor;
  final int harga;
  final int stok;
  final String deskripsi;
  final String jenisMotor;

  MotorModel(
      {required this.imageMotor,
      required this.motor,
      required this.harga,
      required this.stok,
      required this.deskripsi,
      required this.jenisMotor});

  Map<String, dynamic> toMap() {
    return {
      'imageMotor': imageMotor,
      'motor': motor,
      'harga': harga,
      'stok': stok,
      'deskripsi': deskripsi,
      'jenisMotor' : jenisMotor
    };
  }
}

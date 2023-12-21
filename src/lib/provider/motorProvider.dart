import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sepedaku/model/motorModel.dart';

class MotorProvider extends ChangeNotifier {
  List<MotorModel> _savedMotors = [];

  List<MotorModel> get savedMotors => _savedMotors;

  Future<void> fetchMotor() async {
    try {
      CollectionReference motorsCollection =
          FirebaseFirestore.instance.collection('motor');

      QuerySnapshot query = await motorsCollection.get();

      _savedMotors = query.docs.map((doc) {
        return MotorModel(
            imageMotor: doc['imageMotor'],
            motor: doc['motor'],
            harga: doc['harga'],
            stok: doc['stok'],
            deskripsi: doc['deskripsi'],
            jenisMotor: doc['jenisMotor']);
      }).toList();
      notifyListeners();
    } catch (e) {
      print('Error fetching saved sims: $e');
    }
  }
}

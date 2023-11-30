import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sepedaku/model/simModel.dart';

class SimProvider extends ChangeNotifier {
  List<SimModel> _savedSims = [];

  List<SimModel> get savedSims => _savedSims;

  void addSim(SimModel sim) {
    _savedSims.add(sim);
    notifyListeners();
  }

  void removeSim(int index) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      CollectionReference simsCollection = FirebaseFirestore.instance
          .collection('sim')
          .doc(user!.uid)
          .collection('simUser');

      if (index >= 0 && index < _savedSims.length) {
        QuerySnapshot querySnapshot = await simsCollection.get();
        String docIdToDelete = querySnapshot.docs[index].id;

        await simsCollection.doc(docIdToDelete).delete();

        _savedSims.removeAt(index);

        notifyListeners();
      }
    } catch (error) {
      print('Error deleting sim: $error');
    }
  }

  Future<void> fetchSavedSims() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      CollectionReference simsCollection = FirebaseFirestore.instance
          .collection('sim')
          .doc(user!.uid)
          .collection('simUser');

      QuerySnapshot querySnapshot = await simsCollection.get();

      _savedSims = querySnapshot.docs.map((doc) {
        return SimModel(
            simImage: doc['simImage'],
            name: doc['name'],
            simNumber: doc['simNumber'],
            dateBirth: doc['dateBirth'],
            address: doc['address'],
            gender: doc['gender'],
            work: doc['work'],
            driverLicense: doc['driverLicense'],
            simPeriod: doc['simPeriod']);
      }).toList();

      notifyListeners();
    } catch (error) {
      print('Error fetching saved sims: $error');
    }
  }
}

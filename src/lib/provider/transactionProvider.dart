import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sepedaku/model/transactionModel.dart';

class TransactionProvider extends ChangeNotifier {
  List<TransactionModel> _savedTransactions = [];

  List<TransactionModel> get savedTransactions => _savedTransactions;

  void addTransaction(TransactionModel transaction) {
    _savedTransactions.add(transaction);
    notifyListeners();
  }

  Future<void> addTransactionToFirebase(TransactionModel transaction) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        var transactionCollectionRef = FirebaseFirestore.instance
            .collection('transaction')
            .doc(user.uid)
            .collection('userTransaction');
        await transactionCollectionRef.doc().set(transaction.toMap());
      } else {
        print('User not authenticated');
      }
    } catch (e) {
      print('Error saving to Firestore: $e');
    }
  }

  Future<void> fetchSavedTransaction() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      CollectionReference transCollection = FirebaseFirestore.instance
          .collection('transaction')
          .doc(user!.uid)
          .collection('userTransaction');

      QuerySnapshot querySnapshot = await transCollection.get();

      _savedTransactions = querySnapshot.docs.map((doc) {
        Timestamp mulaiRental = doc['mulaiRental'];
        Timestamp selesaiRental = doc['selesaiRental'];
        return TransactionModel(
            motor: doc['motor'],
            imageMotor: doc['imageMotor'],
            nama: doc['nama'],
            mulaiRental: mulaiRental.toDate(),
            selesaiRental: selesaiRental.toDate(),
            helm: doc['helm'],
            totalPembayaran: doc['totalPembayaran'],
            lokasi: doc['lokasi']);
      }).toList();

      notifyListeners();
    } catch (error) {
      print('Error fetching saved sims: $error');
    }
  }
}

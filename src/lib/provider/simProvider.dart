import 'package:flutter/material.dart';
import 'package:sepedaku/model/simModel.dart';

class SimProvider extends ChangeNotifier {
  List<SimModel> _savedSims = [];

  List<SimModel> get savedSims => _savedSims;

  void addSim(SimModel sim) {
    _savedSims.add(sim);
    notifyListeners();
  }

  void removeSim(int index) {
    if (index >= 0 && index < _savedSims.length) {
      _savedSims.removeAt(index);
      notifyListeners();
    }
  }
}

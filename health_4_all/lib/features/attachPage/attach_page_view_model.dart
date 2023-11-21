import 'package:flutter/material.dart';

enum MedicationCategory {
  AntiHipertensivos,
  Antidiabeticos,
  Broncodilatadores,
  Geral,
}

class AttachPageModel {
  String mobilityDifficulty;
  List<MedicationCategory> selectedCategories;
  String? loadedDocumentName;
  bool agreedToTerms;

  AttachPageModel({
    required this.mobilityDifficulty,
    required this.selectedCategories,
    this.loadedDocumentName,
    this.agreedToTerms = false,
  });
}

class AttachPageViewModel extends ChangeNotifier {
  AttachPageModel _model = AttachPageModel(
    mobilityDifficulty: '',
    selectedCategories: [],
    agreedToTerms: false,
  );

  AttachPageModel get model => _model;

  void updateMobilityDifficulty(String value) {
    _model.mobilityDifficulty = value;
    notifyListeners();
  }

  void toggleCategory(MedicationCategory category, bool value) {
    if (value) {
      _model.selectedCategories.add(category);
    } else {
      _model.selectedCategories.remove(category);
    }
    notifyListeners();
  }

  void updateAgreedToTerms(bool value) {
    _model.agreedToTerms = value;
    notifyListeners();
  }

  void attachProof(String imagePath) {
    _model.loadedDocumentName = imagePath.split('/').last;
    notifyListeners();
  }

  void deleteAttachedDocument() {
    _model.loadedDocumentName = null;
    notifyListeners();
  }
}
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:health_4_all/features/attachPage/attach_page_model.dart';
import 'package:health_4_all/features/dataBase/databaseHelper.dart';

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

  Future<bool> saveFormData() async {
  try {
    Database db = await DatabaseHelper.instance.database;
    await db.insert('attachFormData', _model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    return true; // Indica que os dados foram salvos com sucesso
  } catch (e) {
    print('Erro ao salvar dados: $e');
    return false; // Indica que houve um erro ao salvar os dados
  }
}

  Future<void> loadFormData() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> result =
        await db.query('attachFormData', where: 'mobilityDifficulty = ?', whereArgs: [_model.mobilityDifficulty]);

    if (result.isNotEmpty) {
      AttachPageModel loadedModel = AttachPageModel.fromMap(result.first);
      _model = loadedModel;
      notifyListeners();
    }
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
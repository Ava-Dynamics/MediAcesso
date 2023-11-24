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

  Map<String, dynamic> toMap() {
    return {
      'mobilityDifficulty': mobilityDifficulty,
      'selectedCategories': selectedCategories.map((e) => e.toString()).join(','),
      'loadedDocumentName': loadedDocumentName,
      'agreedToTerms': agreedToTerms ? 1 : 0,
    };
  }

  static AttachPageModel fromMap(Map<String, dynamic> map) {
    return AttachPageModel(
      mobilityDifficulty: map['mobilityDifficulty'],
      selectedCategories: (map['selectedCategories'] as String)
          .split(',')
          .map((e) => MedicationCategory.values.firstWhere((element) => element.toString() == e))
          .toList(),
      loadedDocumentName: map['loadedDocumentName'],
      agreedToTerms: map['agreedToTerms'] == 1,
    );
  }
}
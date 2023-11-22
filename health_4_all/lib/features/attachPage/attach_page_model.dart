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
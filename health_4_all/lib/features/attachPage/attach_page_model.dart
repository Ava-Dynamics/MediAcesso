
enum MedicationCategory {
  AntiHipertensivos,
  Antidiabeticos,
  Broncodilatadores,
  Geral,
}

class AttachPageModel {
  MedicationCategory category;
  String medicationName;

  AttachPageModel({
    required this.category,
    required this.medicationName,
  });
}
// // attach_page_view.dart
// import 'package:flutter/material.dart';
// import 'package:health_4_all/features/attachPage/attach_page_model.dart';

// class AttachPageViewModel extends ChangeNotifier {
//   List<AttachPageModel> medications = [];
//   List<AttachPageModel> selectedMedications = [];

//   void initializeMedications() {
//     medications = [
//       AttachPageModel(category: MedicationCategory.AntiHipertensivos, medicationName: 'Atenolol 25mg'),
//       AttachPageModel(category: MedicationCategory.AntiHipertensivos, medicationName: 'Captopril 25mg'),
//       // Adicione outras medicações conforme necessário
//     ];

//     notifyListeners();
//   }

//   void toggleMedication(AttachPageModel medication) {
//     if (selectedMedications.contains(medication)) {
//       selectedMedications.remove(medication);
//     } else {
//       selectedMedications.add(medication);
//     }

//     notifyListeners();
//   }

// }

import 'package:health_4_all/features/myOrder/myOrder_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:health_4_all/features/formElegibility/form_elegibility_view_model.dart';
import 'package:health_4_all/features/formMedications/form_medications_view_model.dart';
import 'package:health_4_all/features/myOrder/myOrder_model.dart';
import 'package:health_4_all/features/attachPage/attach_page_view_model.dart';
import 'package:health_4_all/features/detailsUBSItems/detailsUBSItems_view_model.dart';
import 'package:health_4_all/features/welcomeHome/welcome_home_view.dart';
import 'package:health_4_all/features/welcomeHome/welcome_home_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // Mocked selected items
    List<OrderItem> selectedItems = [
      OrderItem(itemName: 'Example Item 1', quantity: 2),
      OrderItem(itemName: 'Example Item 2', quantity: 1),
    ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WelcomeHomeViewModel()),
        ChangeNotifierProvider(create: (context) => FormElegibilityViewModel()),
        ChangeNotifierProvider(create: (context) => FormMedicationsViewModel()),
        ChangeNotifierProvider(create: (context) => AttachPageViewModel()),
        ChangeNotifierProvider(create: (context) => UBSItemViewModel()),
        ChangeNotifierProvider(create: (context) => MyOrderViewModel(selectedItems: selectedItems))
      ],
      child: MaterialApp(
        title: 'Health 4 All',
        home: WelcomeHomeView(onQueroMeCadastrarPressed: (){}, onJaSouCadastradoPressed: (){},),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

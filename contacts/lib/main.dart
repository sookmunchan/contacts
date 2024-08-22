import 'package:contacts/app_bindings.dart';
import 'package:contacts/di.dart';
import 'package:contacts/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

void main() async {
  runApp(const MainApp());

  WidgetsFlutterBinding.ensureInitialized();

  await DenpendencyInjection.init();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: Routes.LOGIN,
      defaultTransition: Transition.fade,
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
      smartManagement: SmartManagement.keepFactory,
    );
  }
}

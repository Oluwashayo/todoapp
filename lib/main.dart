import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/db/db_helper.dart';
import 'package:todoapp/ui/homepage.dart';
import 'package:todoapp/ui/theme.dart';
import 'package:get_storage/get_storage.dart';
import 'services/theme_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDB();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: const HomePage(),
    );
  }
}

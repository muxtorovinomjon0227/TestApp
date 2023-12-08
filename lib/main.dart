import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:test_app/service/routes/app_routes.dart';
import 'package:test_app/service/routes/navigator_service.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  await Hive.initFlutter();
  await Hive.openBox('TestApp'); //  TODO: Hivedan foydalanish
  runApp(const MyApp());
}

class MyApp extends StatefulWidget  {
  static NavigationService navigationService = NavigationService();
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(),
      ),
      title: 'Test App',
      navigatorKey: MyApp.navigationService.navigatorKey,
      home: const MainNavigator(),
    );
  }
}
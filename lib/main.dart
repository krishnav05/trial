import 'dart:io';
import 'package:Ajreeha/localization/AppLanguage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:Ajreeha/localization/App_localization.dart';
import 'package:Ajreeha/splashscreen.dart';
import 'package:provider/provider.dart';
import 'dart:async';

void main() async {
  HttpOverrides.global = new MyHttpOverrides();
   WidgetsFlutterBinding.ensureInitialized();
   AppLanguage appLanguage = AppLanguage();
   await appLanguage.fetchLocale();
   runZoned(() {
  runApp(MyApp(
    appLanguage: appLanguage,
  ), 
  );
   },onError: (dynamic error, dynamic stack) {
print(error);
print(stack);});
}

class MyApp extends StatefulWidget {
  final AppLanguage appLanguage;

  MyApp({this.appLanguage});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return ChangeNotifierProvider<AppLanguage>(
      create: (_) => widget.appLanguage,
      child: Consumer<AppLanguage>(builder: (context, model, child) {
        return MaterialApp(
          locale: model.appLocal,
          supportedLocales: [
            Locale('en', 'US'),
            Locale('ar', ''),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],

          home:   SplashScreen(),
        );
      }),
    );
  }
}

 
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =(X509Certificate cert, String host, int port) => true;
  }
}

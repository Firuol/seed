import 'package:earlyvapp/screens/health_details.dart';
import 'package:earlyvapp/screens/locator.dart';
import 'package:earlyvapp/screens/telemed.dart';
import 'package:earlyvapp/screens/Vacine.dart';
import './screens/animals_list.dart';
import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/getstarted.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    WebViewPlatform.instance = WebWebViewPlatform();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Earlyvet App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 12, 83, 17),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/getstarted',
      routes: {
        '/login': (context) => LoginScreen(),
        '/animalList': (context) => AnimalListScreen(),
        '/healthDetails': (context) => HealthDetails(),
        '/locator': (context) => Locator(),
        '/telemedicine': (context) => Telemed(),
        '/vacine': (context) => Vacine(),
        '/getstarted': (context) => GetStartedPage(),
      },
    );
  }
}

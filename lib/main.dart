import 'package:flutter/material.dart';
import 'package:rh_presence_mobile/screen/ApiAdress.dart';
import 'package:rh_presence_mobile/screen/HomeScreen.dart';
import 'package:rh_presence_mobile/screen/LoginScreen.dart';
import 'package:rh_presence_mobile/shared_preference/shared_preference_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await UserSimplePeference.init();
  runApp(ProviderScope(child: MyApp(token: prefs.getString('token'))));
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({this.token, super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      initialRoute: (token != null && token!.isNotEmpty)
          ? HomeScreen.routeName
          : LoginScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        ApiAdress.routeName: (_) => ApiAdress(),
      },
    );
  }
}

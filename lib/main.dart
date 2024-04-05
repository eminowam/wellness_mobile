import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellness_mobile/app/my_app.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyBbG2MBIr1w4nuLefq3V09G1di_iaSn4YA',
          appId: '1:751376771643:android:c5551c679692f52e1eca1e',
          messagingSenderId: '751376771643',
          projectId: 'wellnessmobile-bbe62',
          storageBucket: 'wellnessmobile-bbe62.appspot.com'));
  var preferences = await SharedPreferences.getInstance();
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) {},
    child: MyApp(preferences: preferences),
  ));
}

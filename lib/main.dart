
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellness_mobile/app/my_app.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var preferences = await SharedPreferences.getInstance();
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) {},
    child:  MyApp(preferences: preferences),
  ));
}

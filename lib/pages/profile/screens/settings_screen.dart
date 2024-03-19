import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellness_mobile/pages/profile/screens/regret_password.dart';
import 'package:wellness_mobile/pages/widgets/app_scaffold/app_scaffold.dart';

import '../../../configs/color.dart';
import '../../../configs/style.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Настройки',
      icon2: Icons.arrow_back,
      onPressed2: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding:const  EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        child: Column(
          children: [
          InkWell(
          onTap:(){
            Navigator.push(context,
                CupertinoPageRoute(builder: (_)=>const  RegretPassword()));
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          focusColor: Colors.white70,
          child: Container(
            margin:const  EdgeInsets.symmetric(horizontal: 0,vertical: 10),
            padding:const  EdgeInsets.symmetric(horizontal: 5,vertical: 15),
            decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade100)
            ),
            child:const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text('Безопасность',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 19),),
                SizedBox(height: 10,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Смена пароля',style: AppStyle.profileTextStyle),
                     Icon(Icons.chevron_right,size: 33,color: Colors.grey,)
                  ],
                ),
              ],
            ),
          ),
        ),
            SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade100)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const  Text('Уведомления',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 19),),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Push',
                         style: AppStyle.profileTextStyle,
                      ),
                      CupertinoSwitch(
                        value: switchValue,
                        onChanged: (value) {
                          setState(() {
                            switchValue = value;
                          });
                        },
                        activeColor: bottomColor,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ), );
  }
}

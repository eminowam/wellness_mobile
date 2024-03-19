import 'package:flutter/material.dart';
import 'package:wellness_mobile/pages/widgets/app_scaffold/app_scaffold.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: 'Уведомления',
        icon2: Icons.arrow_back,
        onPressed2: (){
      Navigator.pop(context);
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Icon(Icons.notifications_off,size: 35,color: Colors.grey,),
                  Text('Уведомлений пока нет!',style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w500),)
                ],
              ),
            ),
          ),
        ));
  }
}

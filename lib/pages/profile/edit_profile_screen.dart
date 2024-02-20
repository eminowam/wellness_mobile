import 'package:flutter/material.dart';
import 'package:wellness_mobile/pages/widgets/app_scaffold/app_scaffold.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: '',
        icon: Icons.done,

        child: SingleChildScrollView(
          child: Column(
            children: [
            CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 55,
            child: Icon(Icons.person, size: 50,color: Colors.white,),
          ),


            ],
          ),
        ),
        );
  }
}

import 'package:flutter/material.dart';

import '../../../widgets/app_scaffold/app_scaffold.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(title: 'Сохраненные',
      icon2: Icons.arrow_back,
      onPressed2: (){
        Navigator.pop(context);
      },child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Icon(Icons.bookmark_remove_outlined,size: 35,color: Colors.grey,),
                  Text('Сохраненные пока что пусто!',style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w500),)
                ],
              ),
            ),
          ),
        ) );
  }
}

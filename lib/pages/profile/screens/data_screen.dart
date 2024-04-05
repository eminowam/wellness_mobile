import 'package:flutter/material.dart';
import '../../../widgets/app_scaffold/app_scaffold.dart';
import '../../../widgets/utils/custom_button.dart';
import '../../../widgets/utils/custom_textfield.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: 'Данные',
        icon2: Icons.arrow_back,
        onPressed2: (){
          Navigator.pop(context);
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 55,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Имя"),
                CustomTextField(
                    title: 'Имя',
                    onChanged: () {},
                    obscureText: true,
                    maxLines: 1),
                const SizedBox(
                  height: 15,
                ),
                const Text("Новая почта"),
                CustomTextField(
                    title: 'Новая почта',
                    onChanged: () {},
                    obscureText: true,
                    maxLines: 1),
                const SizedBox(
                  height: 15,
                ),
                const Text("Вес"),
                CustomTextField(
                    title: 'Вес',
                    onChanged: () {},
                    obscureText: true,
                    maxLines: 1),
                const SizedBox(
                  height: 15,
                ),
                const Text("Рост"),
                CustomTextField(
                    title: 'Рост',
                    onChanged: () {},
                    obscureText: true,
                    maxLines: 1),
                const SizedBox(
                  height: 15,
                ),
                const Text("Пароль"),
                CustomTextField(
                    title: 'Пароль',
                    onChanged: () {},
                    obscureText: true,
                    maxLines: 1),
               const  SizedBox(height: 25,),
                CustomButton(title: 'Сохранить',
                    onPressed: (){Navigator.pop(context);}),
               const  SizedBox(height: 15,)
              ],
            ),
          ),
        ), );
  }
}

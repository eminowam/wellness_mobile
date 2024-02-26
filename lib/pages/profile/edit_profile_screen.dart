import 'package:flutter/material.dart';
import 'package:wellness_mobile/pages/widgets/app_scaffold/app_scaffold.dart';
import 'package:wellness_mobile/pages/widgets/utils/custom_textfield.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: '',
      icon1: Icons.done,
      icon2: Icons.arrow_back,
      onPressed2: () {
        Navigator.pop(context);
      },
      onPressed: () {
        Navigator.pop(context);
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
            ],
          ),
        ),
      ),
    );
  }
}

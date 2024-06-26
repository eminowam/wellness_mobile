import 'package:flutter/material.dart';
import '../../../widgets/app_scaffold/app_scaffold.dart';
import '../../../widgets/utils/custom_button.dart';
import '../../../widgets/utils/custom_textfield.dart';

class RegretPassword extends StatefulWidget {
  const RegretPassword({super.key});

  @override
  State<RegretPassword> createState() => _RegretPasswordState();
}

class _RegretPasswordState extends State<RegretPassword> {
  bool passanable1 = true;
  bool passanable2 = true;
  bool passanable3 = true;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Смена пароля',
      icon2: Icons.arrow_back,
      onPressed2: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const  SizedBox(height: 15,),
            const Text('Текущий пароль'),
            CustomTextField(
              maxLines: 1,
              obscureText: passanable1,
              onChanged: (value) {
                setState(() {
                  // password = value;
                });
              },
              textInputType: TextInputType.visiblePassword,
              title: "Введите пароль",
              icon: passanable1 ? Icons.visibility : Icons.visibility_off,
              onPressed: () {
                setState(() {
                  passanable1 = !passanable1;
                });
              },
            ),
            const SizedBox(height: 15),
            const Text('Новый пароль'),
            CustomTextField(
              maxLines: 1,
              obscureText: passanable2,
              onChanged: (value) {
                setState(() {
                  // password = value;
                });
              },
              textInputType: TextInputType.visiblePassword,
              title: "Введите пароль",
              icon: passanable2 ? Icons.visibility : Icons.visibility_off,
              onPressed: () {
                setState(() {
                  passanable2 = !passanable2;
                });
              },
            ),
            const SizedBox(height: 15),
            const Text('Повторите новый пароль'),
            CustomTextField(
              maxLines: 1,
              obscureText: passanable3,
              onChanged: (value) {
                setState(() {
                  // password = value;
                });
              },
              textInputType: TextInputType.visiblePassword,
              title: "Введите пароль",
              icon: passanable3 ? Icons.visibility : Icons.visibility_off,
              onPressed: () {
                setState(() {
                  passanable3 = !passanable3;
                });
              },
            ),
            const SizedBox(
              height: 35,
            ),
            CustomButton(
                title: 'Сохранить',
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}

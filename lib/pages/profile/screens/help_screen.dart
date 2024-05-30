import 'package:flutter/material.dart';
import 'package:wellness_mobile/widgets/app_scaffold/app_scaffold.dart';

import '../../../configs/style.dart';
import '../../../widgets/utils/custom_button.dart';
import '../../../widgets/utils/custom_textfield.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController complaintController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Помощь",
      icon2: Icons.arrow_back,
      onPressed2: () {
        Navigator.pop(context);
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Оставьте жалобу или предложение',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text('Имя', style: AppStyle.editProfileText),
              const SizedBox(
                height: 5,
              ),
              CustomTextField(
                controller: nameController,
                errorText: '"Имя"',
                maxLines: 1,
                title: "Введите ваше имя",
                onChanged: (value) {
                  setState(() {
                    nameController.text = value;
                  });
                },
                obscureText: false,
                textInputType: TextInputType.name,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Почта',
                style: AppStyle.editProfileText,
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextField(
                controller: emailController,
                errorText: '"E-mail"',
                maxLines: 1,
                title: 'Введите ваш e-mail',
                onChanged: (value) {
                  setState(() {
                    emailController.text = value;
                  });
                },
                obscureText: false,
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Tелефон', style: AppStyle.editProfileText),
              const SizedBox(
                height: 5,
              ),
              CustomTextField(
                controller: phoneController,
                errorText: '"Tелефон"',
                maxLines: 1,
                title: 'Введите ваш телефон (+996...)',
                onChanged: (value) {
                  setState(() {
                    phoneController.text = value;
                  });
                },
                obscureText: false,
                textInputType: TextInputType.phone,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Жалоба или предложение',
                  style: AppStyle.editProfileText),
              const SizedBox(
                height: 5,
              ),
              CustomTextField(
                controller: complaintController,
                errorText: '"Жалоба или предложение"',
                maxLines: 6,
                title: 'Введите текст',
                onChanged: (value) {
                  setState(() {});
                },
                obscureText: false,
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(title: 'Отправить',
                  onPressed: (){Navigator.pop(context);}),
              const  SizedBox(height: 15,)
            ],
          ),
        ),
      ),
    );
  }
}

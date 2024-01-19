import 'package:flutter/material.dart';
import 'package:wellness_mobile/configs/style.dart';
import 'package:wellness_mobile/pages/auth/sign_in.dart';
import 'package:wellness_mobile/pages/widgets/utils/custom_button.dart';
import 'package:wellness_mobile/pages/widgets/utils/custom_textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool passanable = true;
  bool passanable2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        excludeHeaderSemantics: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
              Navigator.pop(context);
            },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                const Text('Добро пожаловать!'),
                const Text(
                  'Создайте аккаунт',
                  style: AppStyle.signInTextStyleBold,
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Имя'),
                    CustomTextField(
                        title: 'Введите ваш Email',
                        onChanged: () {},
                        obscureText: true,
                        maxLines: 1),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Почта '),
                    CustomTextField(
                        title: 'Введите ваш Email',
                        onChanged: () {},
                        obscureText: true,
                        maxLines: 1),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Пароль'),
                    CustomTextField(
                      maxLines: 1,
                      obscureText: passanable,
                      onChanged: (value) {
                        setState(() {
                          // password = value;
                        });
                      },
                      textInputType: TextInputType.visiblePassword,
                      title: "Введите ваш пароль",
                      icon:
                          passanable ? Icons.visibility : Icons.visibility_off,
                      onPressed: () {
                        setState(() {
                          passanable = !passanable;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Повторите Ваш пароль'),
                    CustomTextField(
                      maxLines: 1,
                      obscureText: passanable2,
                      onChanged: (value) {
                        setState(() {
                          // password = value;
                        });
                      },
                      textInputType: TextInputType.visiblePassword,
                      title: "Введите ваш пароль",
                      icon:
                          passanable2 ? Icons.visibility : Icons.visibility_off,
                      onPressed: () {
                        setState(() {
                          passanable2 = !passanable2;
                        });
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onPressed: () {},
                  title: "Зарегистрироваться",
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Уже есть аккаунт?',
                      style: AppStyle.textAuthStyle,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignIn()));
                        },
                        child: const Text(
                          "Войти",
                          style: TextStyle(
                            color: Color(0xff197FBD),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

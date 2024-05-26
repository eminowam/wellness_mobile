import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wellness_mobile/configs/style.dart';
import 'package:wellness_mobile/pages/auth/sign_up.dart';

import '../../data/auth_service.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/utils/custom_button.dart';
import '../../widgets/utils/custom_textfield.dart';
import '../../widgets/utils/socials_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool passanable = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Добро пожаловать!',
                  style: AppStyle.signInTextStyle,
                ),
                const Text(
                  'Мы ради видеть тебя снова',
                  style: AppStyle.signInTextStyleBold,
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Почта'),
                    CustomTextField(
                        controller: _emailController,
                        title: 'Введите ваш Email',
                        onChanged: () {},
                        obscureText: false,
                        maxLines: 1),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Пароль'),
                    CustomTextField(
                      maxLines: 1,
                      controller: _passwordController,
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
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomButton(
                  onPressed: () async {
                    final message = await AuthService().login(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    if (message!.contains('Вход успешен')) {
                       Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const BottomNav()));
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                      ),
                    );
                  },
                  title: "Войти",
                ),
                const SizedBox(
                  height: 26,
                ),
                const Row(
                  children: [
                    Expanded(
                        child: Divider(
                      endIndent: 10,
                      color: Color(0xff78828A),
                    )),
                    Text(
                      "или",
                      style: TextStyle(color: Color(0xff78828A)),
                    ),
                    Expanded(
                        child: Divider(
                      indent: 10,
                      color: Color(0xff78828A),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 17,
                ),
                const SocialsButton(
                  icon: 'assets/icons/google.png',
                  title: 'Войти через Google',
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'Еще нет аккаунта?   ',
                            style: AppStyle.textAuthStyle,
                          ),
                          TextSpan(
                            text: 'Зарегестрироваться',
                            style: AppStyle.forgotPassword,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp())),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

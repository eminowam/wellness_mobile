import 'package:flutter/material.dart';
import 'package:wellness_mobile/configs/style.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:wellness_mobile/data/auth_service.dart';

import '../../widgets/bottom_nav.dart';
import '../../widgets/utils/custom_button.dart';
import '../../widgets/utils/custom_textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  late String token;
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  void _tryRegister() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    _formKey.currentState?.save();
  }

  bool passanable = true;
  bool passanable2 = true;
  int _currentIndex = 1;
  bool _onEditing = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        excludeHeaderSemantics: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            if (_currentIndex == 1) {
              Navigator.pop(context);
            }
            setState(() {
              _currentIndex--;
            });
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Builder(builder: (_) {
                if (_currentIndex == 1) {
                  return Column(
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
                          const Text('Почта '),
                          CustomTextField(
                              controller: _emailController,
                              title: 'Введите ваш Email',
                              onChanged: (value) => _email = value ?? '',
                              errorText: 'Введите корректный email',
                              obscureText: true,
                              maxLines: 1),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Пароль'),
                          CustomTextField(
                            controller: _passwordController,
                            maxLines: 1,
                            obscureText: passanable,
                            onChanged: (value) => _password = value ?? '',
                            textInputType: TextInputType.visiblePassword,
                            title: "Введите ваш пароль",
                            icon: passanable
                                ? Icons.visibility
                                : Icons.visibility_off,
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
                            controller: _passwordController2,
                            maxLines: 1,
                            obscureText: passanable2,
                            onChanged: (value) {
                              setState(() {
                                // password = value;
                              });
                            },
                            textInputType: TextInputType.visiblePassword,
                            title: "Введите ваш пароль",
                            icon: passanable2
                                ? Icons.visibility
                                : Icons.visibility_off,
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
                        onPressed: () {
                          setState(() {
                            _currentIndex++;
                          });
                        },
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
                              onPressed: () async {
                                _tryRegister();
                                final message = await AuthService()
                                    .registration(
                                        email: _emailController.text,
                                        password: _passwordController.text);
                                if (message!.contains('Успешно авторизованы')) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const BottomNav()));
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(message),
                                  ),
                                );
                              },
                              child: const Text(
                                "Войти",
                                style: AppStyle.forgotPassword,
                              ))
                        ],
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      const Center(
                        child: Text(
                          'Введите код, отправленный на ваш e-mail',
                          style: AppStyle.verifyCodeStyle,
                        ),
                      ),
                      VerificationCode(
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Theme.of(context).primaryColor),
                        keyboardType: TextInputType.number,
                        underlineColor: Colors.black,
                        length: 6,
                        cursorColor: Colors.blue,
                        onCompleted: (value) {
                          setState(() {
                            token = value;
                          });
                        },
                        onEditing: (bool value) {
                          setState(() {
                            _onEditing = value;
                          });
                          if (!_onEditing) FocusScope.of(context).unfocus();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: _onEditing
                              ? const Text(
                                  'Отправить еще раз (60 сек) ',
                                  style: AppStyle.editAuthStyle,
                                )
                              : Text('Ваш код: $token'),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomButton(
                        title: "Подтвердить",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const BottomNav()));
                        },
                      )
                    ],
                  );
                }
              }),
            ),
          ),
        ),
      ),
    );
  }
}

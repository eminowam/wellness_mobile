import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:wellness_mobile/configs/style.dart';
import 'package:wellness_mobile/pages/auth/sign_in.dart';
import 'package:wellness_mobile/pages/widgets/utils/custom_button.dart';
import 'package:wellness_mobile/pages/widgets/utils/custom_textfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late String token;

  int _currentIndex = 1;
  bool _onEditing = true;
  bool passanable = true;
  bool passanable2 = true;
  var password = "";

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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                const Text(
                  "Восстановление пароля",
                  style: AppStyle.signInTextStyleBold,
                ),
                const SizedBox(
                  height: 67,
                ),
                Builder(builder: (context) {
                  if (_currentIndex == 1) {
                    return Column(
                      children: [
                        const Text(
                          "Почта",
                          style: AppStyle.textAuthStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextField(
                            maxLines: 1,
                            obscureText: false,
                            textInputType: TextInputType.emailAddress,
                            title: "Введите ваш E-mail",
                            onChanged: (value) {}),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomButton(
                          onPressed: () {
                            setState(() {
                              _currentIndex++;
                            });
                          },
                          title: "Подтвердить",
                        ),
                      ],
                    );
                  } else if (_currentIndex == 2) {
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
                            setState(() {
                              _currentIndex++;
                            });
                          },
                        )
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Пароль",
                          style: AppStyle.textAuthStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextField(
                          maxLines: 1,
                          obscureText: passanable,
                          onChanged: (value) {
                            password = value;
                          },
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
                          height: 20,
                        ),
                        const Text(
                          "Повторите ваш пароль",
                          style: AppStyle.textAuthStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextField(
                          maxLines: 1,
                          obscureText: passanable2,
                          onChanged: (value) {
                            password = value;
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
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomButton(
                          title: "Подтвердить",
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => SignIn()));
                          },
                        ),
                      ],
                    );
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

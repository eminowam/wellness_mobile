import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wellness_mobile/bloc/comment_bloc/comment_bloc.dart';
import 'package:wellness_mobile/data/models/comment/comment.dart';
import 'package:wellness_mobile/widgets/app_scaffold/app_scaffold.dart';

import '../../../configs/style.dart';
import '../../../widgets/utils/custom_button.dart';
import '../../../widgets/utils/custom_textfield.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key, required this.commentModel});

  final CommentModel commentModel;

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}
TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController descController = TextEditingController();
TextEditingController emailController = TextEditingController();

class _HelpScreenState extends State<HelpScreen> {
  final _formKey = GlobalKey<FormState>();
  late CommentModel comment;

  @override
  void initState() {
    comment = CommentModel.copyWith(widget.commentModel);
    super.initState();
    super.initState();
  }

  final bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Помощь",
      icon2: Icons.arrow_back,
      onPressed2: () {
        Navigator.pop(context);
      },
      child: Form(
        key: _formKey,
        child: BlocConsumer<CommentBloc, CommentState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Оставьте жалобу или предложение',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('Имя', style: AppStyle.editProfileText),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      initValue: comment.name,
                      errorText: '"Имя"',
                      maxLines: 1,
                      title: "Введите ваше имя",
                      onChanged: (value) {
                        setState(() {
                          comment.name = value;
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
                      initValue: comment.email,
                      errorText: '"E-mail"',
                      maxLines: 1,
                      title: 'Введите ваш e-mail',
                      onChanged: (value) {
                        setState(() {
                          comment.email = value;
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
                      initValue: comment.phone,
                      errorText: '"Tелефон"',
                      maxLines: 1,
                      title: 'Введите ваш телефон (+996...)',
                      onChanged: (value) {
                        setState(() {
                          comment.phone = value;
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
                      initValue: comment.description,
                      errorText: '"Жалоба или предложение"',
                      maxLines: 6,
                      title: 'Введите текст',
                      onChanged: (value) {
                        setState(() {
                          comment.description = value;
                        });
                      },
                      obscureText: false,
                      textInputType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    BlocConsumer<CommentBloc, CommentState>(
                      listener: (context, state) {
                        if (state.isLoading) {
                          const Center(child: CircularProgressIndicator());
                        }
                      },
                      builder: (context, state) {
                        return CustomButton(
                            isLoading: state.isLoading,
                            title: 'Отправить',
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              context.read<CommentBloc>().add(
                                  CommentCreateEvent(
                                      comment: comment));
                            });
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

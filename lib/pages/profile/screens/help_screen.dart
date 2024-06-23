import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wellness_mobile/bloc/comment_bloc/comment_bloc.dart';
import 'package:wellness_mobile/bloc/comment_bloc/comment_bloc.dart';
import 'package:wellness_mobile/data/models/comment/comment.dart';
import 'package:wellness_mobile/widgets/app_scaffold/app_scaffold.dart';

import '../../../configs/style.dart';
import '../../../widgets/utils/custom_button.dart';
import '../../../widgets/utils/custom_textfield.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key, required this.comment});

  final CommentModel comment;

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController complaintController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CommentBloc>(context).add(CommentCreateEvent(
        comment: widget.comment));
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Оставьте жалобу или предложение',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                const SizedBox(
                  height: 15,
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
                      widget.comment.name = value;
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
                      widget.comment.email = value;
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
                      widget.comment.phone = value;
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
                    setState(() {
                      widget.comment.description = value;
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
                          context
                              .read<CommentBloc>()
                              .add(CommentCreateEvent(comment: widget.comment));
                          if (state.isSuccess) {
                            isLoading == false;
                            Navigator.pop(context);
                          }
                        });
                  },
                ),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellness_mobile/configs/style.dart';
import 'package:wellness_mobile/pages/auth/sign_in.dart';
import 'package:wellness_mobile/pages/profile/screens/data_screen.dart';
import 'package:wellness_mobile/pages/profile/screens/saved_screen.dart';
import 'package:wellness_mobile/pages/profile/screens/settings_screen.dart';
import 'package:wellness_mobile/pages/widgets/app_scaffold/app_scaffold.dart';
import 'package:wellness_mobile/pages/widgets/utils/custom_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Профиль',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 15),
              const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    "https://thumbs.dreamstime.com/b/asian-beauty-animation-portrait-beautiful-girl-ancient-national-turban-married-woman-s-headdress-central-asia-vector-167032286.jpg"),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Aimeerim Eminova",
                style: TextStyle(
                    color: Color(0xff333A53),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomSettings(title: 'Данные',
                  iconMain: Icons.person_2_outlined,
                  onPressed: (){Navigator.push(context,
                      CupertinoPageRoute(builder: (_)=> const DataScreen()));}),
              CustomSettings(title: 'Настройки',
                  iconMain: Icons.settings_outlined,
                  onPressed: (){
                Navigator.push(context,
                      CupertinoPageRoute(builder: (_)=> const SettingsScreen()));}),
              CustomSettings(title: 'Помощь',
                  iconMain: Icons.help_outline_outlined,
                  onPressed: (){}),
              CustomSettings(title: 'Сохраненные',
                  iconMain: Icons.bookmark_border,
                  onPressed: (){Navigator.push(context,
                      CupertinoPageRoute(builder: (_)=> const SavedScreen()));}),
              CustomSettings(title: 'Выйти',
                  iconMain: Icons.exit_to_app_outlined,
                  onPressed: ()=> showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.close),
                                    iconSize: 20,
                                  ),
                                ],
                              ),
                              const Text(
                                'Вы действительно хотите выйти?',
                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomButton(
                                title: 'выйти',
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => const SignIn()),
                                  );
                                },
                              ),

                            ],
                          ),
                        ),
                      );
                    },
                  ),),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSettings extends StatelessWidget {
  const CustomSettings(
      {super.key,
        required this.title,
        required this.iconMain,
        required this.onPressed});

  final String title;
  final IconData iconMain;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onPressed,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.white70,
      child: Container(
        margin:const  EdgeInsets.symmetric(horizontal: 0,vertical: 10),
        padding:const  EdgeInsets.symmetric(horizontal: 5,vertical: 15),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade200)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(iconMain),
               const  SizedBox(width: 8),
                Text(title,style: AppStyle.profileTextStyle,),
              ],
            ),
            const Icon(Icons.chevron_right,size: 33,color: Colors.grey,)
          ],
        ),
      ),
    );
  }
}


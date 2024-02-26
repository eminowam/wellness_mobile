import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellness_mobile/pages/profile/edit_profile_screen.dart';
import 'package:wellness_mobile/pages/widgets/app_scaffold/app_scaffold.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

List<String> items = [
  'Данные',
  'Настройки',
  'Сохраненные',
  'Помощь',
];

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Профиль',
      icon1: Icons.edit_square,
      onPressed: () {
        Navigator.push(context,
            CupertinoPageRoute(builder: (_) => const EditProfileScreen()));
      },
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
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade400, // Цвет границы
                            width: 1.0, // Ширина границы
                          ),
                        ),
                      ),
                      child: ListTile(
                        title: Text(items[index]),
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellness_mobile/pages/main_screen/notification_screen.dart';
import 'package:wellness_mobile/pages/main_screen/recom_screen.dart';

import '../../widgets/app_scaffold/app_scaffold.dart';
import '../../widgets/utils/custom_container.dart';
import '../../widgets/utils/custom_search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<String> items = [
  'Симптомы',
  'Нутриция',
  'Сон',
  'Aктивность',
  'Слух',
  'Сон',
  'Aктивность',
  'Слух',
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: "Wellness App",
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 25,
                          backgroundImage: NetworkImage(
                              "https://thumbs.dreamstime.com/b/asian-beauty-animation-portrait-beautiful-girl-ancient-national-turban-married-woman-s-headdress-central-asia-vector-167032286.jpg"),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi,Aimeerim',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Always be healthy',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (_) => const NotificationScreen()));},
                        icon: const Icon(Icons.notifications_active_outlined))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomSearchField(),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomContainer(textTitle: '2234', textSub: 'шагов', horizontal: 55),
                    CustomContainer(textTitle: '5ч 45м', textSub: 'сон', horizontal: 45),
                  ],
                ),
                const SizedBox(height: 15,),
                Text(
                  'Kатегории здоровья',
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                const SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.white70,
                    border: Border.all(
                      width: 0.5,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (_) =>
                                      const RecommendationsScreen()));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.shade400,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: ListTile(
                            title: Text(items[index]),
                            leading: Icon(
                              Icons.spa_outlined,
                              color: Colors.grey.shade400,
                            ),
                            trailing: Icon(
                              Icons.chevron_right,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20,)
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellness_mobile/pages/main_screen/notification_screen.dart';
import 'package:wellness_mobile/pages/main_screen/recom_screen.dart';
import 'package:wellness_mobile/pages/widgets/app_scaffold/app_scaffold.dart';
import 'package:wellness_mobile/pages/widgets/utils/custom_container.dart';
import 'package:wellness_mobile/pages/widgets/utils/custom_search.dart';

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
        title: "",
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 25,
                          backgroundImage: NetworkImage(
                              'https://t3.ftcdn.net/jpg/04/23/59/74/360_F_423597477_AKCjGMtevfCi9XJG0M8jter97kG466y7.jpg'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi,Karry',
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
                                  builder: (_) => const NotificationScreen()));
                        },
                        icon: const Icon(Icons.notifications_none_outlined))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomSearchField(),
                const SizedBox(
                  height: 15,
                ),
                CustomContainer(
                  onTap: () {},
                  child:  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.backup_outlined,color: Colors.brown.shade400,),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Шаги',style: TextStyle(color: Colors.brown.shade400),),
                              ],
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: Colors.grey,
                            )
                          ],
                        ),
                       const SizedBox(
                          height: 20,
                        ),
                       const  Row(
                          children: [
                            Text(
                              '2120',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              'Шагов',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Kатегории здоровья',
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.white70,
                    border: Border.all(
                      width: 0.5,
                      color: Colors.white10,
                    ),
                    // BorderSide(width: 0.2,color: Colors.white10)
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
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ));
  }
}

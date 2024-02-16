import 'package:flutter/material.dart';
import 'package:wellness_mobile/pages/widgets/app_scaffold/app_scaffold.dart';
import 'package:wellness_mobile/pages/widgets/utils/custom_search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: "",
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
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
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_none_outlined))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CustomSearchField(),
                SizedBox(
                  height: 15,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CustomMainContainer(title: 'Focus'),
                      SizedBox(
                        width: 7,
                      ),
                      CustomMainContainer(title: 'Focus'),
                      SizedBox(
                        width: 7,
                      ),
                      CustomMainContainer(title: 'Focus'),
                      SizedBox(
                        width: 7,
                      ),
                      CustomMainContainer(title: 'Focus'),
                      SizedBox(
                        width: 7,
                      ),
                      CustomMainContainer(title: 'Focus'),
                    ],
                  ),
                ),
                SizedBox(height: 35),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xffADBC9F),
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/icons/google.png'),
                      SizedBox(width: 9),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Affirmation',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Text(
                            'jdcblsjdvflqoskfj;oqjnfojhsd;ojcbf;qwo',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Start your Day',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                )
              ],
            ),
          ),
        ));
  }
}

class CustomMainContainer extends StatelessWidget {
  final String title;

  const CustomMainContainer({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Color(0xffADBC9F)),
      child: Center(
          child: Text(
        title,
      )),
    );
  }
}

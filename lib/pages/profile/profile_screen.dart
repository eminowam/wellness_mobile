import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back_ios_new,color: Colors.white,),
        title: const Text('Profile',style: TextStyle(fontSize: 19),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 const  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://t3.ftcdn.net/jpg/04/23/59/74/360_F_423597477_AKCjGMtevfCi9XJG0M8jter97kG466y7.jpg'),
                      ),
                      SizedBox(width: 10),
                      Text('Masi Ramezanzade',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),
                    ],
                  ),
                  IconButton(onPressed: (){},
                      icon: const Icon(Icons.edit_square,color: Color(0xff5F5F5F)))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  CustomProfileButton(title: '180cm', subTitle: "Height")
                ],
              )



            ],
          ),
        ),
      ),
    );
  }
}

class CustomProfileButton extends StatelessWidget {
  final String title;
  final String subTitle;
  const CustomProfileButton({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          Text(title,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
          Text(subTitle,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),)

        ],
      ),
    );
  }
}


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
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 55,
                  backgroundImage: NetworkImage(
                      'https://t3.ftcdn.net/jpg/04/23/59/74/360_F_423597477_AKCjGMtevfCi9XJG0M8jter97kG466y7.jpg'),
                ),
              ),
              SizedBox(height: 10),
              Text('Aisha Roxy',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}

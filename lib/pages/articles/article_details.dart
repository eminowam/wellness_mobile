import 'package:flutter/material.dart';

import '../../configs/color.dart';

class ArticleDetailsScreen extends StatefulWidget {
  const ArticleDetailsScreen({super.key});

  @override
  State<ArticleDetailsScreen> createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: bottomColor,
        elevation: 0,
        leading: IconButton(
        onPressed: () {
      Navigator.pop(context);
    },
    icon: const Icon(Icons.close,color: Colors.white,),
    ),
          actions: [
            IconButton(onPressed: (){
              isFavorite = !isFavorite;
              setState(() {});
            },
                icon:isFavorite
                    ? const Icon(
                  Icons.bookmark,
                  color: Colors.white,
                ):
               const  Icon(Icons.bookmark_border,color: Colors.white,))
          ],
    ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          child:  Column(
            children: [
              const Text("В стране чудес жила была одна принцесса",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),),
              const  SizedBox(height: 10,),
              Image.asset('assets/mental/yoga.webp'),
              const  SizedBox(height: 7),
              const Text('Жила - была одна принцесса. Очень хорошенькая, но очень капризная. В ее распоряжении было огромное королевство с толпой любящих ее подданных, большие прекрасные сады, море интересных королевских занятий, еженедельные пиры. Но, несмотря на все это, довольной принцесса оставалась не надолго: ей все время чего-то не хватало, и сотни вельмож сбивались с ног, выполняя ее многочисленные и часто меняющиеся желания.А еще принцесса была очень мечтательная, и, как и прочие принцессы, грезила о принце на белом коне. Она просыпалась и засыпала с этими мыслями - и с любовными романами под подушкой, а все женихи, приезжающие к порогу ее замка, казались нашей принцессы недостаточно хороши.',
              style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),)
            ],
          ),
        ),
      ),
    );
  }
}

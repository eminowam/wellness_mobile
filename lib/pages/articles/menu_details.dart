import 'package:flutter/material.dart';
import 'package:wellness_mobile/data/models/food/food_model.dart';

import '../../widgets/app_scaffold/app_scaffold.dart';

class MenuDetails extends StatefulWidget {
  const MenuDetails({super.key, required this.results});
  final FoodModel results;


  @override
  State<MenuDetails> createState() => _MenuDetailsState();
}

class _MenuDetailsState extends State<MenuDetails> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: widget.results.name,
        icon2: Icons.arrow_back,
        onPressed2: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.results.name,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.results.duration,
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.results.image,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error);
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            widget.results.calories.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Калории",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                   const SizedBox(
                      height: 60,
                      child: VerticalDivider(
                        thickness: 0.5,
                        color: Colors.black,
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            widget.results.protein.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Белки",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                      child: VerticalDivider(
                        thickness: 0.5,
                        color: Colors.black,
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            widget.results.fat.toString(),
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: Colors.green),
                          ),
                          const  SizedBox(height: 5,),
                          const Text(
                            "Жиры",
                            style:  TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                      child: VerticalDivider(
                        thickness: 0.5,
                        color: Colors.black,
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            widget.results.carbs.toString(),
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: Colors.green),
                          ),
                          const  SizedBox(height: 5,),
                          const Text(
                            "Углеводы",
                            style:  TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: Colors.green),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 25),
                 Text(
                  widget.results.description,
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
               const  SizedBox(height: 10,),
              ],
            ),
          ),
        ));
  }
}

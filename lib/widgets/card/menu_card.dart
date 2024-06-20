import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellness_mobile/data/models/food/food_model.dart';
import 'package:wellness_mobile/pages/articles/menu_details.dart';

import '../../configs/color.dart';

class MenuCard extends StatefulWidget {
  const MenuCard({super.key, required this.results});
  final FoodModel results;

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Material(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
        elevation: 3,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, CupertinoPageRoute(builder: (_) =>  MenuDetails(results: widget.results,)));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 0.5,
                color: mainBackColor,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.network(
                      widget.results.image,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes !=
                                null
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
                ),

                const SizedBox(width: 10),
                 Flexible(
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.results.name,
                        style:
                        const  TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.schedule,
                            size: 20,
                            color: Colors.green,
                          ),
                          const SizedBox(width: 7),
                          Text(
                            "${widget.results.duration} минут",
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                    ],
                                   ),
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:ecommerce_store/models/shoe.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShoeTile extends StatelessWidget {
  Shoe shoe;
  void Function()? onTap;

  ShoeTile({
    super.key,
    required this.shoe,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
          left: 25,
          bottom: 25,
        ),
        width: 280,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            //shoe image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                shoe.imagePath,
                height: 200,
              ),
            ),

            //description

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                shoe.description,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),

//price + details

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shoe.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(shoe.price),
                  ],
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      padding: const EdgeInsets.all(20),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ],
        ));
  }
}

import 'package:ecommerce_store/components/shoe_tile.dart';
import 'package:ecommerce_store/models/cart.dart';
import 'package:ecommerce_store/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Successfully added'),
              content: Text('check your cart'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          //search Bar
          Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Search', style: TextStyle(color: Colors.grey)),
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ],
              )),

          //message

          const Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0),
              child: Text(
                "everyone flies..some fly longer than other",
                style: TextStyle(
                  color: Colors.grey,
                ),
              )),

          //hotpics
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Hot Picks ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'see all',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  //create a shoe

                  Shoe shoe = value.getShoeList()[index];

                  // Shoe shoe = Shoe(
                  //   name: 'Air Jordan',
                  //   price: '200',
                  //   description: 'cool shoe',
                  //   imagePath: 'lib/images/image_3.png',
                  // );
                  return ShoeTile(
                    shoe: shoe,
                    onTap: () => addShoeToCart(shoe),
                  );
                }),
          ),

          const Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: 25,
              right: 25,
            ),
            child: Divider(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

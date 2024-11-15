import 'package:ecommerce_store/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
// list of shoes for sale

  List<Shoe> shoeShop = [
    Shoe(
      name: 'Zoom Freak',
      price: '500',
      description: 'the forward thinking design of his latest signature shoe',
      imagePath: 'lib/images/image_5.png',
    ),
    Shoe(
      name: 'Air Jordan',
      price: '600',
      description: 'the forward thinking design of his latest signature shoe',
      imagePath: 'lib/images/image_7.png',
    ),
    Shoe(
      name: 'U S POLO',
      price: '700',
      description: 'the forward thinking design of his latest signature shoe',
      imagePath: 'lib/images/image_2.png',
    ),
    Shoe(
      name: 'Highlander',
      price: '800',
      description: 'the forward thinking design of his latest signature shoe',
      imagePath: 'lib/images/image_3.png',
    ),
  ];

// list of items in user cart

  List<Shoe> userCart = [];

// get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

// get cart

  List<Shoe> getUserCart() {
    return userCart;
  }

// add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

//remove item from cart

  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}

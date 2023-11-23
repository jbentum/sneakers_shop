import 'package:flutter/material.dart';
import 'package:sneakers_shop/models/shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale

  List<Shoe> shoeShop = [
    Shoe(
        name: 'Nike Air',
        price: '250',
        imagePath: 'lib/images/nike air.png',
        description:
            'A secure midfoot strap is suited for scoring binges and defensive'),
    Shoe(
        name: 'Air Max',
        price: '300',
        imagePath: 'lib/images/air max.png',
        description:
            'the Forward-thinking design of his latest signature shoe'),
    Shoe(
        name: 'Jordan 23',
        price: '299',
        imagePath: 'lib/images/jordan 23.png',
        description: 'Nikes iconic Michael Jordan shoes'),
    Shoe(
        name: 'Jordan Red',
        price: '350',
        imagePath: 'lib/images/jordan red.png',
        description: 'Basketball legends iconic Nike collaboration'),
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

  //add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove items from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}

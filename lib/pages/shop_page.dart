import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_shop/components/shoe_tile.dart';
import 'package:sneakers_shop/models/cart.dart';
import 'package:sneakers_shop/models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    //alert the user, shoe successfully added
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Successfully added!'),
              content: Text('Check your cart'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Column(
              children: [
                Container(
                  // search bar
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsetsDirectional.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Search',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  //message
                  child: Text(
                    'Everyone flies...some fly longer than the others',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                //hot picks
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Hot Picks 🔥',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // list of shoes for Sale
                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      // get a shoe from shop list
                      Shoe shoe = value.getShoeList()[index];

                      // return the shoe

                      return ShoeTile(
                        shoe: shoe,
                        onTap: () => addShoeToCart(shoe),
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
                  child: Divider(
                    color: Colors.white,
                  ),
                )
              ],
            ));
  }
}

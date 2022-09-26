import 'package:amazon_clone/features/product_details/services/product_details_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';
import '../../../provider/user_provider.dart';
import '../services/cart_services.dart';

class CartProduct extends StatefulWidget {
  final int index;
  const CartProduct({Key? key, required this.index}) : super(key: key);

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {

final ProductDetailsServices productDetailsServices = ProductDetailsServices();
final cartServices = CartServices();

void increaseQuantity(Product product){
  productDetailsServices.addToCart(context: context, product: product,);
}
void decreaseQuantity(Product product){
  cartServices.removeFromCart(context: context, product: product);
}

  @override
  Widget build(BuildContext context) {
    final productCart = context.watch<UserProvider>().user.cart[widget.index];
    final product = Product.fromMap(productCart['product']);
    final quantity = productCart['quantity'];

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        Row(
          children: [
            Image.network(
              product.images[0],
              fit: BoxFit.fitHeight,
              height: 135,
              width: 135,
            ),
            Column(
              children: [
                Container(
                  width: 235,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    maxLines: 2,
                  ),
                ),
                Container(
                  width: 235,
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    '\$ ${product.price}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    maxLines: 2,
                  ),
                ),
                Container(
                  width: 235,
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: const Text(
                    'Eligible for free shipping',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    maxLines: 2,
                  ),
                ),
                Container(
                  width: 235,
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: const Text(
                    'In Stock',
                    style: TextStyle(
                      color: Colors.teal,
                    ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(5),
                color: Colors.black12,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      decreaseQuantity(product);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 35,
                      height: 32,
                      child: const Icon(Icons.remove),
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12 , width: 1.5),
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.white,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      width: 35,
                      height: 32,
                      child: Text(quantity.toString()),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      increaseQuantity(product);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 35,
                      height: 32,
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}

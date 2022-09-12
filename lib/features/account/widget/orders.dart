import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/widget/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  //temporary orders list
List list = [
  'https://images.unsplash.com/photo-1662550191635-281c61ed9f7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDV8SnBnNktpZGwtSGt8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1662550191635-281c61ed9f7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDV8SnBnNktpZGwtSGt8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1662550191635-281c61ed9f7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDV8SnBnNktpZGwtSGt8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1662550191635-281c61ed9f7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDV8SnBnNktpZGwtSGt8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: const Text('Your Oders', 
                style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Text('See all', 
                style: TextStyle(fontSize: 18, color: GlobalVariables.selectedNavBarColor, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        //display orders
        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index){
              return SingleProduct(imagePath: list[index]);
            },
            ),
        ),
      ],
    );
  }
}
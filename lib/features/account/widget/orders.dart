import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/widget/single_product.dart';
import 'package:flutter/material.dart';

import '../../../models/order.dart';
import '../services/account_services.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  //temporary orders list
  List<Order>? orders;
  final accountServices = AccountServices();
  @override
  void initState() {
    fetchOrders();
    super.initState();
  }

  void fetchOrders() async {
    orders = await accountServices.fetchMyOrders(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: const Text(
                      'Your Oders',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      'See all',
                      style: TextStyle(
                          fontSize: 18,
                          color: GlobalVariables.selectedNavBarColor,
                          fontWeight: FontWeight.w600),
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
                  itemCount: orders!.length,
                  itemBuilder: (context, index) {
                    return SingleProduct(imagePath: orders![index].products[0].images[0]);
                  },
                ),
              ),
            ],
          );
  }
}

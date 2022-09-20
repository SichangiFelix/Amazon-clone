import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/loader.dart';
import '../../../constants/global_variables.dart';
import '../../../models/product.dart';

class CategoryDealsScreen extends StatefulWidget {

  static const String routeName = '/category-deals';
  final String category;

  const CategoryDealsScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {

List<Product>? productList;
final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    fetchCategoryProducts();
    super.initState();
  }

  fetchCategoryProducts() async{
    productList = await homeServices.fetchCategoryProducts(context: context, category: widget.category);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          title: Text(widget.category, 
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
        ),
      ),
      body: productList == null? const Loader()
      :Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text('Keep shopping for ${widget.category}', style: const TextStyle(fontSize: 20, ),),
          ),
          SizedBox(
            height: 170,
            child: GridView .builder(
              itemCount: productList!.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, 
                childAspectRatio: 1.4, 
                mainAxisSpacing: 10), 
                itemBuilder: (context, index){
                  final product = productList![index];
              return Column(
                children: [
                  SizedBox(
                    height: 130,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12,
                        width: 0.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.network(product.images[0]),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left:0,
                      top:5,
                      right: 15,),
                      child: Text(product.name, maxLines: 1, overflow: TextOverflow.ellipsis,),
                  ),
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}

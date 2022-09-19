import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:flutter/material.dart';

import '../../../common/loader.dart';
import '../../../models/product.dart';
import '../../account/widget/single_product.dart';
import '../services/admin_services.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Product>? products;
final AdminServices adminServices = AdminServices();

void deleteProduct( Product product, int index){
  adminServices.deleteProduct(
    context: context, 
    product: product, 
    onSuccess: (){
      setState(() {
        products!.removeAt(index);
      });
    });
}

  void navigateToAddProduct(){
    Navigator.pushNamed(context, AddProductsScreen.routeName);
  }

  @override
  void initState() {
    fetchAllProducts();
    super.initState();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return products == null? const Loader() : Scaffold(
      body: GridView.builder(
        itemCount: products!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index){
        final productData = products![index];
        return Column(
          children: [
            SizedBox(
              height: 140,
              child: SingleProduct(
                imagePath: productData.images[0],
              ),
            ),
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text(productData.name, 
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  ),
                ),
                IconButton(onPressed: (){
                  deleteProduct(productData, index);
                }, icon: const Icon(Icons.delete_outline)),
              ],
            ),
          ],
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add a Product',
        child: const Icon(Icons.add),
        onPressed: (){
          navigateToAddProduct();
        },
      ),
    );
  }
}
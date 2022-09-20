import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/features/search/services/search_services.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/loader.dart';
import '../../../constants/global_variables.dart';
import '../../../models/product.dart';
import '../widgets/searched_product.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;

  const SearchScreen({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  List<Product>? products = []; 
final searchServices = SearchServices();

  @override
  void initState() {
    fetchSearchedProduct();
    super.initState();
  }

  fetchSearchedProduct() async{
    products = await searchServices.fetchSearchedProduct(context: context, searchQuery: widget.searchQuery);
    print(products!);
    print(products!.length);
  }

  void navigateToSearchScreen(String query){
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Expanded(
              child: Container(
                height: 42,
                margin: const EdgeInsets.only(left: 15),
                child: Material(
                  borderRadius: BorderRadius.circular(7),
                  elevation: 1,
                  child: TextFormField(
                    onFieldSubmitted: navigateToSearchScreen,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(top: 10),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                        enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                        hintText: 'Search Amazon.in',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize:17,
                        ),
                      prefixIcon: InkWell(
                        onTap: (){},
                        child: const Padding(padding: EdgeInsets.only(left: 6),
                            child: Icon(Icons.search, color: Colors.black, size: 23,),
                        ),
                      )
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.transparent,
              height: 42,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: const Icon(Icons.mic, color: Colors.black, size: 25,),
            ),
          ]),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
        ),
      ),
      body: products == null? const Loader() 
        :Column(
        children: [
          const AddressBox(),
          const SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
              itemCount: products!.length,
              itemBuilder: (context, index){
                return SearchedProduct(product: products![index]);
            }),
          ),
        ],
      ),
    );
  }
}

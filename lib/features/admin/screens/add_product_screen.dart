import 'dart:io';

import 'package:amazon_clone/common/custom_button.dart';
import 'package:amazon_clone/common/custom_textfield.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';
import 'package:dotted_border/dotted_border.dart';

class AddProductsScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductsScreen({Key? key}) : super(key: key);

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  String category = 'Mobiles';
  List<File> images = [];

  @override
  void dispose() {
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            images.isNotEmpty
                ? CarouselSlider(
                    items: images.map((i) {
                      return Builder(
                        builder: (BuildContext context) => Image.file(
                          i,
                          fit: BoxFit.cover,
                          height: 200,
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      height: 200,
                    ),
                  )
                : GestureDetector(
                    onTap: selectImages,
                    child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(10),
                        dashPattern: const [10, 4],
                        strokeCap: StrokeCap.round,
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.folder_open,
                                size: 40,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Select Product Images',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
                controller: productNameController, hintText: 'Product Name'),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                controller: descriptionController,
                maxLines: 7,
                hintText: 'Description'),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(controller: priceController, hintText: 'Price'),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                controller: quantityController, hintText: 'Quantity'),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: DropdownButton(
                onChanged: (String? newVal) {
                  setState(() {
                    category = newVal!;
                  });
                },
                value: category,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: productCategories.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(text: 'Sell', onTap: () {}),
          ]),
        ),
      )),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          title: const Text(
            'Add Product',
            style: TextStyle(color: Colors.black),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
        ),
      ),
    );
  }
}

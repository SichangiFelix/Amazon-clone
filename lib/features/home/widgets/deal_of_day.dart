import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: const Text('Deal of the day',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Image.network('https://images.unsplash.com/photo-1621330396173-e41b1cafd17f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGhvbmVzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60', height: 235, fit: BoxFit.fitHeight,),
        Container(
          padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
          alignment: Alignment.topLeft,
          child: const Text('\$100', style: TextStyle(fontSize: 18),),
        ),
        Container(
          alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
            child: const Text('Prime', 
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network('https://media.istockphoto.com/photos/girl-showing-mobile-advertisement-mockup-area-and-celebrating-her-picture-id1368018367?b=1&k=20&m=1368018367&s=170667a&w=0&h=1NppWaMJ3ggEYNZco4tS5phf56hdC71kRIzOqRhb0zM=', height: 100, width: 100, fit: BoxFit.fitWidth,),
              Image.network('https://media.istockphoto.com/photos/girl-showing-mobile-advertisement-mockup-area-and-celebrating-her-picture-id1368018367?b=1&k=20&m=1368018367&s=170667a&w=0&h=1NppWaMJ3ggEYNZco4tS5phf56hdC71kRIzOqRhb0zM=', height: 100,width: 100, fit: BoxFit.fitWidth,),
              Image.network('https://media.istockphoto.com/photos/girl-showing-mobile-advertisement-mockup-area-and-celebrating-her-picture-id1368018367?b=1&k=20&m=1368018367&s=170667a&w=0&h=1NppWaMJ3ggEYNZco4tS5phf56hdC71kRIzOqRhb0zM=', height: 100,width: 100, fit: BoxFit.fitWidth,),
              Image.network('https://media.istockphoto.com/photos/girl-showing-mobile-advertisement-mockup-area-and-celebrating-her-picture-id1368018367?b=1&k=20&m=1368018367&s=170667a&w=0&h=1NppWaMJ3ggEYNZco4tS5phf56hdC71kRIzOqRhb0zM=', height: 100,width: 100, fit: BoxFit.fitWidth,),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text('See all deals', style: TextStyle(color: Colors.cyan[800])),
        ),
      ],
    );
  }
}
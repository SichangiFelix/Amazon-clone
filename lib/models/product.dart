class Product{
  final String name;  
  final String description; 
  final double quantity;
  final List<String> images; 
  final String category; 
  final double price; 
  final String? id;  
  final String? userId;

  Product({
      required this.name, 
      required this.description, 
      required this.quantity, 
      required this.images, 
      required this.category, 
      required this.price, 
      this.id, 
      this.userId
    });  
}



//Continue on generating serializations hapa kwa hapa
//26
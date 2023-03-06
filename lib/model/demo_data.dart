class CategoryModel {
  String name;
  String icon;
  CategoryModel({required this.name, required this.icon});
}

List<CategoryModel> categoryList = [
  CategoryModel(name: "Nike", icon: 'asset/images/nike.png'),
  CategoryModel(name: "Puma", icon: 'asset/images/puma.png'),
  CategoryModel(name: "Under Armour", icon: 'asset/images/Undearmour.png'),
  CategoryModel(name: "Adidas", icon: "asset/images/adidas.png"),
  CategoryModel(name: "Converse", icon: 'asset/images/Converse.png'),
];

class ShoesModel {
  String name;
  String image;
  String sellerType;
  String price;

  ShoesModel(
      {required this.name,
      required this.image,
      required this.sellerType,
      required this.price});
}

List<ShoesModel> shoesList = [
  ShoesModel(
    name: "Nike Jordan",
    image: 'asset/images/shoes1.png',
    sellerType: "Best Seller",
    price: '\$493.00',
  ),
  ShoesModel(
    name: "Nike Air Max",
    image: 'asset/images/shoes2.png',
    sellerType: "Best Seller",
    price: '\$897.99',
  ),
];

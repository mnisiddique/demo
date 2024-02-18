class Product {
  final double _price;
  final String _name;
  final String _description;

  Product({
    required double price,
    required String name,
    required String description,
  })  : _price = price,
        _name = name,
        _description = description;

  double getPrice() => _price;
  String getName() => _name;
  String getDescription() => _description;
}

class BeverageProduct extends Product {
  BeverageProduct({
    required super.price,
    required super.name,
    required super.description,
  });

  double priceWithDiscount(int percentage) {
    return _price - (percentage * 0.01);
  }
}

void printProductPrice(Product product) {
  if (product is BeverageProduct) {
    print((product as BeverageProduct).priceWithDiscount(10));
  } else {
    print(product.getPrice());
  }
}

void main() {
  Product product = Product(
    price: 20.0,
    name: "Pringle BBQ",
    description: "Very Tasty",
  );
  Product product2 = BeverageProduct(
    price: 40.0,
    name: "Cocacola",
    description: "Very Tasty",
  );
  printProductPrice(product);
  printProductPrice(product2);
}

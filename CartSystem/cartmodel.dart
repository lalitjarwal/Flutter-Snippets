class Cart {
  int count = 0;
  List<Product> items = [];
  int totalPrice = 0;

  get itemsList {
    return this.items;
  }
  void addItem(Product product) {
    items.add(product);
    this.totalPrice += product.price;
  }

  get totalItems {
    this.count = items.length;
    return count;
  }

  removeItem(Product item) {
    this.items.remove(item);
    this.totalPrice -= item.price;
  }

  get cartWeight {
    return this.totalPrice;
  }
}

class Product {
  String name;
  int price;
  bool added;
  Product(this.name, this.price, this.added);
  set checked(bool added) {
    this.added = added;
  }
}

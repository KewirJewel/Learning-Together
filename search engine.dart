class Product {
  final String name;
  final String description;

  Product(this.name, this.description);

  bool search(String term) => name.toLowerCase().contains(term.toLowerCase()) || description.toLowerCase().contains(term.toLowerCase());
}

List<Product> products = [
  // Add your products with name and description
  Product("Shoes", "Running shoes for all terrains"),
  Product("Shirt", "Cotton t-shirt in various colors"),
  // ...
];

void searchProducts(String term) {
  List<Product> results = [];
  for (Product product in products) {
    if (product.search(term)) {
      results.add(product);
    }
  }
  // Display the search results (e.g., in a separate screen)
}
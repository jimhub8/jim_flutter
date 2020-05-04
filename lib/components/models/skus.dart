class Skus {
  String id, product_id, price, sku_no, quantity, description;

  Skus(this.id, this.price, this.quantity, this.product_id, this.description);
  Skus.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'];
    this.price = jsonObject['price'];
    this.quantity = jsonObject['quantity'];
    this.product_id = jsonObject['product_id'];
    this.description = jsonObject['description'];
  }
}

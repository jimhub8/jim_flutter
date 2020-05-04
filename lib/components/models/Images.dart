class Images {
  
  String id, image, display, product_id;

  Images(this.id, this.image, this.display, this.product_id);

  Images.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'];
    this.image = jsonObject['image'];
    this.display = jsonObject['display'];
    this.product_id = jsonObject['product_id'];
  }
}

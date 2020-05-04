class Category {
  String id, user_id, category, menu_id, created_at, updated_at;

  Category(this.id, this.user_id, this.category, this.menu_id,
      this.created_at, this.updated_at);

  Category.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'].toString();
    this.user_id = jsonObject['user_id'].toString();
    this.category = jsonObject['category'].toString();
    this.menu_id = jsonObject['menu_id'].toString();
    this.created_at = jsonObject['created_at'].toString();
    this.updated_at = jsonObject['updated_at'].toString();
  }
}

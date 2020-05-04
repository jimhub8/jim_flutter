class User {
  String id, name, email, created_at, updated_at;

  User(this.id, this.name, this.email, this.created_at, this.updated_at);

//  User.fromJson(jsonresponse[0]);


  User.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'].toString();
    this.name = jsonObject['name'].toString();
    this.email = jsonObject['email'].toString();
    // this.phone = jsonObject['phone'].toString();
    this.created_at = jsonObject['created_at'].toString();
    this.updated_at = jsonObject['updated_at'].toString();
  }
}

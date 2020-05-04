class Order {
  String id,
      client_id,
      total_price,
      sub_total,
      discount,
      order_no,
      sku_no,
      payment_id,
      paypal,
      payment_method,
      image,
      status;

  Order(
    this.id,
    this.client_id,
    this.total_price,
    this.sub_total,
    this.discount,
    this.order_no,
    this.sku_no,
    this.payment_id,
    this.paypal,
    this.payment_method,
    this.status,
    this.image,
  );

  Order.fromJson(Map<String, dynamic> jsonObject) {


    this.id = jsonObject['id'].toString();
    this.client_id = jsonObject['client_id'].toString();
    this.total_price = jsonObject['total_price'].toString();
    this.sub_total = jsonObject['sub_total'].toString();
    this.discount = jsonObject['discount'].toString();
    this.order_no = jsonObject['order_no'].toString();
    this.sku_no = jsonObject['sku_no'].toString();
    this.payment_id = jsonObject['payment_id'].toString();
    this.paypal = jsonObject['paypal'].toString();
    this.payment_method = jsonObject['payment_method'].toString();
    this.status = jsonObject['status'].toString();
    this.image = jsonObject['image'].toString();
  }
}

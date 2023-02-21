class Order {
  int? id;
  String? email;
  String? phone;
  String? address;
  Card ?cart;

  Order({this.id, this.email, this.phone, this.address, this.cart});
  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    cart = json['card'] == null ? new Card.fromJson(json['cart']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    final cart = this.cart;
    if (cart != null) {
      data['cart'] = cart.toJson();
    }
    return data;
  }
}

class Card {
  int? id;
  int? total;
  bool? isComplit;
  String? date;
  int? user;

  Card({this.id, this.total, this.isComplit, this.date, this.user});

  Card.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    isComplit = json['isComplit'];
    date = json['date'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['total'] = this.total;
    data['isComplit'] = this.isComplit;
    data['date'] = this.date;
    data['user'] = this.user;
    return data;
  }
}

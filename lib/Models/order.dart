class Order {
  int? cabOrderId;
  int? userId;
  String? userAddress;
  int? userPincode;
  int? cabId;
  int? cabOrderStatus;
  int? isDeleted;
  String? createdAt;
  String? updatedAt;
  String? userName;
  int? userPhone;
  String? userEmail;

  Order(
      {this.cabOrderId,
      this.userId,
      this.userAddress,
      this.userPincode,
      this.cabId,
      this.cabOrderStatus,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.userName,
      this.userPhone,
      this.userEmail});

  Order.fromJson(Map<String, dynamic> json) {
    cabOrderId = json['cab_order_id'];
    userId = json['user_id'];
    userAddress = json['user_address'];
    userPincode = json['user_pincode'];
    cabId = json['cab_id'];
    cabOrderStatus = json['cab_order_status'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userName = json['user_name'];
    userPhone = json['user_phone'];
    userEmail = json['user_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cab_order_id'] = this.cabOrderId;
    data['user_id'] = this.userId;
    data['user_address'] = this.userAddress;
    data['user_pincode'] = this.userPincode;
    data['cab_id'] = this.cabId;
    data['cab_order_status'] = this.cabOrderStatus;
    data['is_deleted'] = this.isDeleted;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_name'] = this.userName;
    data['user_phone'] = this.userPhone;
    data['user_email'] = this.userEmail;
    return data;
  }
}

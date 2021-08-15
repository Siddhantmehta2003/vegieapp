class Product {
  int? productId;
  int? categoryId;
  String? productName;
  String? productAbout;
  String? productStorageTip;
  String? productFreshTill;
  String? productTag;
  String? productImg;
  String? productCoverImg;
  int? productStatus;
  int? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? totalQuantity;

  Product(
      {this.productId,
      this.categoryId,
      this.productName,
      this.productAbout,
      this.productStorageTip,
      this.productFreshTill,
      this.productTag,
      this.productImg,
      this.productCoverImg,
      this.productStatus,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.totalQuantity});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    categoryId = json['category_id'];
    productName = json['product_name'];
    productAbout = json['product_about'];
    productStorageTip = json['product_storage_tip'];
    productFreshTill = json['product_fresh_till'];
    productTag = json['product_tag'];
    productImg = json['product_img'];
    productCoverImg = json['product_cover_img'];
    productStatus = json['product_status'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    totalQuantity = json['total_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['category_id'] = this.categoryId;
    data['product_name'] = this.productName;
    data['product_about'] = this.productAbout;
    data['product_storage_tip'] = this.productStorageTip;
    data['product_fresh_till'] = this.productFreshTill;
    data['product_tag'] = this.productTag;
    data['product_img'] = this.productImg;
    data['product_cover_img'] = this.productCoverImg;
    data['product_status'] = this.productStatus;
    data['is_deleted'] = this.isDeleted;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['total_quantity'] = this.totalQuantity;
    return data;
  }
}

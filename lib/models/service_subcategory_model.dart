class ServiceSubCategoryModel {
  int? id;
  String? name;
  String? slug;
  String? cover;
  int? serviceCategoryId;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  ServiceSubCategoryModel(
      {this.id,
        this.name,
        this.slug,
        this.cover,
        this.serviceCategoryId,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  ServiceSubCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    cover = json['cover'];
    serviceCategoryId = json['service_category_id'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['cover'] = cover;
    data['service_category_id'] = serviceCategoryId;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class ServiceCategoriesModel {
  int? id;
  String? name;
  String? slug;
  String? icon;
  String? cover;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  ServiceCategoriesModel(
      {this.id,
        this.name,
        this.slug,
        this.icon,
        this.cover,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  ServiceCategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    cover = json['cover'];
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
    data['icon'] = icon;
    data['cover'] = cover;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

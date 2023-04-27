class Category {
  final String? id;
  final String? name;
  final List<Category> subCategories;
  final String? photoUrl;

  Category({
    required this.name,
    this.id,
    this.subCategories = const [],
    this.photoUrl,
  });
}

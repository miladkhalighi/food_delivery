class Category{
  String name;
  bool enabled;

  Category({required this.name,this.enabled = false});
}

 List<Category> categoryList = [
   Category(name: 'Foods'),
   Category(name: 'Drinks'),
   Category(name: 'Snacks'),
   Category(name: 'Sauce'),


 ];
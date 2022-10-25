import 'package:flutter/foundation.dart';

class ItemModel {
  String id;
  int quantity;
  String img;
  String name;
  String price;
  String deliveryInfo;
  String returnPolicy;
  bool liked;
  List<String> category;

  ItemModel({required this.id,
    required this.img,
    required this.name,
    required this.price,
    required this.deliveryInfo,
    required this.returnPolicy,
    required this.quantity,
    required this.liked,
    required this.category
  });

  ItemModel.fromJson(Map<String, dynamic> json):
        id = json['id'],
        quantity = json['quantity'],
        img = json['img'],
        name = json['name'],
        price = json['price'],
        deliveryInfo = json['deliveryInfo'],
        returnPolicy = json['returnPolicy'],
        liked = json['liked'],
        category = json['category'];

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'quantity': quantity,
        'img': img,
        'name': name,
        'price': price,
        'deliveryInfo': deliveryInfo,
        'returnPolicy': returnPolicy,
        'liked': liked,
        'category': category,
      };

}

List<ItemModel> itemsList = [
  ItemModel(
      id: UniqueKey().toString(),
      quantity: 1,
      img: 'assets/images/desserts/01-lemon-cheesecake.png',
      name: 'Lemon Cheesecake',
      price: 'N1,80',
      returnPolicy:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. A nibh rhoncus aliquet sagittis euismod dolor mauris. Sed purus lectus cras sit senectus. Rhoncus cursus ipsum elementum ultrices purus scelerisque magna. Volutpat sed libero habitant nunc, adipiscing turpis feugiat bibendum. Aliquet tellus dolor nunc bibendum iaculis quis blandit sit bibendum. Tincidunt ultrices mollis et consectetur diam nulla facilisis. At convallis aliquet adipiscing non ac feugiat. Ut volutpat porttitor volutpat phasellus vivamus. Eu nullam vel odio tincidunt malesuada imperdiet quis amet donec.',
      deliveryInfo:
      'Tart Lemon Cheesecake sits atop an almond-graham cracker crust to add a delightful nuttiness to the traditional graham cracker crust. Finish the cheesecake with lemon curd for double the tart pucker!',
      liked: true,
      category: ['dessert']),
  ItemModel(
      id: UniqueKey().toString(),
      quantity: 1,
      img: 'assets/images/desserts/05-macaroons.png',
      name: 'Macaroons',
      price: 'N1,85',
      returnPolicy:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. A nibh rhoncus aliquet sagittis euismod dolor mauris. Sed purus lectus cras sit senectus. Rhoncus cursus ipsum elementum ultrices purus scelerisque magna. Volutpat sed libero habitant nunc, adipiscing turpis feugiat bibendum. Aliquet tellus dolor nunc bibendum iaculis quis blandit sit bibendum. Tincidunt ultrices mollis et consectetur diam nulla facilisis. At convallis aliquet adipiscing non ac feugiat. Ut volutpat porttitor volutpat phasellus vivamus. Eu nullam vel odio tincidunt malesuada imperdiet quis amet donec.',
      deliveryInfo:
          'Soft and chewy on the inside, crisp and golden on the outside — these are the perfect macaroons.',
      liked: false,
      category: ['dessert']),
  ItemModel(
      id: UniqueKey().toString(),
      quantity: 0,
      img: 'assets/images/desserts/08-cream-cupcakes.png',
      name: 'Cream Cupcakes',
      price: 'N1,75',
      returnPolicy:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. A nibh rhoncus aliquet sagittis euismod dolor mauris. Sed purus lectus cras sit senectus. Rhoncus cursus ipsum elementum ultrices purus scelerisque magna. Volutpat sed libero habitant nunc, adipiscing turpis feugiat bibendum. Aliquet tellus dolor nunc bibendum iaculis quis blandit sit bibendum. Tincidunt ultrices mollis et consectetur diam nulla facilisis. At convallis aliquet adipiscing non ac feugiat. Ut volutpat porttitor volutpat phasellus vivamus. Eu nullam vel odio tincidunt malesuada imperdiet quis amet donec.',
      deliveryInfo:
      "Bake these easy vanilla cupcakes in just 35 minutes. Perfect for birthdays, picnics or whenever you fancy a sweet treat, they're sure to be a crowd-pleaser",
      liked: false,
      category: ['dessert']),
  ItemModel(
      id: UniqueKey().toString(),
      quantity: 0,
      img: 'assets/images/desserts/02-chocolate-cake-1.png',
      name: 'Chocolate Cheesecake',
      price: 'N1,70',
      returnPolicy:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. A nibh rhoncus aliquet sagittis euismod dolor mauris. Sed purus lectus cras sit senectus. Rhoncus cursus ipsum elementum ultrices purus scelerisque magna. Volutpat sed libero habitant nunc, adipiscing turpis feugiat bibendum. Aliquet tellus dolor nunc bibendum iaculis quis blandit sit bibendum. Tincidunt ultrices mollis et consectetur diam nulla facilisis. At convallis aliquet adipiscing non ac feugiat. Ut volutpat porttitor volutpat phasellus vivamus. Eu nullam vel odio tincidunt malesuada imperdiet quis amet donec.',
      deliveryInfo:
      "Treat family and friends to this decadent chocolate dessert. It's an indulgent end to a dinner party or weekend family meal",
      liked: false,
      category: ['dessert']),
  ItemModel(
      id: UniqueKey().toString(),
      quantity: 0,
      img: 'assets/images/desserts/09-fruit-plate.png',
      name: 'Fruit Plate',
      price: 'N1,100',
      returnPolicy:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. A nibh rhoncus aliquet sagittis euismod dolor mauris. Sed purus lectus cras sit senectus. Rhoncus cursus ipsum elementum ultrices purus scelerisque magna. Volutpat sed libero habitant nunc, adipiscing turpis feugiat bibendum. Aliquet tellus dolor nunc bibendum iaculis quis blandit sit bibendum. Tincidunt ultrices mollis et consectetur diam nulla facilisis. At convallis aliquet adipiscing non ac feugiat. Ut volutpat porttitor volutpat phasellus vivamus. Eu nullam vel odio tincidunt malesuada imperdiet quis amet donec.',
      deliveryInfo:
      "Melons - they're firmer so make a great base for the softer berries and fruits. Tropical fruit - the top of a pineapple can be included for height, while dragonfruit looks vibrant.",
      liked: true,
      category: ['dessert']),
  ItemModel(
      id: UniqueKey().toString(),
      quantity: 0,
      img: 'assets/images/desserts/03-chocolate-donuts.png',
      name: 'Chocolate Donuts',
      price: 'N1,65',
      returnPolicy:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. A nibh rhoncus aliquet sagittis euismod dolor mauris. Sed purus lectus cras sit senectus. Rhoncus cursus ipsum elementum ultrices purus scelerisque magna. Volutpat sed libero habitant nunc, adipiscing turpis feugiat bibendum. Aliquet tellus dolor nunc bibendum iaculis quis blandit sit bibendum. Tincidunt ultrices mollis et consectetur diam nulla facilisis. At convallis aliquet adipiscing non ac feugiat. Ut volutpat porttitor volutpat phasellus vivamus. Eu nullam vel odio tincidunt malesuada imperdiet quis amet donec.',
      deliveryInfo:
      'Moist and fluffy donuts that are baked, not fried, and full of chocolate. Covered in a thick chocolate glaze, these are perfect for any chocoholic who wants a chocolate version of this classic treat.',
      liked: false,
      category: ['dessert']),
  ItemModel(
      id: UniqueKey().toString(),
      quantity: 0,
      img: 'assets/images/desserts/13-strawberry-powdered-cake.png',
      name: 'Strawberry Cake',
      price: 'N1,86',
      returnPolicy:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. A nibh rhoncus aliquet sagittis euismod dolor mauris. Sed purus lectus cras sit senectus. Rhoncus cursus ipsum elementum ultrices purus scelerisque magna. Volutpat sed libero habitant nunc, adipiscing turpis feugiat bibendum. Aliquet tellus dolor nunc bibendum iaculis quis blandit sit bibendum. Tincidunt ultrices mollis et consectetur diam nulla facilisis. At convallis aliquet adipiscing non ac feugiat. Ut volutpat porttitor volutpat phasellus vivamus. Eu nullam vel odio tincidunt malesuada imperdiet quis amet donec.',
      deliveryInfo:
      'Jam-packed with fresh strawberries, this strawberry cake is one of the simplest, most delicious cakes you’ll ever make.',
      liked: false, category: ['dessert']),
  ItemModel(
      id: UniqueKey().toString(),
      quantity: 0,
      img: 'assets/images/desserts/04-fluffy-cake.png',
      name: 'Fluffy Cake',
      price: 'N1,90',
      returnPolicy:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. A nibh rhoncus aliquet sagittis euismod dolor mauris. Sed purus lectus cras sit senectus. Rhoncus cursus ipsum elementum ultrices purus scelerisque magna. Volutpat sed libero habitant nunc, adipiscing turpis feugiat bibendum. Aliquet tellus dolor nunc bibendum iaculis quis blandit sit bibendum. Tincidunt ultrices mollis et consectetur diam nulla facilisis. At convallis aliquet adipiscing non ac feugiat. Ut volutpat porttitor volutpat phasellus vivamus. Eu nullam vel odio tincidunt malesuada imperdiet quis amet donec.',
      deliveryInfo:
      "This is a very good everyday cake leavened with baking powder. It's relatively light—it isn't loaded with butter, and it calls for only 2 eggs and 2 percent milk. Mine was perfectly baked after 30 minutes. After 10 minutes on the cooling rack, the cake released from the pans easily.",
      liked: false, category: ['dessert']),
  ItemModel(
      id: UniqueKey().toString(),
      quantity: 0,
      img: 'assets/images/desserts/06-white-cream-cake.png',
      name: 'White Cream Cake',
      price: 'N1,85',
      returnPolicy:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. A nibh rhoncus aliquet sagittis euismod dolor mauris. Sed purus lectus cras sit senectus. Rhoncus cursus ipsum elementum ultrices purus scelerisque magna. Volutpat sed libero habitant nunc, adipiscing turpis feugiat bibendum. Aliquet tellus dolor nunc bibendum iaculis quis blandit sit bibendum. Tincidunt ultrices mollis et consectetur diam nulla facilisis. At convallis aliquet adipiscing non ac feugiat. Ut volutpat porttitor volutpat phasellus vivamus. Eu nullam vel odio tincidunt malesuada imperdiet quis amet donec.',
      deliveryInfo:
      'This White Chocolate Cake is both decadent and delicious! White chocolate is incorporated into the cake layers, the frosting, and the drip for a stunning monochrome effect.',
      liked: true, category: ['dessert']),
  ItemModel(
      id: UniqueKey().toString(),
      quantity: 0,
      img: 'assets/images/desserts/14-fruit-pie.png',
      name: 'Fruit Pie',
      price: 'N1,70',
      returnPolicy:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. A nibh rhoncus aliquet sagittis euismod dolor mauris. Sed purus lectus cras sit senectus. Rhoncus cursus ipsum elementum ultrices purus scelerisque magna. Volutpat sed libero habitant nunc, adipiscing turpis feugiat bibendum. Aliquet tellus dolor nunc bibendum iaculis quis blandit sit bibendum. Tincidunt ultrices mollis et consectetur diam nulla facilisis. At convallis aliquet adipiscing non ac feugiat. Ut volutpat porttitor volutpat phasellus vivamus. Eu nullam vel odio tincidunt malesuada imperdiet quis amet donec.',
      deliveryInfo:
      'Bake a hearty fruit pie for dessert. Our collection of year-round pastry classics includes apple & blackberry, summer berries, lemon meringue and mince pies.',
      liked: false, category: ['dessert']),
  ItemModel(
      id: UniqueKey().toString(),
      quantity: 0,
      img: 'assets/images/desserts/07-honey-cake.png',
      name: 'Honey Cake',
      price: 'N1,80',
      returnPolicy:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. A nibh rhoncus aliquet sagittis euismod dolor mauris. Sed purus lectus cras sit senectus. Rhoncus cursus ipsum elementum ultrices purus scelerisque magna. Volutpat sed libero habitant nunc, adipiscing turpis feugiat bibendum. Aliquet tellus dolor nunc bibendum iaculis quis blandit sit bibendum. Tincidunt ultrices mollis et consectetur diam nulla facilisis. At convallis aliquet adipiscing non ac feugiat. Ut volutpat porttitor volutpat phasellus vivamus. Eu nullam vel odio tincidunt malesuada imperdiet quis amet donec.',
      deliveryInfo:
      "The secret to this cake's fantastic flavor is the tiny amount of bitterness from burnt honey. The slightly tangy whipped cream frosting provides a bit of acidity and lovely light texture, and unlike other frostings, it's not too sweet",
      liked: false, category: ['dessert']),
  ItemModel(
      id: UniqueKey().toString(),
      quantity: 0,
      img: 'assets/images/desserts/11-powdered-cake.png',
      name: 'Powdered Cake',
      price: 'N1,95',
      returnPolicy:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. A nibh rhoncus aliquet sagittis euismod dolor mauris. Sed purus lectus cras sit senectus. Rhoncus cursus ipsum elementum ultrices purus scelerisque magna. Volutpat sed libero habitant nunc, adipiscing turpis feugiat bibendum. Aliquet tellus dolor nunc bibendum iaculis quis blandit sit bibendum. Tincidunt ultrices mollis et consectetur diam nulla facilisis. At convallis aliquet adipiscing non ac feugiat. Ut volutpat porttitor volutpat phasellus vivamus. Eu nullam vel odio tincidunt malesuada imperdiet quis amet donec.',
      deliveryInfo:
      'Heavy on the butter and nutmeg, this cake has all the flavors of your favorite cake donut in a convenient square shape.',
      liked: true, category: ['dessert']),
  ItemModel(
      id: UniqueKey().toString(),
      quantity: 0,
      img: 'assets/images/desserts/10-strawberries.png',
      name: 'Strawberries',
      price: 'N1,80',
      returnPolicy:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. A nibh rhoncus aliquet sagittis euismod dolor mauris. Sed purus lectus cras sit senectus. Rhoncus cursus ipsum elementum ultrices purus scelerisque magna. Volutpat sed libero habitant nunc, adipiscing turpis feugiat bibendum. Aliquet tellus dolor nunc bibendum iaculis quis blandit sit bibendum. Tincidunt ultrices mollis et consectetur diam nulla facilisis. At convallis aliquet adipiscing non ac feugiat. Ut volutpat porttitor volutpat phasellus vivamus. Eu nullam vel odio tincidunt malesuada imperdiet quis amet donec.',
      deliveryInfo:
      "We'll admit it: we go a little crazy during strawberry season. Though easy to grow, these sweet berries just taste better when you get them in season, as opposed to buying them at other times of the year.",
      liked: true, category: ['dessert']),
  ItemModel(
      id: UniqueKey().toString(),
      quantity: 0,
      img: 'assets/images/desserts/12-chocolate-cake-2.png',
      name: 'Chocolate Cake',
      price: 'N1,70',
      returnPolicy:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. A nibh rhoncus aliquet sagittis euismod dolor mauris. Sed purus lectus cras sit senectus. Rhoncus cursus ipsum elementum ultrices purus scelerisque magna. Volutpat sed libero habitant nunc, adipiscing turpis feugiat bibendum. Aliquet tellus dolor nunc bibendum iaculis quis blandit sit bibendum. Tincidunt ultrices mollis et consectetur diam nulla facilisis. At convallis aliquet adipiscing non ac feugiat. Ut volutpat porttitor volutpat phasellus vivamus. Eu nullam vel odio tincidunt malesuada imperdiet quis amet donec.',
      deliveryInfo:
      'The Best Chocolate Cake Recipe – A one bowl chocolate cake recipe that is quick, easy, and delicious! Updated with gluten-free, dairy-free, and egg-free options!',
      liked: false, category: ['dessert']),
  ItemModel(
      id: UniqueKey().toString(),
      quantity: 0,
      img: 'assets/images/desserts/15-apple-pie.png',
      name: 'Apple Pie',
      price: 'N1,95',
      returnPolicy:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. A nibh rhoncus aliquet sagittis euismod dolor mauris. Sed purus lectus cras sit senectus. Rhoncus cursus ipsum elementum ultrices purus scelerisque magna. Volutpat sed libero habitant nunc, adipiscing turpis feugiat bibendum. Aliquet tellus dolor nunc bibendum iaculis quis blandit sit bibendum. Tincidunt ultrices mollis et consectetur diam nulla facilisis. At convallis aliquet adipiscing non ac feugiat. Ut volutpat porttitor volutpat phasellus vivamus. Eu nullam vel odio tincidunt malesuada imperdiet quis amet donec.',
      deliveryInfo:
      "This was my grandmother's apple pie recipe. I have never seen another one quite like it. It will always be my favorite and has won me several first place prizes in local competitions.",
      liked: false, category: ['dessert']),
  ItemModel(
      id: UniqueKey().toString(),
      quantity: 0,
      img: 'assets/images/1.png',
      name: 'Veggie tomato mix',
      price: 'N1,900',
      returnPolicy:
      'All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.',
      deliveryInfo:
      'Delivered between monday aug and thursday 20 from 8pm to 91:32 pm',
      liked: true,
      category: ["food"]
  ),
  ItemModel(
      id: UniqueKey().toString(),
      quantity: 0,
      img: 'assets/images/2.png',
      name: 'Spicy fish sauce',
      price: 'N2,300.99',
      deliveryInfo:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet interdum enim, malesuada lacus sem quis. Sed euismod eu rhoncus convallis. Habitasse lacinia sit vestibulum, blandit feugiat accumsan. Eget sed nulla viverra volutpat tellus vestibulum aliquam.',
      returnPolicy:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. A nibh rhoncus aliquet sagittis euismod dolor mauris. Sed purus lectus cras sit senectus. Rhoncus cursus ipsum elementum ultrices purus scelerisque magna. Volutpat sed libero habitant nunc, adipiscing turpis feugiat bibendum. Aliquet tellus dolor nunc bibendum iaculis quis blandit sit bibendum. Tincidunt ultrices mollis et consectetur diam nulla facilisis. At convallis aliquet adipiscing non ac feugiat. Ut volutpat porttitor volutpat phasellus vivamus. Eu nullam vel odio tincidunt malesuada imperdiet quis amet donec.',
      liked: false,
      category: ["food","sea food"]),
  ItemModel(
      id: UniqueKey().toString(),
      quantity: 0,
      img: 'assets/images/3.png',
      name: 'Egg and cucmber',
      price: 'N1,900',
      deliveryInfo:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet interdum enim, malesuada lacus sem quis. Sed euismod eu rhoncus convallis. Habitasse lacinia sit vestibulum, blandit feugiat accumsan. Eget sed nulla viverra volutpat tellus vestibulum aliquam.',
      returnPolicy:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet interdum enim, malesuada lacus sem quis. Sed euismod eu rhoncus convallis. Habitasse lacinia sit vestibulum, blandit feugiat accumsan. Eget sed nulla viverra volutpat tellus vestibulum aliquam.',
      liked: false,
      category: ["food"]),
  ItemModel(
      id: UniqueKey().toString(),
      quantity: 0,
      img: 'assets/images/4.png',
      name: 'Fried chicken',
      price: 'N1,900',
      deliveryInfo:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet interdum enim, malesuada lacus sem quis. Sed euismod eu rhoncus convallis. Habitasse lacinia sit vestibulum, blandit feugiat accumsan. Eget sed nulla viverra volutpat tellus vestibulum aliquam.',
      returnPolicy:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. A nibh rhoncus aliquet sagittis euismod dolor mauris. Sed purus lectus cras sit senectus. Rhoncus cursus ipsum elementum ultrices purus scelerisque magna. Volutpat sed libero habitant nunc, adipiscing turpis feugiat bibendum. Aliquet tellus dolor nunc bibendum iaculis quis blandit sit bibendum. Tincidunt ultrices mollis et consectetur diam nulla facilisis. At convallis aliquet adipiscing non ac feugiat. Ut volutpat porttitor volutpat phasellus vivamus. Eu nullam vel odio tincidunt malesuada imperdiet quis amet donec.',
      liked: true,
      category: ["food"]),
  ItemModel(
      id: UniqueKey().toString(),
      quantity: 0,
      img: 'assets/images/5.png',
      name: 'Moi-moi and ekpa',
      price: 'N1,900',
      deliveryInfo:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet interdum enim, malesuada lacus sem quis. Sed euismod eu rhoncus convallis. Habitasse lacinia sit vestibulum, blandit feugiat accumsan. Eget sed nulla viverra volutpat tellus vestibulum aliquam.',
      returnPolicy:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. A nibh rhoncus aliquet sagittis euismod dolor mauris. Sed purus lectus cras sit senectus. Rhoncus cursus ipsum elementum ultrices purus scelerisque magna. Volutpat sed libero habitant nunc, adipiscing turpis feugiat bibendum. Aliquet tellus dolor nunc bibendum iaculis quis blandit sit bibendum. Tincidunt ultrices mollis et consectetur diam nulla facilisis. At convallis aliquet adipiscing non ac feugiat. Ut volutpat porttitor volutpat phasellus vivamus. Eu nullam vel odio tincidunt malesuada imperdiet quis amet donec.',
      liked: false,
      category: ["food"]),
  ItemModel(
      id: UniqueKey().toString(),
      quantity: 0,
      img: 'assets/images/1.png',
      name: 'Fish with mix orange',
      price: 'N1,900',
      returnPolicy:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. A nibh rhoncus aliquet sagittis euismod dolor mauris. Sed purus lectus cras sit senectus. Rhoncus cursus ipsum elementum ultrices purus scelerisque magna. Volutpat sed libero habitant nunc, adipiscing turpis feugiat bibendum. Aliquet tellus dolor nunc bibendum iaculis quis blandit sit bibendum. Tincidunt ultrices mollis et consectetur diam nulla facilisis. At convallis aliquet adipiscing non ac feugiat. Ut volutpat porttitor volutpat phasellus vivamus. Eu nullam vel odio tincidunt malesuada imperdiet quis amet donec.',
      deliveryInfo:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet interdum enim, malesuada lacus sem quis. Sed euismod eu rhoncus convallis. Habitasse lacinia sit vestibulum, blandit feugiat accumsan. Eget sed nulla viverra volutpat tellus vestibulum aliquam.',
      liked: true,
      category: ["food","sea food"]),

];

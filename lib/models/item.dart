
class Item{

  String img;
  String name;
  String price;

  Item({required this.img,required this.name, required this.price});

}

  List<Item> itemsList = [
    Item(img: 'assets/images/food-img1.png', name: 'Veggie \ntomato mix', price: 'N1,900'),
    Item(img: 'assets/images/food-img2.png', name: 'Spicy fish \nsauce', price: 'N2,300.99'),
    Item(img: 'assets/images/food-img3.png', name: 'Egg and \ncucmber...', price: 'N1,900'),
    Item(img: 'assets/images/food-img4.png', name: 'Fried \nchicken m.', price: 'N1,900'),
    Item(img: 'assets/images/food-img5.png', name: 'Moi-moi and ekpa.', price: 'N1,900'),
    Item(img: 'assets/images/food-img6.png', name: 'Fishwith mix orange....', price: 'N1,900'),
  ];
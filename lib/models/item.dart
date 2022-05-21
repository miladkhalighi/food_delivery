class Item {
  String img;
  String name;
  String price;
  String deliveryInfo;
  String returnPolicy;

  Item(
      {required this.img,
      required this.name,
      required this.price,
      required this.deliveryInfo,
      required this.returnPolicy});
}

List<Item> itemsList = [
  Item(
      img: 'assets/images/food-img1.png',
      name: 'Veggie \ntomato mix',
      price: 'N1,900',
      returnPolicy: 'All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.',
      deliveryInfo: 'Delivered between monday aug and thursday 20 from 8pm to 91:32 pm'),
  Item(
      img: 'assets/images/food-img2.png',
      name: 'Spicy fish \nsauce',
      price: 'N2,300.99',
      deliveryInfo: '',
      returnPolicy: ''),
  Item(
      img: 'assets/images/food-img3.png',
      name: 'Egg and \ncucmber...',
      price: 'N1,900',
      deliveryInfo: '',
      returnPolicy: ''),
  Item(
      img: 'assets/images/food-img4.png',
      name: 'Fried \nchicken m.',
      price: 'N1,900',
      deliveryInfo: '',
      returnPolicy: ''),
  Item(
      img: 'assets/images/food-img5.png',
      name: 'Moi-moi and ekpa.',
      price: 'N1,900',
      deliveryInfo: '',
      returnPolicy: ''),
  Item(
      img: 'assets/images/food-img6.png',
      name: 'Fishwith mix orange....',
      price: 'N1,900',
      returnPolicy: '',
      deliveryInfo: ''),
];

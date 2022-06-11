import 'package:flutter/material.dart';
import 'package:food_delivery/models/item.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  var size = Get.size;
  var bodyMargin = Get.size.width * 0.07;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Cart',style: Theme.of(context).textTheme.bodyText1,),
        ),
        body: Column(

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.account_balance),
                const SizedBox(width: 8,),
                Text('swipe on an item to delete',style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black),),
              ],
            ),
            const SizedBox(height: 16,),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: itemsList.length,
                  itemBuilder: (context,index){
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: bodyMargin,vertical: 8),
                  child: ItemCard(item: itemsList[index]),
                );
              }),
            ),

          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Item item;
  const ItemCard({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [

                SizedBox(
                    width: 70,
                    height: 70,
                    child: CircleAvatar(backgroundImage: AssetImage(item.img),)),
                const SizedBox(width: 16,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item.name,style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 20),),
                    const SizedBox(height: 8,),
                    Text(item.price,style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16,color: SolidColors.primaryColor),),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 16,
          bottom: 16,
          child: Container(

            decoration: BoxDecoration(
              color: SolidColors.primaryColor,
              borderRadius: BorderRadius.circular(1000)
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  const SizedBox(width: 8,),
                  InkWell(onTap:(){},child: const Icon(Icons.add,color: Colors.white,size: 16,)),
                  const SizedBox(width: 8,),
                  Text('1',style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white),),
                  const SizedBox(width: 8,),
                  InkWell(onTap:(){},child: const Icon(Icons.add,color: Colors.white,size: 16,)),
                  const SizedBox(width: 8,),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

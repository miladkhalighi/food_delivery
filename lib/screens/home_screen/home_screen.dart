
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

  String searchTxt = "";

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width * 0.1;
    return Scaffold(
      backgroundColor: SolidColors.backgroundScreens,
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAppBar(bodyMargin),
          const SizedBox(height: 32,),
          //header text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: bodyMargin),
            child: Text('Delicious \nfood for you',style: Theme.of(context).textTheme.headline2,),
          ),
          const SizedBox(height: 32,),
          searchBar(bodyMargin),
          const SizedBox(height: 32,),
          

        ],
      ),
    );
  }

  Padding buildAppBar(double bodyMargin) {
    return Padding(
          padding: EdgeInsets.symmetric(horizontal: bodyMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: (){},
                  child: SvgPicture.asset('assets/icons/menu_icon.svg',width: 24,height: 24,)
              ),
              InkWell(
                  onTap: (){},
                  child: SvgPicture.asset('assets/icons/shopping-cart.svg',width: 24,height: 24,)
              ),
            ],
          ),
        );
  }

  Padding searchBar(double bodyMargin) {
    return Padding(
          padding: EdgeInsets.symmetric(horizontal: bodyMargin),
          child: TextField(
            decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search,color: Colors.black,),
            fillColor: SolidColors.textFieldInside,
            filled: true,
            hintText: 'Search',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(1000)),
                borderSide: BorderSide(color: SolidColors.textFieldInside)
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(1000)),
              borderSide: BorderSide(color: SolidColors.textFieldInside)
            )
            ),
            onChanged: (value ){
              setState(() {
                searchTxt = value;
              });
            },

          ),
        );
  }
}

class CategoryItem extends StatelessWidget {

  final String name;
  final Function() pressed;
  final bool enabled;

  const CategoryItem({
    Key? key,
    required this.name,
    required this.pressed,
    required this.enabled
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name,style: Theme.of(context).textTheme.bodyText1,),
        const SizedBox(height: 8,),
        Divider(color: enabled ? SolidColors.primaryColor : Colors.transparent,)
      ],
    );
  }
}


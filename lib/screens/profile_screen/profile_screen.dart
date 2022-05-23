
import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';

import 'components/profile_listtile.dart';
import 'components/title_with_textbutton.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width * 0.07;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: bodyMargin),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My profile',
                  style: textTheme.headline2,
                ),
                const SizedBox(
                  height: 32,
                ),
                TitleWithTextButton(
                  buttonText: 'change',
                  title: 'Personal details',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 200, //todo : change dynamic size
                  child: buildProfileCard(textTheme),
                ),
                const SizedBox(
                  height: 32,
                ),
                ProfileListTile(title: 'Orders', onTap: () {  },),
                const SizedBox(height: 32,),
                ProfileListTile(title: 'Pending reviews', onTap: () {  },),
                const SizedBox(height: 32,),
                ProfileListTile(title: 'Faq', onTap: () {  },),
                const SizedBox(height: 32,),
                ProfileListTile(title: 'Help', onTap: () {  },),


              ],
            ),
            const SizedBox(height: 64,),
            SizedBox(
                height: 64,
                child: ElevatedButton(onPressed: (){}, child: const Text('Update'))),
            const SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }

  Widget buildProfileCard(TextTheme textTheme) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 16,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: Container(
                color: SolidColors.primaryColor,
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/ToyFaces_man.png',
                  ),
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Milad Khalighi',
                    style: textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'milad.kh4lighi@gmail.com',
                    style: textTheme.bodyText2?.copyWith(color: Colors.grey),
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 16,
                    endIndent: 16,
                  ),
                  Text(
                    '+98 912 000 0000',
                    style: textTheme.bodyText2?.copyWith(color: Colors.grey),
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 16,
                    endIndent: 16,
                  ),
                  Text(
                    'No 15 uti street off ovie palace road effurun delta state',
                    style: textTheme.bodyText2?.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}





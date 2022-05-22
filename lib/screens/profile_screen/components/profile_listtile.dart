import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  final String title;
  final Function() onTap;
  const ProfileListTile({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: ListTile(
        onTap: onTap,
        trailing: const Icon(Icons.arrow_forward_ios,color: Colors.black,),
        title: Text(title,style: Theme.of(context).textTheme.bodyText1,),
      ),
    );
  }
}
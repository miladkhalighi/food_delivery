
class DrawerModel {
  String title;
  String iconPath;

  DrawerModel({required this.title,required this.iconPath});
}

 List<DrawerModel> drawerList = [
   DrawerModel(title: 'Profile', iconPath: "assets/icons/gg_profile.svg"),
   DrawerModel(title: 'Orders', iconPath: "assets/icons/icons8_buy.svg"),
   DrawerModel(title: 'Offer and promo', iconPath: "assets/icons/ic_outline-local-offer.svg"),
   DrawerModel(title: 'Privacy policy', iconPath: "assets/icons/ic_outline-sticky-note-2.svg"),
   DrawerModel(title: 'Security', iconPath: "assets/icons/security.svg"),
   DrawerModel(title: 'Sign-out', iconPath: "assets/icons/arrow.svg"),
 ];
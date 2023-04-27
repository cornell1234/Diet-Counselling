// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var isDark = MediaQuery. of(context).platformBrightness == Brightness.dark;
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(onPressed: (){}, icon: const Icon(LineAwesomeIcons.angle_left))
//         title: Text(tProfile, style: Theme.of(context).textTheme.headline4),
//         actions: [
//           IconButton(onPressed: (){}, icon: Icon(isDark? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
//         ]
//       )
//       body: SingleChildScrollView(
//         child: profilenmenuwidget(context)
//               ),
//         );
        
    
    
//   }

//   Container profilenmenuwidget(BuildContext context) {
//     return Container(
//         padding: const EdgeInsets.all(tDefaultSize),
//         child: Column(
//           children: (width: 120, height: 120,
//             child: ClipRRect (borderRadius: BorderRadius.circular 100,child: image:(image: AssetImage(tProfileImage),))),
//         ),
//         const SizeBox(height: 10),
//         Text(tProfileHeading, style: Themeof(context).textTheme.headline4),
//         Text(tProfilesubHeading, style: Themeof(context).textTheme.bodyText2),
//         const SizedBox(height: 20), 
//         sizedBox(
//           width: 200, 
//           child: ElevatedButton(
//             onPressed: () {},
//             child: const Text(tEditProfile, style: TextStyle(color: tDarkColor)),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: tPrimaryColor, side: BorderSize.name, shape: const StadiumBorder()),
//             child: const Text(tEditProfile, style: TextStyle(color: tDarkColor)),
//             ), 
//             ),
//             const SizedBox(height: 30),
//             const Divider(),
//             const SizedBox(height: 10),

//             ///MENU
//             profilemenuwidget(title: "Settings", icon: LineAwesomeIcons.cog () {}),
//             profilemenuwidget("Billing Details", icon: LineAwesomeIcons.wallet, onPress: () {}),
//             profilemenuwidget("User Management", icon: LineAwesomeIcons.user_check, onPress: () {}),
//             const Divider(),
//             const SizedBox(height: 10),
//             profilemenuwidget(title: "information", icon: LineAwesomeIcons.info, onPress: () {}),
//             profilemenuwidget(
//               title: "Logout",
//               icon: LineAwesomeIcons.alternate_sign_out,
//               textColor: Colors.red,
//               endIcon: false,
//               onPress: () {}
//             ),
//     );
//   }
// }

// class profilemenuwidget extends StatelessWidget {
//   const profilemenuwidget({
//     super.key,
//     required this.title,
//     required this.icon,
//     required this.onPress,
//     this.textColor,
//   }) : super(key: key);

//   final String title;
//   final IconData icon;
//   final VoidCallback onPress;
//   final bool endIcon;
//   final color? textColor;

//   @override
//   Widget build(BuildContext context) {
//     var IsDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
//     var iconColor = IsDark ? tPrimaryColor : tAccentColor;
//     return ListTile(
//       onTap: onPress,
//       leading: Container(
//         width: 40, height: 40,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(100),
//           color: iconColor.withOpacity(0.1),
//         )  
//         child: const Icon(LineAwesomeIcons.cog, color: IconColor),
//       )
//       title: Text(tMenu1, style: Theme.of(context).textTheme.bodyText1),
//       trailing: Container(
//          width: 30, height: 30,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(100),
//           color: Colors.grey.withOpacity(0.1),
//         )  
//         child: const Icon(LineAwesomeIcons.angle_right, size: 18.0, color: Colors.grey)) : null,
//       );
//   }
// }

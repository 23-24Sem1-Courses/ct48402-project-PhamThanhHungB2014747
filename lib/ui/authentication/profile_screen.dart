import 'package:ct484_project/ui/authentication/auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Column(
        children: <Widget>[
          Container(height: 24),
          Container(
            height: 300.0,
            color: const Color(0XFFBBBBBB),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  width: 125.0,
                  height: 125.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 40.0,
                  child: Text(
                    'Email here',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontFamily: 'Recoleta',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.logout,
              size: 40.0,
              color: Colors.red,
            ),
            title: const Text(
              'Logout',
              style: TextStyle(
                color: Color(0xFF001524),
                fontSize: 25,
                fontFamily: 'Recoleta',
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.of(context)
                ..pop()
                ..pushReplacementNamed('/');
              context.read<AuthManager>().logout();
            },
          ),
        ],
      ),
    );
  }
}

// class _ProfileState extends State<Profile> {
//   bool isPressed = false;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(height: 24),
//         Container(
//           // width: 300.0,
//           height: 300.0,
//           color: const Color(0XFFBBBBBB),
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Positioned(
//                 width: 125.0,
//                 height: 125.0,
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               const Positioned(
//                 bottom: 40.0,
//                 child: Text(
//                   'Email here',
//                   style: TextStyle(
//                       fontSize: 20.0,
//                       color: Colors.black,
//                       fontFamily: 'Recoleta',
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0, right: 8.0),
//           child: ElevatedButton(
//               // style: style,
//               onPressed: () {},
//               style: ButtonStyle(
//                 backgroundColor:
//                     MaterialStateProperty.all<Color>(const Color(0XFFBBBBBB)),
//                 minimumSize: MaterialStateProperty.all<Size>(
//                     const Size(double.infinity, 60.0)),
//                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//               child: const Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(right: 10.0),
//                     child: Icon(
//                       Icons.logout,
//                       size: 40.0,
//                       color: Colors.red,
//                     ),
//                   ),
//                   Text(
//                     'Log out',
//                     style: TextStyle(
//                       color: Color(0xFF001524),
//                       fontSize: 25,
//                       fontFamily: 'Recoleta',
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               )),
//         ),
//       ],
//     );
//   }
// }
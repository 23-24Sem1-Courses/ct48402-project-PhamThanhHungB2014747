import 'package:flutter/material.dart';

import './sign_up.dart';
// import './authentication_manager_.dart';
import 'customdialog.dart';

PageController controller = PageController(initialPage: 0);

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.controller});
  final PageController controller;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final AuthenticationManager _authenticationManager = AuthenticationManager();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEE9DA),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Log In',
                  style: TextStyle(
                    color: Color(0xFF6096B4),
                    fontSize: 30,
                    fontFamily: 'Recoleta',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: _emailController,
                  textAlign: TextAlign.center, 
                  style: const TextStyle(
                    color: Color(0xFF393939),
                    fontSize: 13,
                    fontFamily: 'Recoleta',
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Color(0xFF6096B4),
                      fontSize: 15,
                      fontFamily: 'Recoleta',
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xFF837E93),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xFF6096B4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _passController,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF393939),
                    fontSize: 13,
                    fontFamily: 'Recoleta',
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Color(0xFF6096B4),
                      fontSize: 15,
                      fontFamily: 'Recoleta',
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xFF837E93),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xFF6096B4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 15,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: SizedBox(
                    width: 329,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        if(checkLogin(_emailController.text,_passController.text) == true){
                          // _authenticationManager.login(_emailController.text,_passController.text);
                          print('yes');
                        }
                        else{
                          CustomDialog.show(
                            context, 
                            checkLogin(_emailController.text,_passController.text), 
                            Color(0xFFFF0000));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6096B4),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Recoleta',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Text(
                      'Don’t have an account?',
                      style: TextStyle(
                        color: Color(0xFF001524),
                        fontSize: 13,
                        fontFamily: 'Recoleta',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 2.5,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => SignUpScreen(controller: controller)),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xFF6096B4),
                          fontSize: 13,
                          fontFamily: 'Recoleta',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Forget Password?',
                  style: TextStyle(
                    color: Color(0xFF6096B4),
                    fontSize: 13,
                    fontFamily: 'Recoleta',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  checkLogin(String email,String pass){
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    // final uppercaseRegex = RegExp(r'[A-Z]');
    // final lowercaseRegex = RegExp(r'[a-z]');
    // final digitRegex = RegExp(r'[0-9]');

    if(email.isEmpty || pass.isEmpty){
      return 'Email or password can not null';
    }
      
    if (!emailRegex.hasMatch(email)) {
      return 'Your email is not valid'; // Email không đúng định dạng
    }

    if (pass.length < 8) {
      return 'Your password is too short'; // Mật khẩu quá ngắn
    }
    // if (!uppercaseRegex.hasMatch(pass) || !lowercaseRegex.hasMatch(pass) || !digitRegex.hasMatch(pass)) {
    //   return 'Your password must include uppercase letters, lowercase letters, and numbers'; // Mật khẩu không đủ mạnh
    // }

    return true; // Email và mật khẩu hợp lệ
  }

}

import 'package:demo_mobile/presentation/login/login_controller.dart';
import 'package:demo_mobile/themes/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.color.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Image.asset(
                "assets/images/illustration.png",
                width: 300,
                height: 300,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Log In',
                  style: TextStyle(
                    color: Resources.color.hightlight,
                    fontSize: 32,
                    fontFamily: Resources.font.primaryFont,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  // controller: _emailController,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Resources.color.hightlight,
                    fontSize: 13,
                    fontFamily: Resources.font.primaryFont,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 175, 162, 135),
                      fontSize: 15,
                      fontFamily: Resources.font.primaryFont,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 134, 128, 115),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Resources.color.hightlight,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  // controller: _passController,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Resources.color.hightlight,
                    fontSize: 13,
                    fontFamily: Resources.font.primaryFont,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 175, 162, 135),
                      fontSize: 15,
                      fontFamily: Resources.font.primaryFont,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 134, 128, 115),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Resources.color.hightlight,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Center(
                    child: SizedBox(
                      width: 120,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.offAndToNamed('/dashboard');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Resources.color.hightlight,
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Resources.color.background,
                            fontSize: 15,
                            fontFamily: Resources.font.primaryFont,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: Resources.font.primaryFont,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 2.5,
                    ),
                    InkWell(
                      onTap: () {
                        // widget.controller.animateToPage(1,
                        //     duration: const Duration(milliseconds: 500),
                        //     curve: Curves.ease);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Resources.color.hightlight,
                          fontSize: 13,
                          fontFamily: Resources.font.primaryFont,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    // widget.controller.animateToPage(1,
                    //     duration: const Duration(milliseconds: 500),
                    //     curve: Curves.ease);
                  },
                  child: Center(
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: Resources.color.hightlight,
                        fontSize: 13,
                        fontFamily: Resources.font.primaryFont,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:demo_mobile/presentation/auth/auth_controller.dart';
import 'package:demo_mobile/themes/resources.dart';
import 'package:demo_mobile/utils/account_controller.dart';
import 'package:demo_mobile/utils/database_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<AuthController> {
  SignUpPage({Key? key}) : super(key: key);

  final AccountController accountController = Get.put(AccountController());
  final DatabaseController databaseController = Get.put(DatabaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.color.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Resources.color.hightlight,
                    fontSize: 32,
                    fontFamily: Resources.font.primaryFont,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: controller.nameController,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Resources.color.hightlight,
                    fontSize: 13,
                    fontFamily: Resources.font.primaryFont,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Name',
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
                  height: 20,
                ),
                TextField(
                  controller: controller.emailController,
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
                  height: 20,
                ),
                TextField(
                  controller: controller.phoneController,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Resources.color.hightlight,
                    fontSize: 13,
                    fontFamily: Resources.font.primaryFont,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Phone Numbers',
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
                  height: 20,
                ),
                Obx(
                  () => TextField(
                    controller: controller.passwordController,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Resources.color.hightlight,
                      fontSize: 13,
                      fontFamily: Resources.font.primaryFont,
                      fontWeight: FontWeight.w400,
                    ),
                    obscureText: controller.showPassword.value,
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Resources.color.hightlight,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.showPassword.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Resources.color.hightlight,
                        ),
                        onPressed: () {
                          controller.toggleObscureText();
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () {
                    return ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : () {
                              controller.registerUser(
                                  controller.emailController.text,
                                  controller.passwordController.text);
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Resources.color.hightlight,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      child: controller.isLoading.value
                          ? CircularProgressIndicator(
                              color: Resources.color.hightlight,
                            )
                          : Container(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: Get.width,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: controller.isLoading.value
                                      ? null
                                      : () async {
                                          await controller.registerUser(
                                              controller.emailController.text,
                                              controller
                                                  .passwordController.text);

                                          Map<String, dynamic> map = {
                                            'userId': 'unique()',
                                            'email':
                                                controller.emailController.text,
                                            'password': controller
                                                .passwordController.text,
                                            'name':
                                                controller.nameController.text,
                                            'phone':
                                                controller.phoneController.text,
                                          };
                                          await accountController
                                              .createAccount(map);

                                          Map<String, dynamic> data = {
                                            'name':
                                                controller.nameController.text,
                                            'email':
                                                controller.emailController.text,
                                            'password': controller
                                                .passwordController.text,
                                            'phone':
                                                controller.phoneController.text,
                                          };
                                          await databaseController
                                              .storeUserName(data);
                                        },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Resources.color.hightlight,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                  child: Text(
                                    'Sign Up',
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
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Or Register With',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 175, 162, 135),
                        fontSize: 15,
                        fontFamily: Resources.font.primaryFont,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    IconButton(
                      icon: Image.asset(
                        "assets/images/google.png",
                        width: 30,
                        height: 30,
                      ),
                      onPressed: () {
                        if (kDebugMode) {
                          print("google clicked");
                        }
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already Have Account?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 175, 162, 135),
                        fontSize: 15,
                        fontFamily: Resources.font.primaryFont,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 2.5,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed('/login');
                      },
                      child: Text(
                        'Login Now',
                        style: TextStyle(
                          color: Resources.color.hightlight,
                          fontSize: 15,
                          fontFamily: Resources.font.primaryFont,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

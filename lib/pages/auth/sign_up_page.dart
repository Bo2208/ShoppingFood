import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ban_hang/base/custom_loader.dart';
import 'package:shop_ban_hang/base/show_custom_snackbar.dart';
import 'package:shop_ban_hang/controllers/auth_controller.dart';
import 'package:shop_ban_hang/models/signup_body_model.dart';
import 'package:shop_ban_hang/routes/route_helper.dart';
import 'package:shop_ban_hang/utils/color.dart';
import 'package:shop_ban_hang/utils/dimensions.dart';
import 'package:shop_ban_hang/widgets/app_text_field.dart';
import 'package:shop_ban_hang/widgets/big_text.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var SignUpImages = ["twitter.png", "facebook.png", "google.png"];
    void _registration(AuthController authController) {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar("Type in your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type in your phone number", title: "Phone");
      } else if (email.isEmpty) {
        showCustomSnackBar("Type in your email address", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in a valid email address",
            title: "Valid email address");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password can not be less than six characters",
            title: "Password");
      } else {
        SignUpBody signUpBody = SignUpBody(
          name: name,
          phone: phone,
          email: email,
          password: password,
        );
        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            print("Success registration");
            Get.offNamed(RouteHelper.getInitial());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (_authController) {
          return !_authController.isLoading
              ? SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      //app logo
                      Container(
                        height: Dimensions.screenHeight * 0.25,
                        child: Center(
                          child: CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage("assets/image/Logo-food.png"),
                          ),
                        ),
                      ),
                      //Your Email
                      AppTextField(
                        textController: emailController,
                        hintText: "Email",
                        icon: Icons.email,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //Your Password
                      AppTextField(
                        textController: passwordController,
                        hintText: "Password",
                        icon: Icons.password_sharp,
                        isObscure: true,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //Your Name
                      AppTextField(
                        textController: nameController,
                        hintText: "Name",
                        icon: Icons.person,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //Your Phone
                      AppTextField(
                        textController: phoneController,
                        hintText: "Phone",
                        icon: Icons.phone,
                      ),
                      SizedBox(
                        height: Dimensions.height20 + Dimensions.height20,
                      ),
                      //sign up button
                      GestureDetector(
                        onTap: () {
                          _registration(_authController);
                        },
                        child: Container(
                          width: Dimensions.screenWidth / 2,
                          height: Dimensions.screenHeight / 13,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius30),
                              color: AppColors.mainColor),
                          child: Center(
                            child: BigText(
                              text: "Sign up",
                              size: Dimensions.font20 + Dimensions.font20 / 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      //tag line
                      RichText(
                        text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.back(),
                          text: "Have an account already?",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font20),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      //sign up options
                      RichText(
                        text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.back(),
                          text: "Sign up using one of the following methods",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font16),
                        ),
                      ),
                      Wrap(
                        children: List.generate(
                            3,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: Dimensions.radius30,
                                    backgroundImage: AssetImage(
                                        "assets/image/" + SignUpImages[index]),
                                  ),
                                )),
                      )
                    ],
                  ),
                )
              : const CustomLoader();
        }));
  }
}

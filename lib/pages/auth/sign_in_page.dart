import 'package:ecommerce/base/custom_loader.dart';
import 'package:ecommerce/base/show_custom_snackbar.dart';
import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:ecommerce/pages/auth/sign_up_page.dart';
import 'package:ecommerce/routes/route_helper.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/app_text_field.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    void login(AuthController authController) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      if (email.isEmpty) {
        showCustomSnackBar("Type in your email", title: "Email Required");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Your Email is Invalid", title: "Invalid Email");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password", title: "Password Required");
      } else if (password.length < 6) {
        showCustomSnackBar("Password should be atleast 6 characters",
            title: "Password Length");
      } else {
        authController.login(email, password).then((response) => {
              if (response.isSuccess)
                {Get.toNamed(RouteHelper.getInitial())}
              else
                {showCustomSnackBar(response.message)}
            });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(
        builder: (authController) {
          return !authController.isLoading
              ? SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      Container(
                        height: Dimensions.screenHeight * 0.25,
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: Dimensions.radius20 * 4,
                            backgroundImage: AssetImage(
                              "assets/images/logo.png",
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width20,
                        ),
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello",
                              style: TextStyle(
                                fontSize: Dimensions.font20 * 3 +
                                    Dimensions.font20 / 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Sign into your account",
                              style: TextStyle(
                                fontSize: Dimensions.font20,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      AppTextField(
                        textController: emailController,
                        hintText: "Email",
                        icon: Icon(
                          Icons.email,
                          color: AppColors.yellowColor,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      AppTextField(
                        textController: passwordController,
                        hintText: "Password",
                        isObscure: true,
                        icon: Icon(
                          Icons.password_sharp,
                          color: AppColors.yellowColor,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Sign into your account",
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimensions.font20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width20,
                          )
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      GestureDetector(
                        onTap: () {
                          login(authController);
                        },
                        child: Container(
                          width: Dimensions.screenWidth / 2,
                          height: Dimensions.screenHeight / 13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimensions.radius30,
                            ),
                            color: AppColors.mainColor,
                          ),
                          child: Center(
                            child: BigText(
                              text: "Sign in",
                              size: Dimensions.font20 + Dimensions.font20 / 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Don't have an account?",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font20,
                          ),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(
                                      () => SignUpPage(),
                                      transition: Transition.fade,
                                    ),
                              text: " Create",
                              style: TextStyle(
                                color: AppColors.mainBlackColor,
                                fontSize: Dimensions.font20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : const CustomLoader();
        },
      ),
    );
  }
}

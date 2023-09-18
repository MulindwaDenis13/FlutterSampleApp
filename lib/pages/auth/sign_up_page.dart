import 'package:ecommerce/base/custom_loader.dart';
import 'package:ecommerce/base/show_custom_snackbar.dart';
import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:ecommerce/models/signup_body_model.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/app_text_field.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:get/get.dart';
import 'package:ecommerce/routes/route_helper.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    List SignUpImages = ['twitter.jpeg', 'facebook.png', 'google.png'];

    void registration(AuthController authController) {
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String phone = phoneController.text.trim();

      if (email.isEmpty) {
        showCustomSnackBar("Type in your email", title: "Email Required");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password", title: "Password Required");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type in your Phone number",
            title: "Phone Required");
      } else if (name.isEmpty) {
        showCustomSnackBar("Type in your name", title: "Name Required");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Your Email is Invalid", title: "Invalid Email");
      } else if (password.length < 6) {
        showCustomSnackBar("Password should be atleast 6 characters",
            title: "Password Length");
      } else {
        // showCustomSnackBar("All is Ok", title: "Perfect");
        SignUpBody signUpBody = SignUpBody(
          email: email,
          password: password,
          name: name,
          phone: phone,
        );
        authController.registration(signUpBody).then((response) {
          if (response.isSuccess) {
            Get.offNamed(RouteHelper.getInitial());
          } else {
            showCustomSnackBar(response.message);
          }
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
                            backgroundImage: const AssetImage(
                              "assets/images/logo.png",
                            ),
                          ),
                        ),
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
                      AppTextField(
                        textController: nameController,
                        hintText: "Name",
                        icon: Icon(
                          Icons.person,
                          color: AppColors.yellowColor,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      AppTextField(
                        textController: phoneController,
                        hintText: "Phone",
                        icon: Icon(
                          Icons.phone,
                          color: AppColors.yellowColor,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height20 * 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          registration(authController);
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
                      RichText(
                        text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.back(),
                          text: "Have an account already?",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Sign up using one of the following methods!!",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font16,
                          ),
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
                                "assets/images/" + SignUpImages[index],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : const CustomLoader();
        },
      ),
    );
  }
}

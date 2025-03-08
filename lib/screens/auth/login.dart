// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:skill_swap_frontend/imports.dart';
import 'package:skill_swap_frontend/services/storage_service/my_shared_preference.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    Map<String, dynamic> credentials = {};
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(context) * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "SkillSwap",
                  style: AppTextStyles.heading(context).copyWith(
                    color: AppColors.text,
                    fontSize: getHeight(context) * 0.05,
                    decorationColor: AppColors.text,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(height: 0.02 * getHeight(context)),
                Text(
                  "Log in to your account",
                  style: AppTextStyles.body(context)
                      .copyWith(color: Colors.grey.shade600),
                ),

                SizedBox(height: 0.03 * getHeight(context)),

                // Email Field
                CustomTextField(
                    controller: emailController,
                    hintText: "Enter your email",
                    icon: Icons.email),

                SizedBox(height: 0.02 * getHeight(context)),

                // Password Field
                CustomTextField(
                    controller: passwordController,
                    hintText: "Enter your password",
                    icon: Icons.lock),

                SizedBox(height: 0.01 * getHeight(context)),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Forgot Password?",
                        style: AppTextStyles.body(context)
                            .copyWith(color: AppColors.primary)),
                  ),
                ),

                SizedBox(height: 0.02 * getHeight(context)),

                // Login Button
                CustomButton(
                  text: "Login",
                  onPressed: () async {
                    credentials = {
                      "email": emailController.text,
                      "password": passwordController.text,
                    };

                    await restClient.loginUser(credentials).then((value) async {
                      log(value.toString(), name: "Response");

                      if (value['status'] == 200) {
                        await MySharedPreference.setLoggedinStatus(true);
                        await MySharedPreference.setAuthToken(value['token']);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Logged in Successfully",
                              style: AppTextStyles.body(context).copyWith(
                                color: AppColors.white,
                              ),
                            ),
                            backgroundColor: AppColors.secondary,
                          ),
                        );

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      }
                    }).onError((error, stackTrace) {
                      log(error.toString(), name: "Error");
                    });

                    log("API CALLED", name: "LOGIN API");
                  },
                ),

                SizedBox(height: 0.02 * getHeight(context)),

                // Sign Up Option
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style: AppTextStyles.body(context)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                      child: Text("Sign Up",
                          style: AppTextStyles.body(context).copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:skill_swap_frontend/screens/auth/sign_up.dart';
import 'package:skill_swap_frontend/widgets/custom_button.dart';
import 'package:skill_swap_frontend/widgets/custom_text_field.dart';
import '../../responsive.dart';
import '../../theme.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(context) * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image.asset("assets/images/login.png"),
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
                CustomButton(text: "Login"),

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

// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:skill_swap_frontend/imports.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    Map<String, dynamic> userData = {};

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
                  "Create an account",
                  style: AppTextStyles.body(context)
                      .copyWith(color: Colors.grey.shade600),
                ),

                SizedBox(height: 0.03 * getHeight(context)),

                // Name Field
                CustomTextField(
                    controller: nameController,
                    hintText: "Enter your name",
                    icon: Icons.person),

                SizedBox(height: 0.02 * getHeight(context)),

                // Email Field
                CustomTextField(
                    controller: emailController,
                    hintText: "Enter your email",
                    icon: Icons.email),

                SizedBox(height: 0.02 * getHeight(context)),

                // Password Field
                CustomTextField(
                    controller: passwordController,
                    hintText: "Create password",
                    icon: Icons.lock),

                SizedBox(height: 0.03 * getHeight(context)),

                // Login Button
                CustomButton(
                  text: "Signup",
                  onPressed: () async {
                    // Adding data into body
                    userData = {
                      "name": nameController.text,
                      "email": emailController.text,
                      "password": passwordController.text,
                    };

                    // API Call
                    await restClient.signInUser(userData).then((value) async {
                      log(value.toString(), name: "Response");

                      if (value['status'] == 201) {
                        await MySharedPreference.setLoggedinStatus(true);
                        await MySharedPreference.setUserName(
                            nameController.text);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Registered Successfully",
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
                  },
                ),

                SizedBox(height: 0.02 * getHeight(context)),

                // Sign Up Option
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                        style: AppTextStyles.body(context)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text("Login",
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

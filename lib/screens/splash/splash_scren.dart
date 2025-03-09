// ignore_for_file: use_build_context_synchronously
import 'package:skill_swap_frontend/imports.dart';

class SplashScren extends StatefulWidget {
  const SplashScren({super.key});

  @override
  State<SplashScren> createState() => _SplashScrenState();
}

class _SplashScrenState extends State<SplashScren> {
  void checkUserStatus() async {
    var isLoggedIn = await MySharedPreference.getLoggedinStatus();
    String userEmail = await MySharedPreference.getUserEmail();

    await Future.delayed(Duration(seconds: 4)); // Simulate splash delay

    if (isLoggedIn) {
      // User is already logged in → Go to Home Screen
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomeScreen()));
    } else {
      if (userEmail != "") {
        // User has previously signed up → Go to Login Screen
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Login()));
      } else {
        // User is completely new → Go to Sign Up Screen
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Signup()));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: AnimateList(
          children: [
            Center(
              child: Text(
                "SkillSwap",
                style: AppTextStyles.heading(context).copyWith(
                  color: AppColors.white,
                  fontSize: getHeight(context) * 0.05,
                ),
              ),
            ),
            Lottie.asset(
              "assets/lottie/loading_dots.json",
            ),
          ],
          interval: Duration(seconds: 1),
          autoPlay: true,
          effects: [FadeEffect(duration: 1000.ms)],
        ),
      ),
    );
  }
}

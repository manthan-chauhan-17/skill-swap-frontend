import 'package:skill_swap_frontend/imports.dart';

class SplashScren extends StatefulWidget {
  const SplashScren({super.key});

  @override
  State<SplashScren> createState() => _SplashScrenState();
}

class _SplashScrenState extends State<SplashScren> {
  loginCheck() async {
    await Future.delayed(const Duration(seconds: 4)).then((value) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Login()), (route) => false);
    });
  }

  @override
  void initState() {
    super.initState();
    loginCheck();
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

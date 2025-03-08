import 'package:skill_swap_frontend/imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SkillSwap")),
      body: Center(child: Text("Welcome to SkillSwap!")),
    );
  }
}

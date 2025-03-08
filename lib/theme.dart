import 'imports.dart';

class AppColors {
  static const Color primary = Color(0xFF483D8B); // Dark Slate Blue
  static const Color secondary = Color(0xFF8E44AD); // Amethyst
  static const Color background = Color(0xFFF5F5FA); // Soft Lavender White
  static const Color button = Color(0xFFE67E22); // Vivid Orange
  static const Color text = Color(0xFF323232); // Deep Charcoal
  static const Color white = Color(0xffffffff);
}

class AppTextStyles {
  static TextStyle heading(BuildContext context) => GoogleFonts.playfairDisplay(
        fontSize: getHeight(context) * 0.03,
        fontWeight: FontWeight.bold,
        color: AppColors.text,
      );

  static TextStyle body(BuildContext context) => GoogleFonts.lora(
        fontSize: getHeight(context) * 0.018,
        color: AppColors.text,
      );

  static TextStyle button(BuildContext context) => GoogleFonts.merriweatherSans(
        fontSize: getHeight(context) * 0.022,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );
}

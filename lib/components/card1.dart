part of 'home_page.dart';

class Card1 extends StatelessWidget {
  const Card1({super.key, required this.icon,
    required this.text, required this.isFemale});
  final IconData icon;
  final String text;
  final bool isFemale;

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Icon(icon, size: 80, color: !isFemale ? AppColor.grColor : null),            
            Text(text, style: AppTextStyle.maleTextStyle),
          ],
    );
  }
}
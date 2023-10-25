part of 'home_page.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({Key? key, required this.onTap}) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        color: AppColor.redColor,
        child: const Center(
          child: Text(AppText.calculate, style: AppTextStyle.calcTextStyle),
        ),
      ),
    );
  }
}
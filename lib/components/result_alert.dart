part of 'home_page.dart';

Future<void> showMyDialog(BuildContext context, String text) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: AppColor.bgColor,
      title: const Center(
        child: Text(AppText.appBarTitle, style: AppTextStyle.calcTextStyle),
      ),
      content: Text(text, style: AppTextStyle.calcTextStyle,
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(AppText.backButton),
        ),
      ],
    ),
  );
}
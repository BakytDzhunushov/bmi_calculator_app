part of 'home_page.dart';

class Card2 extends StatelessWidget {
  const Card2({super.key,
      required this.text,
      required this.value,
      required this.remove,
      required this.add});
  final String text;
  final int value;
  final void Function(int) remove;
  final void Function(int) add;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: AppTextStyle.weightTextStyle),
        Text('$value', style: AppTextStyle.rostTextStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RemovAdd(
                iconData: Icons.remove, onPressed: () => remove(value - 1)),
            const SizedBox(width: 10),
            RemovAdd(iconData: Icons.add, onPressed: () => remove(value + 1)),
          ],
        ),
      ],
    );
  }
}

class RemovAdd extends StatelessWidget {
  const RemovAdd({Key? key, required this.iconData, required this.onPressed})
      : super(key: key);

  final IconData iconData;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      hoverColor: AppColor.glColor,
      splashColor: AppColor.redColor,
      foregroundColor: AppColor.whColor,
      onPressed: onPressed,
      tooltip: 'Сhange',
      backgroundColor: AppColor.ggColor,
      child: Icon(iconData, size: 30),
    );
  }
}
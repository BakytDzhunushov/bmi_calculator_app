part of 'home_page.dart';

class CardHeight extends StatelessWidget {
  const CardHeight({Key? key, required this.onChanged, 
  required this.height}):super(key: key);

  final int height;
  final void Function(double) onChanged;
 
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(AppText.height, style: AppTextStyle.weightTextStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('$height', style: AppTextStyle.rostTextStyle),
              Text(AppText.cm, style: AppTextStyle.cmTextStyle),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: CupertinoSlider(
                activeColor: AppColor.whColor,                
                thumbColor: AppColor.redColor,
                value: height.toDouble(),
                min: 40,
                max: 240,
                divisions: 200,                
                onChanged: onChanged,
                  ),               
              ),
            ),          
        ],      
    );
  }
}
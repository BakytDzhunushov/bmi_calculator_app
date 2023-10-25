import 'package:bmi_calculator_app/components/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'utils/app_text.dart';
import 'utils/text_style.dart';
import 'dart:math' as math;
part 'card1.dart';
part 'card2.dart';
part 'card_height.dart';
part 'result_alert.dart';
part 'calculate_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 bool isFemale = false;
 int height = 180;
  int weight = 60;
  int age = 28;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        backgroundColor: AppColor.bgColor,
        centerTitle: true,
        title: const Text(
          AppText.appBarTitle,
          style: AppTextStyle.calcTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: Row(children: [
                StatusCard(child: InkWell(
                  onTap: () {setState(() {isFemale = false;});},
                  child: Card1(icon: Icons.male, 
                  text: AppText.male, isFemale: !isFemale),
                ),),
                const SizedBox(width: 20),
                StatusCard(child: InkWell(
                  onTap: () {setState(() {isFemale = true;});},
                  child: Card1(icon: Icons.female, 
                  text: AppText.female, isFemale: isFemale),),),
              ]),
            ),
            const SizedBox(height: 10),
            StatusCard(
              child: CardHeight(
                height: height,
                onChanged: (val) {setState(() {
                  height = val.toInt();
                });}
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Row(children: [
                StatusCard(child: Card2(
                  text: AppText.weight, value: weight,
                  add: (c) {setState(() {
                    weight = c; });},
                  remove: (c) {setState(() {
                    weight = c; });},
                    )),                
                const SizedBox(width: 20),
                StatusCard(child: Card2(
                  text: AppText.age, value: age,
                  add: (c) {setState(() {
                    age = c; });},
                  remove: (c) {setState(() {
                    age = c; });},
                    )),
              ]),
            ),
          ],
        ),
      ),      
       bottomNavigationBar: CalculateButton(
        onTap: () {
          final res = weight / math.pow(height / 100, 2);
          if (res < 16.0) {
            showMyDialog(context, AppText.thin);
             } else if (res >= 16.0 && res <= 18.5) {
            showMyDialog(context, AppText.thinin);
          } else if (res >= 18.6 && res <= 25.0) {
            showMyDialog(context, AppText.normal);
          } else if (res >= 25.1 && res <= 30.0) {
            showMyDialog(context, AppText.fat);
          } else {
            showMyDialog(context, AppText.sorry);
          }
        },
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  const StatusCard({Key? key, required this.child,})
    :super(key: key); 
 
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Card(color: AppColor.blColor, child: child));
  }
}
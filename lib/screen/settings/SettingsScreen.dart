import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color/Color.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 10000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: maxNumber
                        .toInt()
                        .toString()
                        .split('')
                        .map((e) => Image.asset(
                              'assets/img/$e.png',
                              height: 70,
                              width: 50,
                            ))
                        .toList(),
                  ),
                ),
                Slider(
                  value: maxNumber,
                  min: 10000,
                  max: 1000000,
                  onChanged: (double val) {
                    setState(() {
                      maxNumber = val;
                    });
                  },
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: RED_COLOR),
                        onPressed: () {},
                        child: Text('저장!')))
              ],
            ),
          ),
        ));
  }
}

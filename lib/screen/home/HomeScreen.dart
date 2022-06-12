import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color/Color.dart';
import 'package:random_number_generator/screen/settings/SettingsScreen.dart';
import 'package:random_number_generator/util/Utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randomNumbers = [123, 456, 789];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(),
              _Body(
                randomNumbers: randomNumbers,
              ),
              // 버튼의 사이즈를 양 끝으로 늘리는 방법
              // 1. SizedBox 로 감싼 후 width 를 double.infinity 속성을 부여한다
              // 2. 전체를 Row로 감싼 후 안의 내용을 Expanded로 감싼다
              // 3. Container로 감싼 후 width 를 double.infinity 속성을 부여한다
              _Footer(onPressed: onRandomNumberGenerate)
            ],
          ),
        ),
      ),
    );
  }

  void onRandomNumberGenerate() {
    final rand = Random();

    final Set<int> newNumbers = {};

    while (newNumbers.length != 3) {
      final number = rand.nextInt(1000);

      newNumbers.add(number);
    }

    setState(() {
      randomNumbers = newNumbers.toList();
    });
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '랜덤숫자 생성기',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
        ),
        IconButton(
          onPressed: () {
            // 화면 이동하는 네비게이션
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) {
                return SettingsScreen();
              },
            ));
          },
          icon: const Icon(
            Icons.settings,
            color: RED_COLOR,
          ),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> randomNumbers;

  _Body({required this.randomNumbers, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: randomNumbers
            .asMap()
            .entries
            .map((e) => Padding(
                  padding: EdgeInsets.only(bottom: e.key == 2 ? 0 : 16),
                  child: Row(
                    children: e.value
                        .toString()
                        .split('')
                        .map((e) => Image.asset(
                              'assets/img/$e.png',
                              height: 70,
                              width: 50,
                            ))
                        .toList(),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;

  _Footer({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: RED_COLOR),
        onPressed: onPressed,
        child: const Text('생성하기'),
      ),
    );
  }
}

class _Lotto extends StatelessWidget {
  const _Lotto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Set<int> numbers = {};

    while (numbers.length != 6) {
      numbers.add(Utils().generateRandom(1, 45));
    }

    List<int> newNumbers = numbers.toList();
    newNumbers.sort();

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: numbers
            .map((x) => Row(
                  children: x
                      .toString()
                      .split('')
                      .map((y) => Image.asset(
                            'assets/img/$y.png',
                            height: 25,
                            width: 25,
                          ))
                      .toList(),
                ))
            .toList());
  }
}

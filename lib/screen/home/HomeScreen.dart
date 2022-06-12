import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color/Color.dart';
import 'package:random_number_generator/util/Utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget lottos = _Lotto();

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '로또 번호 생성기',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                      color: RED_COLOR,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    lottos
                  ],
                ),
              ),
              // 버튼의 사이즈를 양 끝으로 늘리는 방법
              // 1. SizedBox 로 감싼 후 width 를 double.infinity 속성을 부여한다
              // 2. 전체를 Row로 감싼 후 안의 내용을 Expanded로 감싼다
              // 3. Container로 감싼 후 width 를 double.infinity 속성을 부여한다
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: RED_COLOR),
                  onPressed: () {
                    setState(() {
                      lottos = _Lotto();
                    });
                  },
                  child: const Text('생성하기'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Lotto extends StatelessWidget {
  const _Lotto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> numbers = [];
    int i = 6;

    while (i > 0) {
      int getNum = Utils().generateRandom(1, 45);
      if (!numbers.contains(getNum)) {
        numbers.add(getNum);
        --i;
      }
    }

    numbers.sort();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: numbers.map((x) =>
        Row(
          children: x
            .toString()
            .split('')
            .map((y) => Image.asset(
            'assets/img/$y.png',
            height: 25,
            width: 25,
          )).toList(),
        )
      ).toList()
    );
  }
}

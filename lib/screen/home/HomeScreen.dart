import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color/Color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  Text(
                    '랜덤숫자 생성기',
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('123'), Text('456'), Text('789')],
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
                  onPressed: () {},
                  child: Text('생성하기'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

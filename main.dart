import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//statefulwidget 위잿 그 자체
class MyApp extends StatefulWidget {
  //StatelessWidget은 상태가 변하지않는 보여주는 ui의 위잿
  //StatefulWidget은 데이터를 주고받을때 씀 state는 데이터를 주고받는곳
  //StatefulWidget은 두부분으로 나뉘어짐  하나는 상태가 없는 위잿, 다른하나는 데이터와 ui를 넣는곳
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

//

//우리 ui를 구축하는곳 데이터를 변경해서 ui를 변경함?
class _MyAppState extends State<MyApp> {
  int counter = 0;
  List<int> numbers = [];

  void onClicked() {
    setState(() {
      //setState는 사용자가 행동을 해서 데이터가 바뀌었다는걸 알려줌 안쓰면 작동을 안함
      counter = counter + 1;
      numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 239, 227, 196),
          body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'Click Count',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                '$counter',
                style: const TextStyle(fontSize: 40),
              ),
              for (var n in numbers) Text('$n'),
              IconButton(
                //아이콘버튼은 두가지를 요구함 하나는 버튼이 눌릴때마다 실행될 함수, 그리고 아이콘
                iconSize: 40,
                onPressed: onClicked,
                icon: const Icon(Icons.add_box_rounded),
              ),
            ]),
          )),
    );
  }
}

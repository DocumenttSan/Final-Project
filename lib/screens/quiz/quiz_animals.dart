import 'package:appnedic/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class QuizAnimals extends StatefulWidget {
  const QuizAnimals({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class Quiz {
  String que; //Question
  int queHasImg; //ถ้ามีรูป กด1 ถ้าไม่มี กด0
  String imageQue; //ใส่ที่อยู่ของรูป คำถาม
  List<String> ans; //ช้อยส์4ข้อ ใส่แบบนี้นะ ['1','2','3','4']
  int ansHasImg; //ถ้ามีรูป กด1 ถ้าไม่มี กด0
  List<String> imageAns; //ใส่ที่อยู่ของรูป ช้อยส์
  int rightAns; //คำตอบที่ถูกต้อง

  Quiz(this.que, this.queHasImg, this.imageQue, this.ans, this.ansHasImg,
      this.imageAns, this.rightAns);
}

var queList = [
  Quiz(
      //ที่ใส่คำถามแต่ละข้อ ช้อยรูป
      "สัตว์ชนิดใดคือสิงโต\nWhich picture is a lion?",
      0,
      '',
      ['1', '2', '3', '4'],
      1,
      [
        'assets/images/animals/lion.png',
        'assets/images/animals/chicken.png',
        'assets/images/animals/tiger.png',
        'assets/images/animals/shark.png'
      ],
      1),
  Quiz(
      //ที่ใส่คำถามแต่ละข้อ คำถามรูป
      "สัตว์ชนิดเรียกว่าอะไร\nWhat is this animal called?",
      1,
      'assets/images/animals/tiger.png',
      ['1.Tiger', '2.Zebra', '3.Rabbit', '4.Turtle'],
      0,
      ['', '', '', ''],
      1),
  Quiz(
      //ที่ใส่คำถามแต่ละข้อ ช้อยรูป
      "สัตว์ชนิดใดคือกระต่าย\nWhich animal is a rabbit?",
      0,
      '',
      ['1', '2', '3', '4'],
      1,
      [
        'assets/images/animals/rooster.png',
        'assets/images/animals/chicken.png',
        'assets/images/animals/rabbit.png',
        'assets/images/animals/hen.png'
      ],
      3),
  Quiz(
      //ที่ใส่คำถามแต่ละข้อ ช้อยรูป
      "สัตว์ชนิดใดคือฉลาม\nWhich animal is a shark?",
      0,
      '',
      ['1', '2', '3', '4'],
      1,
      [
        'assets/images/animals/elephant.png',
        'assets/images/animals/shark.png',
        'assets/images/animals/crocodile.png',
        'assets/images/animals/seal.png'
      ],
      2),
  Quiz(
      //ที่ใส่คำถามแต่ละข้อ คำถามรูป
      "สัตว์ชนิดเรียกว่าอะไร\nWhat is this animal called?",
      1,
      'assets/images/animals/elephant.png',
      ['1.Hen', '2.Giraffe', '3.Lion', '4.Elephant'],
      0,
      ['', '', '', ''],
      4),
  Quiz(
      //ที่ใส่คำถามแต่ละข้อ คำถามรูป
      "สัตว์ชนิดเรียกว่าอะไร\nWhat is this animal called?",
      1,
      'assets/images/animals/giraffe.png',
      ['1.Giraffe', '2.Crocodile', '3.Penguin', '4.Whale'],
      0,
      ['', '', '', ''],
      1),
  Quiz(
      //ที่ใส่คำถามแต่ละข้อ ช้อยรูป
      "สัตว์ชนิดใดคือจระเข้\nWhich animal is a crocodile?",
      0,
      '',
      ['1', '2', '3', '4'],
      1,
      [
        'assets/images/animals/crocodile.png',
        'assets/images/animals/rooster.png',
        'assets/images/animals/tiger.png',
        'assets/images/animals/turtle.png'
      ],
      1),
  Quiz(
      //ที่ใส่คำถามแต่ละข้อ คำถามรูป
      "สัตว์ชนิดเรียกว่าอะไร\nWhat is this animal called?",
      1,
      'assets/images/animals/snake.png',
      ['1.Rabbit', '2.Zebra', '3.Rooster', '4.Snake'],
      0,
      ['', '', '', ''],
      4),
  Quiz(
      //ที่ใส่คำถามแต่ละข้อ คำถามรูป
      "สัตว์ชนิดเรียกว่าอะไร\nWhat is this animal called?",
      1,
      'assets/images/animals/rooster.png',
      ['1.Hen', '2.Snake', '3.Rooster', '4.Chicken'],
      0,
      ['', '', '', ''],
      3),
  Quiz(
      //ที่ใส่คำถามแต่ละข้อ คำถามรูป
      "สัตว์ชนิดเรียกว่าอะไร\nWhat is this animal called?",
      1,
      'assets/images/animals/turtle.png',
      ['1.Seal', '2.Turtle', '3.Rabbit', '4.Whale'],
      0,
      ['', '', '', ''],
      2),
];

class _HomeState extends State<QuizAnimals>
    with SingleTickerProviderStateMixin {
  int _totalQue = 0;
  int _currentQue = 0;
  bool isClicked = false;
  bool nextisClick = false;

  int rightAnsScore = 0;

  late Quiz _currentQuiz;

  String img_tick = 'assets/images/check.png';
  String img_worng = 'assets/images/close.png';

  final CountdownController _controller =
      new CountdownController(autoStart: true);

  @override
  void initState() {
    _totalQue = queList.length;
    _currentQue = 0;
    _currentQuiz = queList[_currentQue];
    super.initState();
  }

  _changeButton() {
    return _currentQue == _totalQue - 1
        ? ElevatedButton(
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      title: Text('Your Score'),
                      content: Text('${rightAnsScore} / ${_totalQue}'),
                      actions: [
                        ElevatedButton(
                            onPressed: () => Navigator.pop(context, 'cancel'),
                            child: Text('Cancel')),
                        ElevatedButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home())),
                            child: Text('Back to Home'))
                      ],
                    )),
            child: Text('Finish'),
          )
        : ElevatedButton(
            onPressed: () {
              _changeQue();
            },
            child: Text('Next Question'),
          );
  }

  _scoreText() {
    return Text(
      'Total right Question $rightAnsScore / $_totalQue',
      style: TextStyle(fontSize: 18, color: Colors.black54),
    );
  }

  _qustionCard(question, hasimg, image) {
    if (hasimg == 0) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                '(${_currentQue + 1}) $question',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                '(${_currentQue + 1}) $question',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.blue,
                ),
              ),
              Image.asset(
                '$image',
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
      );
    }
  }

  _ansBtn(ans, hasimg, imgans, action, rightAns) {
    if (hasimg == 0) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        onPressed: isClicked
            ? _controller.pause()
            : () {
                setState(() {
                  isClicked = true;
                });
                if (ans == _currentQuiz.ans[rightAns - 1]) {
                  rightAnsScore++;
                }
              },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(
                '$ans',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              isClicked
                  ? Container(
                      height: 20,
                      width: 20,
                      child: _currentQuiz.ans[rightAns - 1] == ans
                          ? Image.asset(
                              img_tick,
                            )
                          : Image.asset(
                              img_worng,
                            ),
                    )
                  : Container(),
            ],
          ),
        ),
      );
    } else {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        onPressed: isClicked
            ? null
            : () {
                setState(() {
                  isClicked = true;
                });
                if (ans == _currentQuiz.ans[rightAns - 1]) {
                  rightAnsScore++;
                }
              },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(
                '$ans',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Image.asset(
                '$imgans',
                width: 100,
                height: 100,
              ),
              Spacer(),
              isClicked
                  ? Container(
                      height: 20,
                      width: 20,
                      child: ans == _currentQuiz.ans[rightAns - 1]
                          ? Image.asset(
                              img_tick,
                            )
                          : Image.asset(
                              img_worng,
                            ),
                    )
                  : Container(),
            ],
          ),
        ),
      );
    }
  }

  _changeQue() {
    if (_currentQue == _totalQue - 1) {
      print('Game Over');
    } else {
      isClicked = false;

      _currentQue++;
      _currentQuiz = queList[_currentQue];
      _controller.restart();
      setState(() {});
    }
  }

  _checkimgque() {
    if (_currentQuiz.imageQue.trim() != '') {
      return Column(
        children: [
          Text('${_currentQuiz.que}'),
          Image.asset(
            '${_currentQuiz.imageQue}',
            width: 100,
            height: 100,
          ),
        ],
      );
    } else {
      return Text('${_currentQuiz.que}');
    }
  }

  _checkimgans() {
    if (_currentQuiz.imageAns[_currentQuiz.rightAns - 1].trim() != '') {
      return Column(
        children: [
          Text('Answer is :  ${_currentQuiz.ans[_currentQuiz.rightAns - 1]}'),
          Image.asset(
            '${_currentQuiz.imageAns[_currentQuiz.rightAns - 1]}',
            width: 100,
            height: 100,
          ),
        ],
      );
    } else {
      return Text(
          'Answer is :  ${_currentQuiz.ans[_currentQuiz.rightAns - 1]}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade500,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade400,
        title: Text('Animals Quiz'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 10,
            ),
            Countdown(
              controller: _controller,
              seconds: 15,
              build: (BuildContext context, double time) => Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromARGB(255, 19, 42, 65),
                        Color.fromARGB(255, 39, 77, 99)
                      ]),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    '${time.toInt()} seconds left!!',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              interval: Duration(milliseconds: 100),
              onFinished: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: Text('Times up!!!'),
                          content: Container(
                            height: 200,
                            child: Column(
                              children: [
                                _checkimgque(),
                                _checkimgans(),
                              ],
                            ),
                          ),
                          actions: [
                            _currentQue == _totalQue - 1
                                ? ElevatedButton(
                                    onPressed: () => showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                              title: Text('Your Score'),
                                              content: Text(
                                                  '${rightAnsScore} / ${_totalQue}'),
                                              actions: [
                                                ElevatedButton(
                                                    onPressed: () =>
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        Home())),
                                                    child: Text('Back to Home'))
                                              ],
                                            )),
                                    child: Text('Finish'),
                                  )
                                : ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      _changeQue();
                                    },
                                    child: Text('Next Question'))
                          ],
                        ));
              },
            ),
            SizedBox(
              height: 10,
            ),
            _scoreText(),
            SizedBox(
              height: 10,
            ),
            _qustionCard(_currentQuiz.que, _currentQuiz.queHasImg,
                _currentQuiz.imageQue),
            SizedBox(
              height: 30,
            ),
            _ansBtn(_currentQuiz.ans[0], _currentQuiz.ansHasImg,
                _currentQuiz.imageAns[0], () {}, _currentQuiz.rightAns),
            SizedBox(
              height: 2,
            ),
            _ansBtn(_currentQuiz.ans[1], _currentQuiz.ansHasImg,
                _currentQuiz.imageAns[1], () {}, _currentQuiz.rightAns),
            SizedBox(
              height: 2,
            ),
            _ansBtn(_currentQuiz.ans[2], _currentQuiz.ansHasImg,
                _currentQuiz.imageAns[2], () {}, _currentQuiz.rightAns),
            SizedBox(
              height: 2,
            ),
            _ansBtn(_currentQuiz.ans[3], _currentQuiz.ansHasImg,
                _currentQuiz.imageAns[3], () {}, _currentQuiz.rightAns),
            SizedBox(
              height: 2,
            ),
            Spacer(),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                _changeButton(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

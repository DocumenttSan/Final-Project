import 'package:flutter/material.dart';
import 'package:appnedic/screens/home.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class QuizBody extends StatefulWidget {
  const QuizBody({super.key});

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
      //ที่ใส่คำถามแต่ละข้อ คำถามรูป
      "อวัยวะนี้เรียกว่าอะไร\nWhat is this organ called?",
      1,
      'assets/images/body/foot.png',
      ['1.Arm', '2.Hair', '3.Foot', '4.Leg'],
      0,
      ['', '', '', ''],
      3),
  Quiz(
      //ที่ใส่คำถามแต่ละข้อ คำถามรูป
      "อวัยวะนี้เรียกว่าอะไร\nWhat is this organ called?",
      1,
      'assets/images/body/hand.png',
      ['1.Hand', '2.Hair', '3.Head', '4.Kneen'],
      0,
      ['', '', '', ''],
      1),
  Quiz(
      //ที่ใส่คำถามแต่ละข้อ คำถามรูป
      "ฉันใช้อวัยวะใดในการกินข้าว\nWhich organ does you use to eat?",
      0,
      ' ',
      ['1.Nose', '2.Mouth', '3.Eye', '4.Foot'],
      0,
      ['', '', '', ''],
      2),
  Quiz(
      //ที่ใส่คำถามแต่ละข้อ คำถามรูป
      "อวัยวะนี้เรียกว่าอะไร\nWhat is this organ called?",
      1,
      'assets/images/body/nose.png',
      ['1.Nose', '2.Neck', '3.Face', '4.Ear'],
      0,
      ['', '', '', ''],
      1),
  Quiz(
      //ที่ใส่คำถามแต่ละข้อ คำถามรูป
      "อวัยวะนี้เรียกว่าอะไร\nWhat is this organ called?",
      1,
      'assets/images/body/ear.png',
      ['1.Arm', '2.Face', '3.Eye', '4.Ear'],
      0,
      ['', '', '', ''],
      4),
  Quiz(
      //ที่ใส่คำถามแต่ละข้อ คำถามรูป
      "อวัยวะนี้เรียกว่าอะไร\nWhat is this organ called?",
      1,
      'assets/images/body/face.png',
      ['1.Arm', '2.Face', '3.Eye', '4.Ear'],
      0,
      ['', '', '', ''],
      2),
  Quiz(
      //ที่ใส่คำถามแต่ละข้อ คำถามรูป
      "อวัยวะนี้เรียกว่าอะไร\nWhat is this organ called?",
      1,
      'assets/images/body/shoulder.png',
      ['1.Nose', '2.Shoulder', '3.Neck', '4.Mouth'],
      0,
      ['', '', '', ''],
      2),
  Quiz(
      //ที่ใส่คำถามแต่ละข้อ คำถามรูป
      "อวัยวะนี้เรียกว่าอะไร\nWhat is this organ called?",
      1,
      'assets/images/body/arm.png',
      ['1.Nose', '2.Leg', '3.Foot', '4.Arm'],
      0,
      ['', '', '', ''],
      4),
  Quiz(
      //ที่ใส่คำถามแต่ละข้อ คำถามรูป
      "อวัยวะใดที่ฉันใช้ในการมอง\nWhich organ does you use to see?",
      1,
      'assets/images/body/eye.png',
      ['1.Eye', '2.Knee', '3.Neck', '4.Mouth'],
      0,
      ['', '', '', ''],
      1),
  Quiz(
      //ที่ใส่คำถามแต่ละข้อ คำถามรูป
      "อวัยวะนี้เรียกว่าอะไร\nWhat is this organ called?",
      1,
      'assets/images/body/neck.png',
      ['1.Hair', '2.Hand', '3.Neck', '4.Hend'],
      0,
      ['', '', '', ''],
      3),
];

class _HomeState extends State<QuizBody> with SingleTickerProviderStateMixin {
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
      backgroundColor: Colors.pinkAccent.shade100, //
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Body Quiz'),
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
                        Color.fromARGB(255, 196, 131, 58),
                        Color.fromARGB(255, 143, 73, 33)
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

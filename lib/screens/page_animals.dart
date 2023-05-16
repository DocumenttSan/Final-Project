import 'package:appnedic/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageAnimals extends StatefulWidget {
  const PageAnimals({super.key});

  @override
  State<PageAnimals> createState() => _PageAnimalsState();
}

class _PageAnimalsState extends State<PageAnimals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            );
          },
          icon: Icon(Icons.chevron_left),
        ),
        title: Text(
          'Animals',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 36,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          getPageContainer(
              0, 'lion.png', 'Lion', 'ไล-ออน \n สิงโต', Colors.orange.shade300),
          getPageContainer(1, 'elephant.png', 'Elephant',
              'เอล-ละเฟินท์ \n ช้าง', Colors.grey),
          getPageContainer(
              2, 'tiger.png', 'Tiger', 'ไท๊-เกอะ \n เสือ', Colors.red.shade500),
          getPageContainer(3, 'giraffe.png', 'Giraffe', 'เจอะ-ร๊าฟ \n จีราฟ',
              Colors.orange.shade200),
          getPageContainer(4, 'whale.png', 'Whale', 'เวล \n วาฬ',
              Colors.blueAccent.shade100),
          getPageContainer(
              5, 'shark.png', 'Shark', 'ชาค \n ฉลาม', Colors.blue.shade500),
          getPageContainer(6, 'turtle.png', 'Turle', 'เท็ล-เทิล \n เต่า',
              Colors.green.shade400),
          getPageContainer(7, 'crocodile.png', 'Crocodile',
              'คร็อก-คะ-ได \n จระเข้', Colors.lightGreen.shade900),
          getPageContainer(8, 'snake.png', 'Snake', 'สเนค \n งู',
              Colors.greenAccent.shade200),
          getPageContainer(9, 'zebra.png', 'Zebra', 'ซี-บระ \n ม้าลาย',
              Colors.blueGrey.shade400),
          getPageContainer(10, 'chicken.png', 'Chicken', 'ชิค-คิน \n ลูกไก่',
              Colors.yellowAccent.shade700),
          getPageContainer(
              11, 'hen.png', 'Hen', 'เฮ็น \n แม่ไก่', Colors.yellow.shade800),
          getPageContainer(12, 'rooster.png', 'Rooster',
              'รู๊ส-เตอะ \n ไก่ตัวผู้', Colors.yellow.shade900),
          getPageContainer(13, 'rabbit.png', 'Rabbit', 'แร็บ-บิท \n กระต่าย',
              Colors.white70),
          getPageContainer(
              14, 'seal.png', 'Seal', 'ซีล \n แมวน้ำ', Colors.grey.shade500),
          getPageContainer(15, 'penguin.png', 'Penguin',
              'เพ็น-กวิน \n นกเพนกวิน', Colors.blueGrey.shade700),
        ],
      ),
    );
  }

  Container getPageContainer(
      int id, String imgName, String title, String subtext, Color colorx) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: colorx,
      ),
      margin: EdgeInsets.only(left: 50, right: 15, top: 25),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: -65,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Image(
                image: AssetImage('assets/images/animals/$imgName'), //image
                height: MediaQuery.of(context).size.height / 4.5,
              ),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      child: Text(
                        title, //title ชื่อ
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 36,
                        ),
                      ),
                      margin: EdgeInsets.only(left: 100, top: 20),
                    ),
                  ],
                ),
                Container(
                  child: Text(
                    subtext, //subtext คำแปล ความหมาย
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  margin: EdgeInsets.only(left: 50, top: 15),
                  // padding: EdgeInsets.only(top: 5),
                ),
              ],
            ),
          ),
        ],
        clipBehavior: Clip.none,
      ),
    );
  }
}

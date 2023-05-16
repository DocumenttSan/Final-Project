import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appnedic/screens/home.dart';

class PageBody extends StatefulWidget {
  const PageBody({super.key});

  @override
  State<PageBody> createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
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
                builder: (context) => const Home(), //เปลี่ยน
              ),
            );
          },
          icon: Icon(Icons.chevron_left),
        ),
        title: Text(
          'Body',
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
              0, 'arm.png', 'Arm', 'อาม \nแขน', Colors.orangeAccent.shade100),
          getPageContainer(
              1, 'ear.png', 'Ears', 'เอีย \nหู', Colors.yellow.shade300),
          getPageContainer(
              2, 'eye.png', 'Eye', 'อาย \nตา', Colors.red.shade300),
          getPageContainer(
              3, 'face.png', 'Face', 'เฟส \nหน้า', Colors.orange.shade600),
          getPageContainer(
              4, 'foot.png', 'Foot', 'ฟุท \nเท้า', Colors.purple.shade400),
          getPageContainer(
              5, 'hair.png', 'Hair', 'แฮ \nผม', Colors.blue.shade300),
          getPageContainer(
              6, 'hand.png', 'Hand', 'แฮนด \nมือ', Colors.blueAccent.shade200),
          getPageContainer(
              7, 'leg.png', 'Leg', 'เลก \nขา', Colors.lightGreen.shade300),
          getPageContainer(8, 'mouth.png', 'Mouth', 'เมาธ \n ปาก',
              Colors.greenAccent.shade400),
          getPageContainer(
              9, 'neck.png', 'Neck', 'เน็ค \nคอ', Colors.greenAccent.shade700),
          getPageContainer(10, 'nose.png', 'Nose', 'โนส \nจมูก',
              Colors.purpleAccent.shade200),
          getPageContainer(11, 'shoulder.png', 'Shoulder', 'โซ๊ล-เดอะ \nบ่า',
              Colors.purple.shade600),
          getPageContainer(
              12, 'knee.png', 'Knee', 'นี \nหัวเข่า', Colors.pink.shade300),
          getPageContainer(13, 'head.png', 'Head', 'เฮด \nหัว / ศีรษะ',
              Color.fromARGB(255, 218, 53, 168)),
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
                image: AssetImage('assets/images/body/$imgName'), //image
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
                      margin: EdgeInsets.only(left: 125, top: 20),
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
                  margin: EdgeInsets.only(left: 65, top: 15),
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

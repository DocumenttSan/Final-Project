import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appnedic/screens/home.dart';

class PageJob extends StatefulWidget {
  const PageJob({super.key});

  @override
  State<PageJob> createState() => _PageJobState();
}

class _PageJobState extends State<PageJob> {
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
          'Jobs',
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
          getPageContainer(0, 'artis.png', 'Artist',
              'อาร์-ทิสทฺ \nนักศิลปะ, จิตรกร', Colors.redAccent.shade100),
          getPageContainer(1, 'astronaut.png', 'Astronaut',
              'แอส-โทรนอท \nนักบินอวกาศ', Colors.blue.shade300),
          getPageContainer(2, 'aviator.png', 'Aviator',
              'เอวิเอเทอะ \nกัปตันเครื่องบิน', Colors.blueAccent.shade200),
          getPageContainer(
              3, 'chef.png', 'Chef', 'เชฟ \nพ่อครัว', Colors.yellow.shade600),
          getPageContainer(4, 'doctor.png', 'Doctor', 'ดอคเทอะ \nแพทย์',
              Colors.deepOrangeAccent.shade200),
          getPageContainer(5, 'farmer.png', 'Farmer', 'ฟาร์มเมอะ \nชาวนา',
              Colors.greenAccent.shade400),
          getPageContainer(6, 'nurse.png', 'Nurse', 'เนิร์ช \nพยาบาล',
              Colors.pinkAccent.shade100),
          getPageContainer(7, 'teacher.png', 'Teacher', 'ทีเชอะ \nครู, อสจาร์ย',
              Colors.blueGrey.shade200),
          getPageContainer(8, 'police.png', 'Poilce', 'โพลีส \nตำรวจ',
              Colors.brown.shade400),
          getPageContainer(9, 'programmer.png', 'Programmer',
              'โพรแกรมเมอะ \nโปรแกรมเมอร์', Colors.grey.shade800),
          getPageContainer(10, 'photographer.png', 'Photographer',
              'ฟะทอก-ระเฟอะ \nช่างถ่ายรูป', Colors.purpleAccent.shade100),
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
      margin: EdgeInsets.only(left: 60, right: 15, top: 25),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: -65,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Image(
                image: AssetImage('assets/images/job/$imgName'), //image
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
                          fontSize: 30,
                        ),
                      ),
                      margin: EdgeInsets.only(
                          left: 90, top: 20), //only(left: 100, top: 20)
                    ),
                  ],
                ),
                Container(
                  child: Text(
                    subtext, //subtext คำแปล ความหมาย
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  margin: EdgeInsets.only(left: 69, top: 15),
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

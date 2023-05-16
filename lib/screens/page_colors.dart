import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appnedic/screens/home.dart';

class PageColor extends StatefulWidget {
  const PageColor({super.key});

  @override
  State<PageColor> createState() => _PageColorState();
}

class _PageColorState extends State<PageColor> {
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
          'Color',
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
              0, 'red.png', 'Red', 'เรด \nสีแดง', Colors.redAccent.shade400),
          getPageContainer(
              1, 'orange.png', 'Orange', 'อ๊อ-ริน \nสีส้ม', Colors.orange),
          getPageContainer(2, 'yellow.png', 'Yellow', 'เย็ล-โล \nสีเหลือง',
              Colors.yellow.shade400),
          getPageContainer(
              3, 'green.png', 'Green', 'กรีน \nสีเขียว', Colors.green.shade500),
          getPageContainer(4, 'purple.png', 'Purple', 'เพ๊อ-เพิล \nสีม่วง',
              Colors.purple.shade400),
          getPageContainer(5, 'pink.png', 'Pink', 'พิงค์ \nสีชทพู',
              Colors.pinkAccent.shade100),
          getPageContainer(6, 'blue.png', 'Blue', 'บลู \nสีน้ำเงิน,ฟ้า',
              Colors.blueAccent.shade200),
          getPageContainer(7, 'gray.png', 'Gray', 'เกร \nสีเทา', Colors.grey),
          getPageContainer(8, 'white.png', 'White', 'ไวท์ \nสีขาว',
              Colors.blueGrey.shade200),
          getPageContainer(9, 'black.png', 'Black', 'แบล็ค \nสีดำ',
              Color.fromARGB(255, 36, 35, 35)),
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
                image: AssetImage('assets/images/color/$imgName'), //image
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
                      margin: EdgeInsets.only(left: 150, top: 20),
                    ),
                  ],
                ),
                Container(
                  child: Text(
                    subtext, //subtext คำแปล ความหมาย
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow.shade700,
                      fontSize: 30,
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

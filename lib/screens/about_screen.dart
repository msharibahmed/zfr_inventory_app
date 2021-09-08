import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  static const routeName = 'about us';
  Text heading(String heading) {
    return Text(
      heading,
      style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),
    );
  }

  _launchURL(BuildContext context) async {
    const url = 'https://zhcetformularacing.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      await showCupertinoDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
                title: const Text('Error Occured!'),
                content: const Text('Couln\'t Launch The URL'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Close',
                        style: TextStyle(color: Colors.red)),
                  )
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: AppBar(
        centerTitle: true,
        title: const Text('ABOUT US',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
            )),
        elevation: 0,
        backgroundColor: Colors.black,
      ), preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.05)),
      body: Column(
        children: [
          Stack(
            children: [
              CarouselSlider(
                  items: ['0', '1', '2', '3', '4'].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          height:  MediaQuery.of(context).size.height*0.4,
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Image.asset(
                              'assets/images/$i.jpeg',
                              fit: BoxFit.cover,
                            ));
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 250,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  )),
              Positioned(
                  bottom: 0,
                  right: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                    onPressed: () async {
                      _launchURL(context);
                    },
                    child: const Text('Our Website'),
                  ))
            ],
          ),
        
          Container(
            height: MediaQuery.of(context).size.height*.57,
            child: Card(
              elevation: 5,
              shadowColor: Colors.black,
              margin: EdgeInsets.all(12),
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                heading('Purpose of This App'),
                const Divider(
                  color: Colors.black,
                  thickness: 2,
                  endIndent: 120,
                  indent: 120,
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16, top: 10),
                  child:  Text(
                      'The sole puprpose of this app is to keep track of the vehicle parts bought.',style:GoogleFonts.roboto()),
                ),
                const SizedBox(
                  height: 20,
                ),
                heading('About Z F R'),
                const Divider(
                  color: Colors.black,
                  thickness: 2,
                  endIndent: 150,
                  indent: 150,
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16, top: 6, bottom: 5),
                  child:  Text(
                      'ZHCET FORMULA RACING is a formula racing team of 40 quite hard working and passionate undergraduate engineering students from Aligarh Muslim University who ideate, design, fabricate and test a formula style race car and participate in various National as well as International formula student competitions.',
                      style:GoogleFonts.roboto(textStyle: TextStyle(wordSpacing: 5))),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

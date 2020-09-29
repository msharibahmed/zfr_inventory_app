import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                content:const Text('Couln\'t Launch The URL'),
                actions: [
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child:const Text('Close', style: TextStyle(color: Colors.red)),
                  )
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('ABOUT US',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              )),
          elevation: 0,
          backgroundColor: Colors.blue[50],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CarouselSlider(
                      items: ['0', '1', '2', '3', '4'].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin:const EdgeInsets.symmetric(horizontal: 5.0),
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
                      child: RaisedButton(
                        color: Colors.blue,
                        onPressed: () async {
                          _launchURL(context);
                        },
                        child: const Text('Our Website'),
                      ))
                ],
              ),
            const  Divider(
                height: 20,
              ),
              // heading('Our Team'),
              // Divider(
              //   color: Colors.black,
              //   thickness: 2,
              //   endIndent: 150,
              //   indent: 150,
              //   height: 15,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Person('assets/images/boyracer.png', 'Zakir',
              //         'Marketing Leader'),
              //     Person('assets/images/boyracer.png', 'Nadeem', 'Treasurer'),
              //     Person('assets/images/g.jpg', 'Gauhar', 'Electronics Lead')
              //   ],
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Person('assets/images/r.jpg', 'Rehan', 'Brakes Lead'),
              //     Person('assets/images/k.jpg', 'Kamran', 'Designer'),
              //     Person('assets/images/boyracer.png', 'Anas', 'Member')
              //   ],
              // ),
            const  SizedBox(
                height: 20,
              ),
              heading('Purpose of This App'),
            const  Divider(
                color: Colors.black,
                thickness: 2,
                endIndent: 120,
                indent: 120,
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16, top: 10),
                child:const Text(
                    'The sole puprpose of this app is to keep track of the vehicle parts bought.'),
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
                padding: const EdgeInsets.only(left: 16.0, right: 16, top: 6,bottom: 16),
                child:const Text(
                    'ZHCET FORMULA RACING is a formula racing team of 40 quite hard working and passionate undergraduate engineering students from Aligarh Muslim University who ideate, design, fabricate and test a formula style race car and participate in various National as well as International formula student competitions.'),
              ),
            ],
          ),
        ));
  }
}

class Person extends StatelessWidget {
  final String image;
  final String name;

  final String position;
  Person(this.image, this.name, this.position);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          child: Image.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          name,
          style:const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(position, style:const TextStyle(fontSize: 10))
      ],
    );
  }
}

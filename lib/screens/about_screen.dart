import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  Text heading(String heading) {
    return Text(
      heading,
      style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [CarouselSlider(
                  items: ['0', '1', '2', '3', '4'].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Image.asset('assets/images/$i.jpeg',fit: BoxFit.cover,));
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
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  )),Positioned(bottom: 0,right: 45,child: RaisedButton(color: Colors.blue,onPressed: (){},child: Text('Our Website'),))],),
              SizedBox(
                height: 15,
              ),
              heading('Our Team'),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Person('assets/images/boyracer.png', 'Rehan',
                      'Marketing Leader'),
                  Person('assets/images/boyracer.png', 'Rehan',
                      'Marketing Leader'),
                  Person(
                      'assets/images/boyracer.png', 'Rehan', 'Marketing Leader')
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Person('assets/images/boyracer.png', 'Rehan',
                      'Marketing Leader'),
                  Person('assets/images/boyracer.png', 'Rehan',
                      'Marketing Leader'),
                  Person(
                      'assets/images/boyracer.png', 'Rehan', 'Marketing Leader')
                ],
              ),
              SizedBox(
                height: 20,
              ),
              heading('Purpose of This App'),
              SizedBox(
                height: 15,
              ),
              Text(''),
              SizedBox(
                height: 20,
              ),
              heading('About Z F R'),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
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
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(position, style: TextStyle(fontSize: 10))
      ],
    );
  }
}

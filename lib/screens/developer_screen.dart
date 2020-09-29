import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperScreen extends StatelessWidget {
  static const routeName = 'developer-screen';
  _launchURL(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      await showCupertinoDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
                title: Text('Error Occured!'),
                content: Text('Couln\'t Launch The URL'),
                actions: [
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OKAY', style: TextStyle(color: Colors.black)),
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
          backgroundColor: Colors.blue[50],
          title: Text(
            'ABOUT DEVELOPER',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),color: Colors.blue[100],),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                        width: double.infinity,
                        height: 250,
                        child: FlareActor(
                          'assets/images/hello.flr',
                          animation: 'idle',
                          fit: BoxFit.contain,
                        )),
                    Divider(
                      height: 120,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Sharib Ahmed',
                          style: GoogleFonts.anton(
                              textStyle: TextStyle(fontSize: 25)),
                        )),
                    Text(
                        'B.Tech  Electrical  Engineering \'22' +
                            '\n' +
                            'ZHCET, Aligarh Muslim University',
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(fontWeight: FontWeight.w500))),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: CupertinoButton.filled(
                        child: Text('Developer Request'),
                        onPressed: () {
                          showCupertinoDialog(
                              context: context,
                              builder: (ctx) => CupertinoAlertDialog(
                                    actions: [
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Close',
                                            style:
                                                TextStyle(color: Colors.red)),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          _launchURL(context,
                                              'https://www.linkedin.com/in/sharib-ahmed-b3b930174/');
                                        },
                                        child: Text('Open Linkedin',
                                            style:
                                                TextStyle(color: Colors.blue)),
                                      )
                                    ],
                                    content: Text(
                                        'If You Like This App Then Endorse The Developer on Linked In.'),
                                  ));
                        },
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Mail for any queries related to app:',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                          GestureDetector(
                            onTap: () {
                              _launchURL(context,
                                  'mailto:msharibahmed@gmail.com?subject=Regarding%20a%20query%20in%20zfr%20inventory%20app.&body=Please%20write%20the%20query.');
                            },
                            child: CircleAvatar(
                                child: Image.asset(
                                  'assets/images/gmail.png',
                                  fit: BoxFit.contain,
                                ),
                                backgroundColor: Colors.blue[100]),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(children: [
                        GestureDetector(
                          onTap: () {
                            _launchURL(context,
                                'https://www.linkedin.com/in/sharib-ahmed-b3b930174/');
                          },
                          child: CircleAvatar(
                              child: Image.asset(
                                'assets/images/linkedin.png',
                                fit: BoxFit.contain,
                              ),
                              backgroundColor: Colors.white),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        GestureDetector(
                          onTap: () {
                            _launchURL(context,
                                'https://www.instagram.com/i._.m._.sharib/');
                          },
                          child: CircleAvatar(
                              child: Image.asset(
                                'assets/images/instagram.png',
                                fit: BoxFit.contain,
                              ),
                              backgroundColor: Colors.white),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            color: Colors.black,
                            child: Image.asset(
                              'assets/images/s.jpg',
                              fit: BoxFit.contain,
                              width: 150,
                              height: 150,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            _launchURL(
                                context, 'https://www.facebook.com/MSharib786');
                          },
                          child: CircleAvatar(
                              child: Image.asset(
                                'assets/images/facebook.png',
                                fit: BoxFit.contain,
                              ),
                              backgroundColor: Colors.white),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        GestureDetector(
                          onTap: () {
                            _launchURL(
                                context, 'https://github.com/msharibahmed');
                          },
                          child: CircleAvatar(
                              child: Image.asset(
                                'assets/images/github.png',
                                fit: BoxFit.contain,
                              ),
                              backgroundColor: Colors.white),
                        ),
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

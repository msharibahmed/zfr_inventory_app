import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main_imports.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  var _guestLoading = false;
  final _passwordController = TextEditingController();
  void _error(String message) async {
    await showDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
              title: Text(
                'Error Occurred!',
              ),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: Text('Close',
                        style: TextStyle(
                          color: Colors.red,
                        )))
              ],
            ));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    try {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState.save();
      await Provider.of<Auth>(context, listen: false).login(
        _authData['email'],
        _authData['password'],
      );
    } on HttpException catch (error) {
      var errorMessage = 'Authentication Failed';
      if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'You are entering wrong password!';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Couldn\'t find this email address!';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'You are using weak password!!';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'You are entering invalid email!!';
      }
      _error(errorMessage);
    } catch (error) {
      const errorMessage =
          'Couldn\'t Authenticate you,Please check your connecton and try later';
      _error(errorMessage);
      print(error);
    }
    print(_isLoading);
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> guestSubmit() async {
    setState(() {
      _guestLoading = true;
    });

    try {
      await Provider.of<Auth>(context, listen: false).guestLogin();
    } catch (error) {
      const errorMessage = 'Please check your connecton and try later';
      _error(errorMessage);
      print(error);
    }
    setState(() {
      _guestLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child:
                    Image.asset("assets/images/logo_zfr.png", fit: BoxFit.fill),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 120,
              ),
              Center(
                child: Container(
                  height: deviceSize.height * 0.42,
                  width: deviceSize.width * 0.9,
                  child: Card(
                    color: Colors.grey[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 10.0,
                    shadowColor: Colors.black,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10.0)),
                      height: 260,
                      constraints: const BoxConstraints(minHeight: 260),
                      width: deviceSize.width * 0.75,
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                initialValue: '@gmail.com',

                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.account_circle,
                                    color: Colors.black,
                                  ),
                                  labelText: 'E-mail',
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      )),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                // ignore: missing_return
                                validator: (value) {
                                  if ((value.isEmpty) ||
                                      !(value.contains('@')) ||
                                      !(value.contains('.'))) {
                                    return 'Enter valid E-mail!';
                                  }
                                },
                                onSaved: (value) {
                                  _authData['email'] = value;
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                  labelText: 'Password',
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      )),
                                ),
                                obscureText: true,
                                controller: _passwordController,

                                // ignore: missing_return
                                validator: (value) {
                                  if (value.isEmpty || value.length < 5) {
                                    return 'Password is too short!';
                                  }
                                },
                                onSaved: (value) {
                                  _authData['password'] = value;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              _isLoading
                                  ? const CircularProgressIndicator()
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Theme.of(context).primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30.0, vertical: 8.0),

                                        // textColor: Theme.of(context)
                                        //     .primaryTextTheme
                                        //     .button
                                        //     .color,
                                      ),
                                      child: const Text('LOGIN'),
                                      onPressed: () {
                                        FocusScope.of(context).unfocus();
                                        _submit();
                                      },
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  const Spacer(),
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.black38,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.circular(15))),
                      onPressed: () {
                        _launchURL(context,
                            'mailto:msharibahmed@gmail.com?subject=Regarding%20a%20new%20email%20request&body=Please%20write%20your%20Faculty%20Number%20,%20Name%20and%20the%20email%20address%20you%20want%20to%20assosciate%20with%20this%20app.');
                      },
                      child: Row(children: [
                        const Text('Request  E-mail',
                            style:
                                TextStyle(fontSize: 15, color: Colors.black)),
                        Icon(Icons.mail, color: Colors.red)
                      ])),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  const Spacer(),
                  TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.blue[900],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(20)),
                      ),
                      onPressed: () {
                        guestSubmit();
                      },
                      child: _guestLoading
                          ? const CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              strokeWidth: 1,
                            )
                          : Row(children: [
                              const Text('Continue as Guest',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                              const Icon(Icons.account_box, color: Colors.white)
                            ])),
                  const Spacer(),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  _launchURL(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      await showCupertinoDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
                title: const Text('Error Occured!'),
                content: const Text('Couln\'t send mail'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OKAY',
                        style: TextStyle(color: Colors.black)),
                  )
                ],
              ));
    }
  }
}

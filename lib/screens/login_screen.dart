import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zfr_inventory_app/provider/other/teddy.dart';
import '../main_imports.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _fnum = FocusNode();
  final _pass = FocusNode();
  @override
  void initState() {
    _fnum.addListener(() {
      _flrAnim(_fnum);
    });
    _pass.addListener(() {
      _flrAnim(_pass);
    });

    super.initState();
  }

  @override
  void dispose() {
    _fnum.removeListener(() {
      _flrAnim(_fnum);
    });
    _pass.removeListener(() {
      _flrAnim(_pass);
    });
    _fnum.dispose();
    _pass.dispose();

    super.dispose();
  }

  void _flrAnim(FocusNode name) {
    final teddy = Provider.of<Teddy>(context, listen: false);

    if (name.hasFocus) {
      teddy.changeMode('test');
    }
  }

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
                FlatButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: Text('Close',
                        style: TextStyle(
                          color: Colors.red,
                        )))
              ],
            ));
  }

  Future<void> _submit() async {
    final teddy = Provider.of<Teddy>(context, listen: false);

    if (!_formKey.currentState.validate()) {
      teddy.changeMode('fail');
      return;
    }
    teddy.changeMode('success');

    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
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
  }

  Future<void> guestSubmit() async {
    final teddy = Provider.of<Teddy>(context, listen: false);

    teddy.changeMode('success');

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
    final teddy = Provider.of<Teddy>(context, listen: false);
    // final transformConfig = Matrix4.rotationZ(-8 * pi / 180);
    // transformConfig.translate(-10.0);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(115, 117, 255, 1).withOpacity(0.5),
                  Color.fromRGBO(155, 188, 117, 1).withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: FlareCacheBuilder(
                [
                  AssetFlare(
                      bundle: rootBundle, name: "assets/images/flareintro.flr")
                ],
                builder: (BuildContext context, bool isWarm) {
                  return !isWarm
                      ?  Container(child:const Text("Loading..."))
                      : FlareActor(
                          "assets/images/flareintro.flr",
                          alignment: Alignment.topCenter,
                          fit: BoxFit.contain,
                          animation: teddy.anim,
                        );
                },
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const  SizedBox(
                height: 120,
              ),
              Center(
                child: Container(
                  height: deviceSize.height * 0.4,
                  width: deviceSize.width * 0.9,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 8.0,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10.0)),
                      height: 260,
                      constraints:const BoxConstraints(minHeight: 260),
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
                                focusNode: _fnum,
                                initialValue: '@gmail.com',

                                decoration: InputDecoration(
                                  prefixIcon:const Icon(
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
                                      !(value.contains('@zfr.com'))) {
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
                                focusNode: _pass,
                                decoration: InputDecoration(
                                  prefixIcon:const Icon(
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
                              if (_isLoading)
                              const  CircularProgressIndicator()
                              else
                                RaisedButton(
                                  child:const Text('LOGIN'),
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    _submit();
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding:const EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 8.0),
                                  color: Theme.of(context).primaryColor,
                                  textColor: Theme.of(context)
                                      .primaryTextTheme
                                      .button
                                      .color,
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
                  OutlineButton(
                      onPressed: () {
                        _launchURL(context,
                            'mailto:msharibahmed@gmail.com?subject=Regarding%20a%20new%20email%20request&body=Please%20write%20your%20Faculty%20Number%20and%20Name.');
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
                  RaisedButton(
                      color: Colors.blue,
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
                  FlatButton(
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

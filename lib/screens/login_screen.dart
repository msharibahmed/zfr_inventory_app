import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zfr_inventory_app/models/http_exception.dart';
import 'package:zfr_inventory_app/provider/other/auth.dart';
// import 'package:world_mart/models/http_exception.dart';

enum AuthMode { Signup, Login }

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String anim = 'idle';
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
    if (name.hasFocus) {
      setState(() {
        anim = 'test';
      });
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
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
                    child: Text('OKAY',
                        style: TextStyle(
                          color: Colors.blue,
                        )))
              ],
            ));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      setState(() {
        anim = 'fail';
      });
      return;
    }
    setState(() {
      anim = 'success';
    });

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

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
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
              child: FlareActor(
                'assets/images/flareintro.flr',
                animation: anim,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
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
                      constraints: BoxConstraints(minHeight: 260),
                      width: deviceSize.width * 0.75,
                      padding: EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 15,),
                              TextFormField(
                                focusNode: _fnum,
                                initialValue: '@zfr.com',

                                decoration: InputDecoration(
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
                              ),                              SizedBox(height: 15,),

                              TextFormField(
                                focusNode: _pass,
                                decoration: InputDecoration(
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
                              SizedBox(
                                height: 20,
                              ),
                              if (_isLoading)
                                CircularProgressIndicator()
                              else
                                RaisedButton(
                                  child: Text('LOGIN'),
                                  onPressed: _submit,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: EdgeInsets.symmetric(
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
              SizedBox(
                height: 10,
              ),
              OutlineButton(
                  onPressed: () {},
                  child: Text('Request E-mail',
                      style: TextStyle(
                        color: Colors.black,
                      )))
            ],
          )
        ],
      ),
    );
  }
}

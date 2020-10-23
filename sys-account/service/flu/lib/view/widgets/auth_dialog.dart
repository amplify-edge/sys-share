import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flash/flash.dart';
import 'package:sys_share_sys_account_service/view/widgets/view_model/account_view_model.dart';

class AuthDialog extends StatefulWidget {
  final bool isRegister;
  const AuthDialog({Key key, @required this.isRegister}) : super(key: key);
  @override
  AuthDialogState createState() => AuthDialogState();
}

class AuthDialogState extends State<AuthDialog> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext buildContext) {
    return ViewModelBuilder<AccountViewModel>.reactive(
      viewModelBuilder: () => AccountViewModel(),
      onModelReady: (AccountViewModel model) {
        _emailCtrl.text = model.getEmail;
        _passwordCtrl.text = model.getPassword;
      },
      builder: (context, model, child) => Dialog(
        backgroundColor: Colors.grey[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 400,
              color: Colors.white,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'GCN',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.headline1.color,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Email',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.subtitle2.color,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      focusNode: _emailFocusNode,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: _emailCtrl,
                      autofocus: false,
                      onChanged: (v) => model.setEmail(v),
                      enabled: model.isEmailEnabled,
                      onSubmitted: (v) {
                        _emailFocusNode.unfocus();
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blueGrey[800],
                            width: 3,
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(
                          color: Colors.blueGrey[300],
                        ),
                        hintText: "Email",
                        fillColor: Colors.white,
                        errorText: model.validateEmailText(),
                        errorStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8,
                    ),
                    child: Text(
                      'Password',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.subtitle2.color,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        // letterSpacing: 3,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      focusNode: _passwordFocusNode,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      controller: _passwordCtrl,
                      obscureText: true,
                      autofocus: false,
                      onChanged: (v) => model.setPassword(v),
                      enabled: model.isPasswordEnabled,
                      onSubmitted: (v) {
                        _passwordFocusNode.unfocus();
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blueGrey[800],
                            width: 3,
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(
                          color: Colors.blueGrey[300],
                        ),
                        hintText: "Password",
                        fillColor: Colors.white,
                        errorText: model.validatePasswordText(),
                        errorStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: double.maxFinite,
                            child: FlatButton(
                              color: Colors.blueGrey[700],
                              disabledColor: Colors.grey[400],
                              hoverColor: Colors.blueGrey[900],
                              highlightColor: Colors.black,
                              onPressed: !widget.isRegister
                                  ? model.isLoginParamValid
                                      ? () async {
                                          await model.login().then((_) {
                                            Navigator.pop(context);
                                            if (model.errMsg.isNotEmpty) {
                                              _notify(
                                                message: model.errMsg,
                                                error: true,
                                              );
                                            } else {
                                              _notify(
                                                message: model.successMsg,
                                                error: false,
                                              );
                                            }
                                          });
                                        }
                                      : null
                                  : model.isRegisterParamValid
                                      ? () async {
                                          await model.register().then((_) {
                                            Navigator.pop(context);
                                            if (model.errMsg.isNotEmpty) {
                                              _notify(
                                                  message: model.errMsg,
                                                  error: true);
                                            } else {
                                              _notify(
                                                  message: model.successMsg,
                                                  error: false);
                                            }
                                          });
                                        }
                                      : null,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 15.0,
                                  bottom: 15.0,
                                ),
                                child: model.buzy
                                    ? SizedBox(
                                        height: 16,
                                        width: 16,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              new AlwaysStoppedAnimation<Color>(
                                            Colors.white,
                                          ),
                                        ),
                                      )
                                    : Text(
                                        !widget.isRegister
                                            ? 'Log in'
                                            : 'Register',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: double.maxFinite,
                            child: TextButton(
                              onPressed: () => model.setIsLogin(!model.isLogin),
                              child: Text(
                                model.isLogin
                                    ? "Don't have account? Sign Up!"
                                    : "Already have account? Sign In",
                                style: TextStyle(
                                  color: Colors.blue[500],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'By proceeding, you agree to our Terms of Use and confirm you have read our Privacy Policy.',
                      maxLines: 2,
                      style: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .color
                            .withOpacity(0.85),
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        // letterSpacing: 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _notify({
    String message,
    bool error,
    flashStyle = FlashStyle.floating,
  }) {
    showFlash(
      context: context,
      duration: Duration(seconds: 3),
      builder: (context, controller) {
        return Flash(
          controller: controller,
          style: flashStyle,
          boxShadows: kElevationToShadow[4],
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            leftBarIndicatorColor: error ? Colors.red[500] : Colors.green[500],
            message: Text(message),
          ),
        );
      },
    );
  }
}

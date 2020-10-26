import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:sys_core/pkg/widgets/notification.dart';
import 'package:sys_share_sys_account_service/view/widgets/view_model/reset_password_view_model.dart';

class ResetPasswordDialog extends StatefulWidget {
  const ResetPasswordDialog({Key key}) : super(key: key);

  @override
  ResetPasswordDialogState createState() => ResetPasswordDialogState();
}

class ResetPasswordDialogState extends State<ResetPasswordDialog> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _verificationCtrl = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _verificationFocusNode = FocusNode();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _verificationCtrl.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _verificationFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext buildContext) {
    return ViewModelBuilder<ResetPasswordViewModel>.reactive(
      viewModelBuilder: () => ResetPasswordViewModel(),
      onModelReady: (ResetPasswordViewModel model) {
        _emailCtrl.text = model.getEmail;
        _passwordCtrl.text = model.getPassword;
        _verificationCtrl.text = model.getVerificationTokenText;
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
                      textInputAction: TextInputAction.next,
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
                      focusNode: _verificationFocusNode,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      controller: _verificationCtrl,
                      obscureText: true,
                      autofocus: false,
                      onChanged: (v) => model.setVerificationTokenText(v),
                      enabled: model.isVerificationFieldEnabled,
                      onSubmitted: (v) {
                        _verificationFocusNode.unfocus();
                        FocusScope.of(context)
                            .requestFocus(_verificationFocusNode);
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
                        hintText: "Verification Token",
                        fillColor: Colors.white,
                        errorText: model.validateVerificationTokenText(),
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
                              onPressed: model.isResetPasswordValid
                                  ? () async {
                                      await model.resetPassword().then((res) {
                                        if (model.successMsg.isNotEmpty) {
                                          Navigator.pop(context);
                                          notify(
                                              context: context,
                                              message: model.successMsg,
                                              error: false);
                                        } else {
                                          notify(
                                              context: context,
                                              message: model.errMsg,
                                              error: true);
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
                                        'Submit New Password',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

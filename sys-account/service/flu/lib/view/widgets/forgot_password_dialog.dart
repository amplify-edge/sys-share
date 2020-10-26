import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:sys_core/pkg/widgets/notification.dart';
import 'package:sys_share_sys_account_service/view/widgets/reset_password_dialog.dart';
import 'package:sys_share_sys_account_service/view/widgets/view_model/forgot_password_view_model.dart';

class ForgotPasswordDialog extends StatefulWidget {
  const ForgotPasswordDialog({Key key}) : super(key: key);

  @override
  ForgotPasswordDialogState createState() => ForgotPasswordDialogState();
}

class ForgotPasswordDialogState extends State<ForgotPasswordDialog> {
  final _emailCtrl = TextEditingController();
  final _emailFocusNode = FocusNode();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext buildContext) {
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
      viewModelBuilder: () => ForgotPasswordViewModel(),
      onModelReady: (ForgotPasswordViewModel model) {
        _emailCtrl.text = model.getEmail;
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
                      textInputAction: TextInputAction.done,
                      controller: _emailCtrl,
                      autofocus: false,
                      onChanged: (v) => model.setEmail(v),
                      enabled: model.isEmailEnabled,
                      onSubmitted: (v) {
                        _emailFocusNode.unfocus();
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
                              onPressed: model.isForgotPasswordValid
                                  ? () async {
                                      await model.submitEmail().then((_) {
                                        if (model.successMsg.isNotEmpty) {
                                          Navigator.pop(context);
                                          notify(
                                            context: context,
                                            message: model.successMsg,
                                            error: false,
                                          );
                                          showDialog(
                                            barrierDismissible: false,
                                            context: buildContext,
                                            builder: (context) =>
                                                ResetPasswordDialog(),
                                          );
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
                                    : Text('Reset Password!'),
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
}

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:auth_dialog/modules/account/view_model/account_view_model.dart';

class AccountView extends StatefulWidget {
  const AccountView({Key key}) : super(key: key);
  @override
  AccountViewState createState() => AccountViewState();
}

class AccountViewState extends State<AccountView> {
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
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountViewModel>.reactive(
      viewModelBuilder: () => AccountViewModel(),
      onModelReady: (AccountViewModel model) {
        _emailCtrl.text = model.getEmail;
        _passwordCtrl.text = model.getPassword;
      },
      builder: (context, AccountViewModel model, child) => Scaffold(
        appBar: AppBar(),
        body: Container(
          child: RaisedButton(
            child: Text('Test Auth Dialog'),
            autofocus: false,
            clipBehavior: Clip.none,
            onPressed: () => showDialog(
              context: context,
              builder: (context) => Dialog(
                backgroundColor: Theme.of(context).backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 400,
                      color: Theme.of(context).backgroundColor,
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'GCN',
                              style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.headline1.color,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 3,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, bottom: 8),
                            child: Text(
                              'Email',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.subtitle2.color,
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
                              onSubmitted: (v) {
                                _emailFocusNode.unfocus();
                                FocusScope.of(context)
                                    .requestFocus(_passwordFocusNode);
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
                              left: 20.0,
                              bottom: 8,
                            ),
                            child: Text(
                              'Password',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.subtitle2.color,
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
                              onSubmitted: (v) {
                                _passwordFocusNode.unfocus();
                                FocusScope.of(context)
                                    .requestFocus(_passwordFocusNode);
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
                                      color: Colors.blueGrey[800],
                                      hoverColor: Colors.blueGrey[900],
                                      highlightColor: Colors.black,
                                      onPressed: () async =>
                                          await model.login(),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: 15.0,
                                          bottom: 15.0,
                                        ),
                                        child: model.isBusy
                                            ? SizedBox(
                                                height: 16,
                                                width: 16,
                                                child:
                                                    CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                  valueColor:
                                                      new AlwaysStoppedAnimation<
                                                          Color>(
                                                    Colors.white,
                                                  ),
                                                ),
                                              )
                                            : Text(
                                                'Log in',
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
            ),
          ),
        ),
      ),
    );
  }
}

class SubmitRequestButton extends StatelessWidget {
  const SubmitRequestButton({
    Key key,
    @required bool isLoading,
    @required Function onPressed,
    @required String functionName,
  })  : _isLoading = isLoading,
        _onPressed = onPressed,
        _functionName = functionName,
        super(key: key);

  final bool _isLoading;
  final Function _onPressed;
  final String _functionName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: RaisedButton(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: !_isLoading
                      ? Text('Submit ' + _functionName,
                          style: Theme.of(context).textTheme.bodyText1)
                      : CircularProgressIndicator(),
                  onPressed: _onPressed,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

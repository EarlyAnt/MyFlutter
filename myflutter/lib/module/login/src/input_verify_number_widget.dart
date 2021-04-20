import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../reminder/src/topReminder_widget.dart';

class InputVerifyNumberWidget extends StatefulWidget {
  InputVerifyNumberWidget({Key key}) : super(key: key);

  @override
  _InputVerifyNumberWidgetState createState() =>
      _InputVerifyNumberWidgetState();
}

class _InputVerifyNumberWidgetState extends State<InputVerifyNumberWidget> {
  TextEditingController _verifyNumber1 = TextEditingController();
  TextEditingController _verifyNumber2 = TextEditingController();
  TextEditingController _verifyNumber3 = TextEditingController();
  TextEditingController _verifyNumber4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 69, 124, 187),
        body: Stack(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(20, 180, 20, 0),
                child: _txtTitle()),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 280, 20, 0),
                child: Row(children: [
                  _txtOperate(),
                  _txtPhoneNumber('17621798266'),
                ])),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 340, 20, 0),
              child: Container(
                color: Colors.white10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _txtVerifyNumber(_verifyNumber1),
                    _txtVerifyNumber(_verifyNumber2),
                    _txtVerifyNumber(_verifyNumber3),
                    _txtVerifyNumber(_verifyNumber4),
                  ],
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 445, 20, 0),
                child: _btnConfirm()),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 525, 20, 0),
                child: _txtResend()),
          ],
        ),
      ),
    );
  }

  Widget _txtTitle() {
    return SizedBox(
        width: double.infinity,
        child: Text(
          '输入验证码',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 38),
        ));
  }

  Widget _txtOperate() {
    return Text('已发送4位验证码至: ',
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.white, fontSize: 20));
  }

  Widget _txtPhoneNumber(String phoneNumber) {
    return Text(phoneNumber,
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.white30, fontSize: 18));
  }

  Widget _txtVerifyNumber(TextEditingController textEditingController) {
    return Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
            color: Colors.white30,
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle),
        child: Stack(children: [
          TextField(
            keyboardType: TextInputType.number,
            // inputFormatters: [
            //   FilteringTextInputFormatter.digitsOnly, //数字，只能是整数
            //   //FilteringTextInputFormatter.allow(RegExp("[0-9.]")), //数字包括小数
            //   //FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")), //只允许输入字
            // ],
            style: TextStyle(
                color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
            decoration:
                InputDecoration(border: InputBorder.none, counterText: ''),
            controller: textEditingController,
            textAlign: TextAlign.center,
            maxLength: 1,
          ),
          Visibility(
              visible: true,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 45, 15, 0),
                  child: Container(color: Colors.white, height: 10)))
        ]));
  }

  Widget _btnConfirm() {
    return SizedBox(
        width: double.infinity,
        height: 50,
        child: RawMaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6))),
            fillColor: Color.fromARGB(255, 68, 178, 232),
            splashColor: Color.fromARGB(200, 68, 178, 232),
            onPressed: () {
              setState(() {
                TopReminder.open(context, '验证成功');
              });
            },
            child: Text('确定',
                style: TextStyle(color: Colors.white, fontSize: 20))));
  }

  Widget _txtResend() {
    return SizedBox(
        width: double.infinity,
        child: Text(
          '重新发送(55)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, color: Colors.white38),
        ));
  }
}

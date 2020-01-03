import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:icehockey/model/dynamic_list_info.dart';

class Headline extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _headline();
  }
}

class _headline extends State<Headline> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  String text = "所谓的世间，不就是你吗？";

  @override
  void initState() {
    super.initState();
    getHttp();
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(),
        body: ListView(
          children: <Widget>[
            textWidget(),
            editTextWidget(),
            imageWidget(),
          ],
        ),
      ),
    );
  }

  Widget textWidget() {
    return Column(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
              color: Colors.black,
              backgroundColor: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              letterSpacing: 1,
              wordSpacing: -4,
              textBaseline: TextBaseline.ideographic,
              height: 1,
//            shadows: [
//              Shadow(
//                color: Colors.green,
//                offset: Offset(5, 5),
//              ),
//            ],
              decoration: TextDecoration.underline,
              decorationColor: Colors.black,
              decorationStyle: TextDecorationStyle.solid,
              decorationThickness: 5),
          strutStyle: StrutStyle(),
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 2,
          maxLines: 2,
          semanticsLabel: "TEST",
          textWidthBasis: TextWidthBasis.parent,
        ),
        RichText(
          text: TextSpan(
              text: "在我过往的人生中，",
              style: TextStyle(color: Colors.black, fontSize: 18.0),
              children: [
                TextSpan(
                  text: "曾多次期望有人能杀了我，",
                ),
                TextSpan(
                    text: "但从未想过要杀人，", style: TextStyle(color: Colors.red)),
                TextSpan(
                  text: "因为面对可怕的对手，",
                ),
                TextSpan(
                  text: "我反而只想着如何要对方幸福",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('我反而只想着如何要对方幸福');
                    },
                )
              ]),
        ),
        DefaultTextStyle(
          style: TextStyle(
              fontSize: 14.0,
              color: Colors.red,
              decoration: TextDecoration.underline),
          child: Text(
            '懦夫，连幸福都害怕，碰到棉花也会受伤。',
            style:
                TextStyle(fontSize: 12.0, inherit: false, color: Colors.blue),
          ),
          maxLines: 2,
          softWrap: true,
        ),
      ],
    );
  }

  Widget editTextWidget() {
    return Column(
      children: <Widget>[
        Form(
//          key: _formKey,
          child: TextFormField(
//            initialValue: "默认值",
            controller: TextEditingController.fromValue(
              TextEditingValue(
                text: "这是啥",
                selection: TextSelection.collapsed(
                  offset: 0,
                  affinity: TextAffinity.upstream,
                ),
                composing: TextRange.collapsed(0),
              ),
            ),
//                readOnly: true,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'What do people call you?',
              labelText: 'Name *',
            ),
            showCursor: false,
            cursorWidth: 2,
            cursorColor: Colors.lightBlue,
            cursorRadius: Radius.circular(1),
          ),
          autovalidate: true, //TextFormField validator开启
        ),
        new TextField(
          decoration: new InputDecoration(
            labelText: "城市",
            icon: new Icon(Icons.location_city),
            border: new OutlineInputBorder(),
            // 边框样式
            helperText: 'required',
            counterStyle: TextStyle(color: Colors.green),
            hintText: '请选择你要投保的城市',
            hoverColor: Colors.red,
            fillColor: Colors.yellow,
            focusColor: Colors.blue,
//              errorText: "错误",
            suffixIcon: Icon(Icons.remove_red_eye),
            prefixStyle: TextStyle(color: Colors.black),
            prefixIcon: new Icon(Icons.android),
            prefixText: 'Hello',
          ),
          keyboardType: TextInputType.emailAddress,
          // 获取焦点时,启用的键盘类型
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.none,
          style: new TextStyle(
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
          //输入的内容在水平方向如何显示
          textAlignVertical: TextAlignVertical.center,
          textDirection: TextDirection.rtl,
//          toolbarOptions: ToolbarOptions(
//            copy: true,
//            cut: true,
//            paste: true,
//            selectAll: true,
//          ),
          showCursor: false,
          autofocus: false,
          //自动获取焦点
          autocorrect: false,
          // 是否自动校正
          maxLines: 2,
          // 输入框最大的显示行数
          minLines: 1,

          maxLength: 3,
          //允许输入的字符长度
          maxLengthEnforced: false,
          //是否允许输入的字符长度超过限定的字符长度
          onChanged: (newValue) {
            print(newValue); // 当输入内容变更时,如何处理
          },
          onEditingComplete: () {
            print("onEditingComplete");
          },
          onSubmitted: (value) {
            print("${value}"); // 当用户确定已经完成编辑时触发
          },
          inputFormatters: [],
          //对输入的文字进行限制和校验
          enabled: true,
          // 是否启用
        ),
      ],
    );
  }

  Widget imageWidget() {
    return Column(children: <Widget>[
      Image(
        image: NetworkImage(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
        ),
      ),
      Image(
        image: AssetImage('assets/2018111651652279.jpg'),
      ),
      Image.network(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
      new DecoratedBox(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage('assets/2018111651652279.jpg'),
            // ...
          ),
          // ...
        ),
      ),
    ]);
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/2018111651652279.jpg');
  }

  void getHttp() async {
    try {
      Response response;
      Dio dio = Dio();
      response = await dio.get(
          "http://124.65.238.30:3300/bingyun/api2/subject/pageHome?pageNo=2&pageSize=10&subjectListType=NEWEST");
      // print(response.data.toString());

      var scores = jsonDecode(response.data.toString());
      assert(scores is DynamicListInfo);
      var success = scores.success;
      setState(() {
        text = success.toString();
      });

      print(success);
      // debugPrint()
    } catch (e) {
      print(e);
    }
  }
}

//Column(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//TextFormField(
////                initialValue: "默认值",
//controller: TextEditingController.fromValue(
//TextEditingValue(
//text: "这是啥",
//selection: TextSelection.collapsed(
//offset: 0,
//affinity: TextAffinity.upstream,
//),
//composing: TextRange.collapsed(0),
//),
//),
////                readOnly: true,
//validator: (value) {
//if (value.isEmpty) {
//return 'Please enter some text';
//}
//return null;
//},
//decoration: const InputDecoration(
//icon: Icon(Icons.person),
//hintText: 'What do people call you?',
//labelText: 'Name *',
//),
//cursorWidth: 2,
//cursorColor: Colors.lightBlue,
//cursorRadius: Radius.circular(1),
//),
//TextFormField(
//validator: (value) {
//if (value.isEmpty) {
//return 'Please enter some text';
//}
//return null;
//},
//decoration: const InputDecoration(
//icon: Icon(Icons.person),
//hintText: 'How old are you?',
//labelText: 'age *',
//),
//),
//],
//)


import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'dart:io';

class GradientButtonRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GradientButton(
          colors: [Colors.orange, Colors.red],
          child: Text("获取相册图片"),
          onPressed: getImage,
        ),
        RaisedGradientButton(
          colors: [Colors.orange, Colors.red],
          child: Text("拍摄"),
          onPressed: getCamera,
        ),
        GradientButton(
          child: Text("打开浏览器"),
          onPressed: openBrowser,
          borderRadius: BorderRadius.circular(30),
        ),
        RaisedGradientButton(
          child: Text("Submit"),
          onPressed: onTap,
          borderRadius: BorderRadius.circular(30),
        ),
        SizedBox(
          width: double.infinity,
          height: 48,
          child:  GradientButton(
            colors: [Colors.lightGreen, Colors.green[700]],
            child: Text("Submit"),
            onPressed: onTap,
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 48,
          child:  RaisedGradientButton(
            colors: [Colors.lightGreen, Colors.green[700]],
            child: Text("Submit"),
            onPressed: onTap,
          ),
        ),
        RaisedGradientButton(
          child: Text("Submit"),
          onPressed: onTap,
        ),
      ].map((e) {
        return Padding(
          padding: EdgeInsets.all(8),
          child: e,
        );
      }).toList(),
      
    );
  }
  openDeviceInfo() async{
    print('object');
    DeviceInfoPlugin deviceInfoP = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfoP.androidInfo;
    print('Running on ${androidInfo.model}');  // e.g. "Moto G (4)"
  }
  getCamera() async {
  var  image = await ImagePicker.pickImage(source: ImageSource.camera);
  }
  getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  }
  onTap(){

  }
  openBrowser(){
    launch('https://www.baidu.com');
  }
}

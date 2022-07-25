import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  _buildBackListTileRow(Map? val) {
    return val == null
        ? Container()
        : ListTile(
      title: Text("传值 id = " + val["id"].toString()),
      subtitle: Text('Get.back(result: {"success": true}'),
      onTap: () => Get.back(result: {"success": true}),
    );
  }

  @override
  Widget build(BuildContext context) {
    Map? details = Get.arguments;   // arguments 傳輸值
    Map? parameters = Get.parameters; // url parameters 傳值

    return Scaffold(
      appBar: AppBar(
        title: Text("详情页"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("导航-返回"),
            subtitle: Text('Get.back()'),
            onTap: () => Get.back(),
          ),
          _buildBackListTileRow(details),
          _buildBackListTileRow(parameters),
        ],
      ),
    );
  }
}
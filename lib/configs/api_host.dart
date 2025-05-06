/// 代理设置

import 'package:flutter/material.dart';

import '../src/rust/api/api.dart' as api;
import '../screens/components/commons.dart';

late String _currentApiHost;

Future<String?> initApiHost() async {
  _currentApiHost = await api.getApiHost();
  return null;
}

String currentApiHostName() {
  return _currentApiHost == "" ? "No establecido" : _currentApiHost;
}

Future<dynamic> inputApiHost(BuildContext context) async {
  String? input = await displayTextInputDialog(
    context,
    src: _currentApiHost,
    title: 'Servidor',
    hint: 'Por favor ingrese servidor',
    desc: " ( 例如 https://domain.com ) ",
  );
  if (input != null) {
    await api.setApiHost(api: input);
    _currentApiHost = input;
  }
}

Widget apiHostSetting() {
  return StatefulBuilder(
    builder: (BuildContext context, void Function(void Function()) setState) {
      return ListTile(
        title: const Text("Dirección de servidor"),
        subtitle: Text(currentApiHostName()),
        onTap: () async {
          await inputApiHost(context);
          setState(() {});
        },
      );
    },
  );
}

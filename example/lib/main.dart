import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tamper_checker/tamper_checker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final tamperChecker = TamperChecker();
  String? tamperResult;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await checkTampering();
    });
  }

  Future<void> checkTampering() async {
    try {
      tamperResult = await tamperChecker.checkTampering(sp: 'assets/auth.svg');
    } on PlatformException {
      tamperResult = '获取篡改结果失败。';
    }
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('篡改检测器示例'),
        ),
        body: Center(
          child: tamperResult == null
              ? const CircularProgressIndicator()
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '篡改结果：',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        tamperResult ?? '',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        showTamperResult(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  String showTamperResult() {
    return (tamperResult?.isNotEmpty ?? false) ? '应用程序是安全的。' : '应用程序不安全。';
  }
}

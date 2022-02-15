import 'package:flutter/material.dart';
import 'package:learning_flutter/services/network_service.dart';

class DioImplPage extends StatefulWidget {
  const DioImplPage({Key? key}) : super(key: key);

  @override
  State<DioImplPage> createState() => _DioImplPageState();
}

class _DioImplPageState extends State<DioImplPage> {

  @override
  void initState() {
    super.initState();
    NetworkService.init().fetch(onReceiveProgress: (count, total) {
      print("Received: $count and Size: $total");
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("This is Dio Impl Page!!"),
      ),
    );
  }
}
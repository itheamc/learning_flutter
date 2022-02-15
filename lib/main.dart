import 'package:flutter/material.dart';
import 'package:learning_flutter/pages/animated_text_page.dart';
import 'package:learning_flutter/pages/counter_page.dart';
import 'package:learning_flutter/pages/counter_page_with_provider.dart';
import 'package:learning_flutter/pages/dio_impl_page.dart';
import 'package:learning_flutter/pages/home_page.dart';
import 'package:learning_flutter/pages/home_page_2.dart';
import 'package:learning_flutter/pages/image_picker_screen.dart';
import 'package:learning_flutter/pages/login_page.dart';
import 'package:learning_flutter/pages/shimmer_example_page.dart';
import 'package:learning_flutter/pages/slidable_example_page.dart';
import 'package:learning_flutter/pages/timeline_screen.dart';
import 'package:learning_flutter/providers/counter_provider.dart';
import 'package:learning_flutter/providers/dummy_provider.dart';
import 'package:learning_flutter/providers/mesage_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CounterProvider()),
      ChangeNotifierProvider(create: (_) => DummyProvider()),
      // ProxyProvider<CounterProvider, MessageProvider>(
      //     update: (context, counterProvider, messageProvider) =>
      //         MessageProvider(count: counterProvider.count)),
      ProxyProvider2<CounterProvider, DummyProvider, MessageProvider>(
        update: (context, counter, dummy, message) => MessageProvider(count: counter.count, items: dummy.items),
        // updateShouldNotify: (oldP, newP) => oldP.count != newP.count,
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Learning Flutter",
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: "/timeline",
      routes: {
        "/": (context) => const HomePage(),
        "/home2": (context) => const HomePage2(),
        "/login": (context) => const LoginPage(),
        "/counter": (context) => const CounterPage(),
        '/counter2': (context) => CounterPage2(),
        "/slidable": (context) => const SlidableExamplePage(),
        "/animates_text": (context) => const AnimatedTextExamplePage(),
        "/dioimpl": (context) => const DioImplPage(),
        "/shimmerex": (context) => ShimmerExamplePage(),
        "/image_picker": (context) => const ImagePickerScreen(),
        "/timeline": (context) => const TimelineScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

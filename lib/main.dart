import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => CounterProvider(),
        child: const MyApp(),
      ),
    );

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  void add() {
    _counter++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Provier',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const CounterHome(),
    );
  }
}

class CounterHome extends StatelessWidget {
  const CounterHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Provider')),
      body: Center(
        child: Text(
          context.watch<CounterProvider>().counter.toString(),
          style: const TextStyle(fontSize: 50),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<CounterProvider>().add();
        },
      ),
    );
  }
}

/*
  // Nhà cung cấp
    class YourProvider extends ChangeNotifier
    notifyListeners();
  --------------------------------------------------
  // Nhà phân phối
    ChangNotifierProvider
    MultiProvider
  --------------------------------------------------
  // Người sử dụng
    Consumer<YourProvider>
    context.watch<YourProvider>()
    context.read<YourProvider>()
  --------------------------------------------------
*/


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Counter and Image Toggle'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _showFirstImage = true;

  // Increment Counter
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Toggle Images
  void _toggleImage() {
    setState(() {
      _showFirstImage = !_showFirstImage;
    });
  }

  // Reset both counter and image
  void _reset() {
    setState(() {
      _counter = 0;
      _showFirstImage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter Value:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('Increment'),
            ),
            const SizedBox(height: 20),
            // Displaying images based on the toggle state
            _showFirstImage
                ? Image.network(
                    'https://thumbs.dreamstime.com/b/big-smile-emoticon-26256350.jpg', // Replace with your image URL
                    height: 150,
                  )
                : Image.network(
                    'https://t4.ftcdn.net/jpg/00/86/18/25/360_F_86182546_Gy93hyoCFXmK0JlXYnOekv05v66MUmfb.jpg', // Replace with your image URL
                    height: 150,
                  ),
            ElevatedButton(
              onPressed: _toggleImage,
              child: const Text('Toggle Image'),
            ),
            const SizedBox(height: 20),
            // Reset button to reset the counter and image state
            ElevatedButton(
              onPressed: _reset,
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int count = 0;

  bool get isEmpty => count == 0;
  bool get isfull => count == 20;

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Text do button
    const TextStyle styleTextButton = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );

    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/imgs/images.jpeg'),
        fit: BoxFit.cover,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isfull ? 'Lotado' : 'Pode entrar!',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              letterSpacing: 3,
              color: isfull ? Colors.red : Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Text(
              count.toString(),
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.w700,
                letterSpacing: 3,
                color: isfull ? Colors.red : Colors.black,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black12,
                      backgroundColor: isEmpty
                          ? Colors.white.withOpacity(0.2)
                          : Colors.white,
                      fixedSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  child: const Text(
                    'Saiu',
                    style: styleTextButton,
                  )),
              const SizedBox(
                width: 32,
              ),
              TextButton(
                  onPressed: isfull ? null : increment,
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black12,
                      backgroundColor:
                          isfull ? Colors.white.withOpacity(0.2) : Colors.white,
                      fixedSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  child: const Text(
                    'Entrou',
                    style: styleTextButton,
                  )),
            ],
          ),
        ],
      ),
    ));
  }
}

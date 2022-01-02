import 'dart:math';

import 'package:flutter/material.dart';

import 'book.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = PageController();
  final _notifierScroll = ValueNotifier(0.0);

  void _listener() {
    _notifierScroll.value = _controller.page!;
  }

  @override
  void initState() {
    _controller.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bookHeight = size.height * 0.45;
    final bookWidth = size.width * 0.65;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              bookAppAssetBackground,
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(40.0),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: ValueListenableBuilder<double>(
                valueListenable: _notifierScroll,
                builder: (context, value, _) {
                  return PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: books.length,
                    controller: _controller,
                    itemBuilder: (context, index) {
                      final book = books[index];
                      final percentage = index - value;
                      final rotation = percentage.clamp(0.0, 1.0);
                      final fixRotation = pow(rotation, 0.35);
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Stack(
                                children: [
                                  Container(
                                    height: bookHeight,
                                    width: bookWidth,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 10,
                                          offset: Offset(5.0, 5.0),
                                          spreadRadius: 5,
                                        ),
                                      ],
                                    ),
                                    child: Image.asset(
                                      book.fpage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Transform(
                                    alignment: Alignment.centerLeft,
                                    transform: Matrix4.identity()
                                      ..setEntry(3, 2, 0.002)
                                      ..rotateY(1.8 * fixRotation)
                                      ..translate(-rotation * size.width * 1.8)
                                      ..scale(1 + rotation),
                                    child: Image.asset(
                                      book.image,
                                      fit: BoxFit.cover,
                                      height: bookHeight,
                                      width: bookWidth,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Opacity(
                              opacity: 1 - rotation,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    book.title,
                                    style: const TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'By ${book.author}',
                                    style: const TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 20),
                                    child: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Risus, tempus iaculis risus ut adipiscing vitae tincidunt. Risus, tempus iaculis risus ut adipiscing vitae tincidunt.',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.grey,
                                          fontSize: 12,
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.normal),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.bookmark,
          color: Colors.black87,
          size: 28,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

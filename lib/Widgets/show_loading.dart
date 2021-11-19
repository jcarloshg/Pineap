import 'package:flutter/material.dart';

class ShowLoading extends StatefulWidget {
  ShowLoading({Key? key, required this.message}) : super(key: key);

  String message;

  @override
  _ShowLoadingState createState() => _ShowLoadingState();
}

class _ShowLoadingState extends State<ShowLoading>
    with TickerProviderStateMixin {
  // animation loading
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.message,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(width: 15, height: 16),
                CircularProgressIndicator(
                  color: Colors.amber,
                  value: controller.value,
                  semanticsLabel: 'Linear progress indicator',
                ),
              ],
            ),
          )),
    );
  }
}

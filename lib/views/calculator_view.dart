import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x = 0;
  int y = 0;
  num ans = 0;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();

    _listener = AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onInactive: _onInactive,
      onRestart: _onRestart,
      onResume: _onResume,
      onPause: _onPause,
      onStateChange: _onStateChange,
      // onExitRequested: _onExitRequested,
    );
  }

  void _onShow() {
    print("onShow");
  }

  void _onHide() {
    print("onHide");
  }

  void _onInactive() {
    print("onInactive");
  }

  void _onRestart() {
    print("onRestart");
  }

  void _onResume() {
    print("onResume");
  }

  void _onPause() {
    print("onPause");
  }

  void _onStateChange(AppLifecycleState state) {
    print("onStateChange");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    displayOneController.dispose();
    displayTwoController.dispose();
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          CalculatorDisplay(
              hint: "Enter first number", controller: displayOneController),
          const SizedBox(
            height: 30,
          ),
          CalculatorDisplay(
              hint: "Enter second number", controller: displayTwoController),
          Text(
            ans.toString(),
            style: const TextStyle(fontSize: 40, color: Colors.black),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      ans = num.tryParse(displayOneController.text)! +
                          num.tryParse(displayTwoController.text)!;
                    });
                  },
                  child: const Icon(Icons.add)),
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      ans = num.tryParse(displayOneController.text)! -
                          num.tryParse(displayTwoController.text)!;
                    });
                  },
                  child: const Icon(CupertinoIcons.minus)),
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      ans = num.tryParse(displayOneController.text)! *
                          num.tryParse(displayTwoController.text)!;
                    });
                  },
                  child: const Icon(CupertinoIcons.multiply)),
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      ans = num.tryParse(displayOneController.text)! *
                          num.tryParse(displayTwoController.text)!;
                    });
                  },
                  child: const Icon(CupertinoIcons.divide)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                x = 0;
                y = 0;
                ans = 0;
                displayOneController.clear();
                displayTwoController.clear();
              });
            },
            label: const Text("Clear"),
          )
          //calculator display
          //Expand
          // calculator button
        ],
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay(
      {super.key, this.hint = "Enter a number", required this.controller});

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 3.0),
              borderRadius: BorderRadius.circular(10)),
          border: const OutlineInputBorder(),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white)),
    );
  }
}

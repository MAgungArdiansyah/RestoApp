import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:resto/style/style.dart';

class CustomDialogHome extends StatefulWidget {
  final String header;
  final String detail;
  final String lottie;

  const CustomDialogHome(
      {Key? key,
      required this.header,
      required this.detail,
      required this.lottie})
      : super(key: key);

  @override
  State<CustomDialogHome> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialogHome>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 0,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: _size.width,
            padding:
                const EdgeInsets.only(top: 32, bottom: 0, left: 8, right: 8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.header,
                  textAlign: TextAlign.center,
                  style: lightTheme.headline6,
                ),
                Text(
                  widget.detail,
                  textAlign: TextAlign.center,
                  style: lightTheme.bodyText2,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Okay'))
              ],
            ),
          ),
          Positioned(
              top: -28,
              child: CircleAvatar(
                  minRadius: 16,
                  maxRadius: 28,
                  backgroundColor: primaryColor,
                  child: Lottie.asset(widget.lottie,
                      controller: controller,
                      repeat: false,
                      onLoaded: (composition) => controller.forward())))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:resto/style/style.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 32, bottom: 12, left: 8, right: 8),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Fail',
                  textAlign: TextAlign.center,
                  style: lightTheme.headline6,
                ),
                Text(
                  'The email address is badly formatted\nPlease check your e-mail',
                  textAlign: TextAlign.center,
                  style: lightTheme.bodyText2,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Okay'))
              ],
            ),
          ),
          const Positioned(
              top: -28,
              child: CircleAvatar(
                minRadius: 16,
                maxRadius: 28,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.check,
                  size: 28,
                  color: Colors.white,
                ),
              ))
        ],
      ),
    );
  }
}

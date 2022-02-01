import 'package:flutter/material.dart';
import 'package:resto/screen/accountpage/widget/customDialog.dart';
import 'package:resto/style/style.dart';

class PhotoProfile extends StatelessWidget {
  const PhotoProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          ClipOval(
            child: Material(
              color: Colors.transparent,
              child: Ink.image(
                image: AssetImage('assets/images/man.png'),
                fit: BoxFit.cover,
                width: 128,
                height: 128,
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          child: Image.asset(
                            'assets/images/man.png',
                            width: 200,
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                        );
                      },
                    );
                  },
                  splashColor: secondaryColor,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 10,
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => CustomDialog(
                      header: 'Coming Soon',
                      detail: 'Stay tune guys',
                      lottie: 'assets/json/coming_soon.json'),
                );
              },
              child: ClipOval(
                child: Container(
                  padding: const EdgeInsets.all(3),
                  color: primaryColor,
                  child: ClipOval(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: secondaryColor,
                      child: const Icon(
                        Icons.edit,
                        size: 20,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

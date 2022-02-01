import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resto/screen/accountpage/widget/app_bar.dart';
import 'package:resto/screen/accountpage/widget/custom_dialog.dart';
import 'package:resto/screen/accountpage/widget/photo_profile.dart';
import 'package:resto/screen/accountpage/widget/user_stats.dart';
import 'package:resto/screen/loginregister/login.dart';
import 'package:resto/screen/loginregister/widget/loading.dart';
import 'package:resto/services/auth.dart';
import 'package:resto/services/database.dart';
import 'package:resto/style/style.dart';

class AccountPage extends StatefulWidget {
  static const routeName = '/account_page';
  
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final AuthServices _authServices = AuthServices();
  final DatabaseServices _databaseServices =
      DatabaseServices();

  @override
  Widget build(BuildContext context) {
    _databaseServices.id = _authServices.currentUser;
    final Size _size = MediaQuery.of(context).size;
    
    return StreamBuilder<DocumentSnapshot>(
        stream: _databaseServices.user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            
            return SafeArea(
                child: Scaffold(
                    appBar: buildAppbar(context),
                    body: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        const PhotoProfile(),
                        SizedBox(
                          height: _size.height * 0.01,
                        ),
                        Column(
                          children: [
                            Text(
                              'Welecome',
                              style: darkTheme.subtitle1,
                            ),
                            Text(
                              snapshot.data!['name'],
                              //'hello',
                              style: darkTheme.subtitle2,
                            ),
                            SizedBox(
                              height: _size.height * 0.009,
                            ),
                            Text(
                              snapshot.data!['email'],
                              style: darkTheme.bodyText2,
                            ),
                            SizedBox(
                             height: _size.height * 0.01,
                            ),
                            Text(
                              'E-Money : 0',
                              style: darkTheme.subtitle1,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _size.height * 0.02,
                        ),
                        const UpgradeButton(),
                        SizedBox(
                          height: _size.height * 0.02,
                        ),
                        const UserStats(),
                        SizedBox(
                          height: _size.height * 0.04,
                        ),
                        Column(
                          children: [
                            SizedBox(
                                width: _size.width * 0.9,
                                child: Divider(
                                  color: secondaryColor,
                                  thickness: 0.5,
                                )),
                            OtherButton(
                              iconData: Icons.credit_card_rounded,
                              name: 'Credit or Debit Card',
                              onpressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => const CustomDialog(
                                        header: 'Cooming Soon',
                                        detail: 'Stay tune guys',
                                        lottie:
                                            'assets/json/coming_soon.json'));
                              },
                            ),
                            SizedBox(
                                width: _size.width * 0.9,
                                child: Divider(
                                  color: secondaryColor,
                                  thickness: 0.5,
                                )),
                            OtherButton(
                                iconData: Icons.person_outline_rounded,
                                name: 'Personal Detail',
                                onpressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => const CustomDialog(
                                          header: 'Cooming Soon',
                                          detail: 'Stay tune guys',
                                          lottie:
                                              'assets/json/coming_soon.json'));
                                }),
                            SizedBox(
                                width: _size.width * 0.9,
                                child: Divider(
                                  color: secondaryColor,
                                  thickness: 0.5,
                                )),
                            OtherButton(
                                iconData: Icons.settings,
                                name: 'Settings',
                                onpressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) =>const CustomDialog(
                                          header: 'Cooming Soon',
                                          detail: 'Stay tune guys',
                                          lottie:
                                              'assets/json/coming_soon.json'));
                                }),
                            SizedBox(
                                width: _size.width * 0.9,
                                child: Divider(
                                  color: secondaryColor,
                                  thickness: 0.5,
                                )),
                            MaterialButton(
                              height: 50,
                              splashColor: secondaryColor,
                              onPressed: () async {
                                await _authServices.signOut();
                                Navigator.pushReplacementNamed(
                                    context, LoginPage.routeName);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Container(
                                      padding: const EdgeInsets.all(3),
                                      color: Colors.red.withOpacity(0.2),
                                      child: ClipOval(
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          //color: Colors.red.withOpacity(0.01),
                                          child: const Icon(
                                            Icons.logout_rounded,
                                            size: 20,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Log Out',
                                    style: darkTheme.button,
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    )));
          } else {
            return const Loading();
          }
        });
  }
}

class OtherButton extends StatefulWidget {
  final IconData iconData;
  final String name;
  final VoidCallback onpressed;

  const OtherButton({
    Key? key,
    required this.iconData,
    required this.name,
    required this.onpressed,
  }) : super(key: key);

  @override
  State<OtherButton> createState() => _OtherButtonState();
}

class _OtherButtonState extends State<OtherButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      splashColor: secondaryColor,
      onPressed: widget.onpressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipOval(
            child: Container(
              padding: const EdgeInsets.all(3),
              color: primaryColor,
              child: ClipOval(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: secondaryColor,
                  child: Icon(
                    widget.iconData,
                    size: 20,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            widget.name,
            style: darkTheme.button,
          )
        ],
      ),
    );
  }
}



class UpgradeButton extends StatelessWidget {
  const UpgradeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => const CustomDialog(
                    header: 'Cooming Soon',
                    detail: 'Stay tune guys',
                    lottie: 'assets/json/coming_soon.json'));
          },
          child: Text(
            'Upgrade to PRO',
            style: lightTheme.button,
          )),
    );
  }
}



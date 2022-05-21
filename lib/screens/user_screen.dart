import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/components/common/text_widget.dart';
import 'package:provider/provider.dart';

import '../components/user/user_list_tile.dart';
import '../providers/dark_theme_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController = TextEditingController();

  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<DarkThemeProvider>();
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Hi, ",
                    style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: "MyName",
                        style: TextStyle(
                            color: color,
                            fontSize: 27,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("My name is pressed");
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextWidget(text: "Email@email.com", color: color, textSize: 18),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                UserListTile(
                  leading: IconlyLight.profile,
                  title: "Address",
                  subtitle: "My subtitle",
                  onPressed: _showAddressDialog,
                ),
                UserListTile(
                  leading: IconlyLight.bag,
                  title: "Orders",
                ),
                UserListTile(
                  leading: IconlyLight.heart,
                  title: "Wishlist",
                ),
                UserListTile(
                  leading: IconlyLight.unlock,
                  title: "Forgot password",
                ),
                SwitchListTile(
                  title: TextWidget(
                    text: themeState.getDarkTheme ? "Dark Mode" : "Light Mode",
                    color: color,
                    textSize: 18,
                  ),
                  secondary: themeState.getDarkTheme
                      ? const Icon(Icons.dark_mode_outlined)
                      : const Icon(Icons.light_mode_outlined),
                  onChanged: (bool value) {
                    themeState.setDarkTheme = value;
                  },
                  value: themeState.getDarkTheme,
                ),
                UserListTile(
                  leading: IconlyLight.logout,
                  title: "Log out",
                  onPressed: _showLogoutDialog,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Update"),
          content: TextField(
            onChanged: (String value) {},
            controller: _addressTextController,
            maxLines: 5,
            decoration: const InputDecoration(hintText: "Your address"),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showLogoutDialog() async {
    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset(
                "assets/images/warning-sign.png",
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("Sign Out")
            ],
          ),
          content: const Text("Do you wanna sign out?"),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: TextWidget(
                color: Colors.cyan,
                text: "Cancel",
                textSize: 18,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: TextWidget(
                color: Colors.red,
                text: "OK",
                textSize: 18,
              ),
            ),
          ],
        );
      },
    );
  }
}

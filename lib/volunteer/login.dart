import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/components/dynamic_background_screen.dart';
import 'package:ming_guang/volunteer/themes/main_theme.dart';
import 'package:ming_guang/volunteer/view_model/login_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginModel model = LoginModel();
  bool _isLoading = false;

  void _login() async {
    setState(() => _isLoading = true);

    final String username = _usernameController.text;
    final String password = _passwordController.text;
    const int type = 3; // Volunteer app

    try {
      final bool result = await model.login(username, password, type, context);

      if (mounted) {
        setState(() => _isLoading = false);

        if (result) {
          showSuccess(); // Show success message
          model.navigateToMain(context);
        } else {
          showFailure('登陆失败：错误的用户名或密码'); // Show failure message
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        showFailure(
            'Login Failed: ${e.toString()}'); // Show failure message with exception
      }
    }
  }

  void showSuccess() {
    final snackBar = SnackBar(
      content: const Text('登陆成功!'),
      backgroundColor: appBarColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showFailure(String errorMessage) {
    final snackBar = SnackBar(
      content: Text(errorMessage),
      backgroundColor: highlight,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(backgroundColor: appBarColor, title: const Text('志愿者端登陆')),
      body: Stack(
        children: [
          const DynamicBackgroundScreen(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "明光筑梦",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: size.width * 0.11,
                          letterSpacing: 1,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 1.1
                            ..color = highlight,
                        ),
                      ),
                      Text(
                        "志愿者",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: highlight,
                          fontSize: size.width * 0.11,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.width * 0.1,
                ),
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: '用户名',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: '密码',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 24.0,
                  width: size.width,
                  child: const Padding(
                    padding: EdgeInsets.only(left:15.0,top: 7.0),
                    child: Text(
                      "忘记密码...",
                      style: TextStyle(
                        fontSize: 10,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(appBarColor),
                  ),
                  onPressed: _isLoading ? null : _login,
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('确定'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

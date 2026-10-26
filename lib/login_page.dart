import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    print("LoginPage: initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("LoginPage: didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant LoginPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("LoginPage: didUpdateWidget");
  }

  @override
  void deactivate() {
    print("LoginPage: deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    print("LoginPage: dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("LoginPage: build");
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Part 2: Navigator.pushNamed (Commented out for go_router part)
            // Navigator.of(context).pushNamed("/products", arguments: "Guest");

            // Part 3: go_router context.goNamed (Login -> Products, clearing stack so user can't go back to login)
            context.goNamed("products", queryParameters: {"user": "Guest"});
          },
          child: Text("Login as Guest"),
        ),
      ),
    );
  }
}
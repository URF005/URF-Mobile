import 'package:firstapp/utils/routes.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>();
  movetohome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await (Future.delayed(const Duration(seconds: 1)));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.home);
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10.0),
              const Text(
                "Welcome",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                name,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 9, horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        }),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Material(
                color: Colors.black,
                borderRadius: BorderRadius.circular(changebutton ? 50 : 20),
                child: InkWell(
                  onTap: () => movetohome(context),
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: changebutton ? 37 : 80,
                    height: 34,
                    alignment: Alignment.center,
                    child: changebutton
                        ? const Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : const Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                  ),
                ),
              )
              // ElevatedButton(
              //   style: TextButton.styleFrom(
              //       minimumSize: const Size(25, 35),
              //       foregroundColor: Colors.white,
              //       backgroundColor: Colors.black),
              //   child: const Text("Login", style: TextStyle(fontSize: 17)),
              //   onPressed: () {
              //     Navigator.pushNamed(context, MyRoutes.home);
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}

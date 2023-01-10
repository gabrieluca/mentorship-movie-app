import 'package:flutter/material.dart';
import 'constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isObscure = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? errorTextEmail;
  String? errorTextPassword;
  final nodePassword = FocusNode();
  final String textPassword = 'Must have at least 8 characters';

  String? get errorTextEmailOn {
    if (emailController.value.text.isEmpty) {
      return 'Can\'t be empty';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: [
            SizedBox(
              width: sizeWidth,
              height: sizeHeight,
              child: Image.asset(
                'assets/images/fundo_pipoca.jpg',
                fit: BoxFit.cover,
                opacity: kImageOpacity,
              ),
            ),
            Center(
              child: SingleChildScrollView(
                padding: kCenterPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text('Filmes Flutter', style: kTitleTextStyle),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 30.0, color: Colors.blue.shade100),
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: 'name@example.com',
                        labelText: 'E-mail',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade600, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: kTFBorderSide,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorText: errorTextEmail,
                      ),
                      onTap: () {
                        errorTextEmail = errorTextEmailOn;
                      },
                      onChanged: (value) {
                        setState(() {
                          errorTextEmail = errorTextEmailOn;
                        });
                      },
                      onEditingComplete: () {
                        setState(() {
                          FocusScope.of(context).requestFocus(nodePassword);
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: passwordController,
                      focusNode: nodePassword,
                      obscureText: isObscure,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                        ),
                        labelText: 'Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade600, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: kTFBorderSide,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorText: errorTextPassword,
                      ),
                      onChanged: (value) {
                        setState(() {
                          (passwordController.value.text.length < 8)
                              ? errorTextPassword = textPassword
                              : errorTextPassword = null;
                        });
                      },
                      onEditingComplete: () {
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                        });
                      },
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: kButtonSize,
                        elevation: 5.0,
                        disabledBackgroundColor: Colors.grey,
                        shadowColor: Colors.black,
                      ),
                      onPressed: (emailController.value.text.isEmpty ||
                              passwordController.value.text.length < 8)
                          ? null
                          : (() {
                              setState(() {});
                            }),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

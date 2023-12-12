import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/colors.dart';
import 'components/snackbar_widget.dart';
import 'components/text_button.dart';
import 'components/text_form_field.dart';
import 'home_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Log in",
          style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),
        ),
        backgroundColor:  Colors.deepPurple[300],
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.only(
                  right: 12.0,
                  left: 12.0,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Log In",
                      style: TextStyle(
                          fontSize: 30,
                          color:  lightBlack,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                        hint: "Email addresse  ",
                        txt: emailController,
                        widget: Icon(
                          Icons.email,
                          color:  lightBlack,
                        ),
                        type: TextInputType.emailAddress,
                        obscure: false,
                        formatter: [
                          FilteringTextInputFormatter.allow(
                              RegExp('[a-zA-Z || @ || . || 0-9]')),
                        ]
                        //  true
                        ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                        hint: "Password ",
                        txt: passwordController,
                        widget: Icon(
                          Icons.password,
                          color:  lightBlack,
                        ),
                        type: TextInputType.text,
                        obscure: true,
                        formatter: [
                          FilteringTextInputFormatter.allow(
                              RegExp('[a-zA-Z || 0-9]')),
                        ]
                        //false
                        ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        TextButtonView(
                          pad: 18,
                          font: 19.0,
                          press: () {
                            if (!_formKey.currentState!.validate()) {
                              SnackBarWidget(
                                      context: context,
                                      txt: 'Please Fill Empty Fields !',
                                      color: Colors.red)
                                  .makeSnackBar();
                            } else {
                              _formKey.currentState!.save();

                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                  (Route<dynamic> route) => false);
                            }
                          },
                          txt: "Login",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'haven\'t acount?',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color:  lightBlack),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupScreen()));
                          },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

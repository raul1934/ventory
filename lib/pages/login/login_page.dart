import '../../constaints.dart';
import '../../pages/login/login_controller.dart';
import '../../shared/components/logo.dart';
import '../../shared/components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        foregroundColor: textColor,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            const Logo(),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              width: size.width * 0.8,
              child: const Text(
                "Para fazer login preencha as informações abaixo",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xff6C6E71),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.08,
            ),
            Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        initialValue: "marcia.silva@shieldcompany.com.br",
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: textColor, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: textColor, width: 1.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: textColor, width: 1.0),
                          ),
                          focusColor: textColor,
                          fillColor: textColor,
                          labelText: 'Email',
                          floatingLabelStyle: TextStyle(color: textColor),
                        ),
                        cursorColor: textColor,
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.disabled,
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(),
                        focusNode: _emailFocusNode,
                        onSaved: (text) =>
                            _loginController.setEmail(text.toString()),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: "123456",
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: textColor, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: textColor, width: 1.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: textColor, width: 1.0),
                          ),
                          focusColor: textColor,
                          fillColor: textColor,
                          labelText: 'Senha',
                          floatingLabelStyle: TextStyle(color: textColor),
                        ),
                        cursorColor: textColor,
                        keyboardType: TextInputType.visiblePassword,
                        style: const TextStyle(),
                        focusNode: _passwordFocusNode,
                        onSaved: (text) =>
                            _loginController.setPassword(text.toString()),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Obx(() => PrimaryButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              _loginController.login();
                            }
                          },
                          child: _loginController.loading.value
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  "Login",
                                  style: TextStyle(fontSize: 24),
                                )))
                    ]))
          ],
        ),
      ),
    );
  }
}

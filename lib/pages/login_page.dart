import 'package:flutter/material.dart';
import 'package:spacer/theme.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FToast fToast;
  final password = TextEditingController(text: '');
  final email = TextEditingController(text: '');
  bool isPasswordError = false;
  bool isCheckBox = false;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast = FToast();
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          title(),
          inputEmail(),
          inputPassword(),
          rememberCheckbox(),
          loginButton(),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 24),
              child: Text(
                'OR',
                style: greyTextStle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          loginWithGoogleButton(),
          registerButton(),
        ],
      ),
    );
  }

  Widget title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 84),
          child: Text(
            'Login to your\naccount',
            style: blackTextStyle.copyWith(
              fontWeight: bold,
              fontSize: 24,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Container(
              height: 4,
              width: 84,
              margin: const EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: kBlackColor),
            ),
            Container(
              height: 4,
              width: 8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: kBlackColor),
            ),
          ],
        )
      ],
    );
  }

  Widget inputEmail() {
    return Container(
      margin: const EdgeInsets.only(top: 48),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: kWhiteGreyColor, borderRadius: BorderRadius.circular(14)),
      child: TextFormField(
        controller: email,
        decoration: InputDecoration.collapsed(
            hintText: 'Email',
            hintStyle: greyTextStle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            )),
      ),
    );
  }

  Widget inputPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 32),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: kWhiteGreyColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Password',
                    hintStyle: greyTextStle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.remove_red_eye_outlined,
                color: kGreyColor,
              ),
            ],
          ),
        ),
        if (isPasswordError)
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              'Password kamu salah',
              style: redTextStyle.copyWith(fontSize: 14, fontWeight: regular),
            ),
          )
      ],
    );
  }

  Widget rememberCheckbox() {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Checkbox(
              value: isCheckBox,
              onChanged: (value) {
                setState(() {
                  isCheckBox = value!;
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            'Remember me',
            style: TextStyle(
              fontSize: 16,
              color: kBlackColor,
              fontWeight: regular,
            ),
          )
        ],
      ),
    );
  }

  Widget loginButton() {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      height: 56,
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          setState(() {
            isLoading = true;
          });

          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              isLoading = false;
            });

            if (password.text != '12345') {
              setState(() {
                isPasswordError = true;
              });
              FToast().showToast(
                child: errorToast(),
                toastDuration: const Duration(seconds: 3),
                gravity: ToastGravity.BOTTOM,
              );
            } else {
              Navigator.pushNamed(context, '/home');
            }
          });
        },
        child: isLoading
            ? CircularProgressIndicator(
                color: kWhiteColor,
                backgroundColor: kGreyColor,
              )
            : Text(
                'Login',
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
        style: TextButton.styleFrom(
          backgroundColor: kBlackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }

  Widget loginWithGoogleButton() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      height: 56,
      width: double.infinity,
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Login with Google',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14))),
      ),
    );
  }

  Widget registerButton() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don’t have an account?',
            style: greyTextStle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Register',
                style: blueTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                )),
          )
        ],
      ),
    );
  }

  Widget errorToast() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: kRedColor, borderRadius: BorderRadius.circular(10)),
      child: Text(
        "Password Salah",
        style: whiteTextStyle.copyWith(
          fontSize: 16,
          fontWeight: semiBold,
        ),
      ),
    );
  }
}

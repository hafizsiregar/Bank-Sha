import 'package:bank_sha/shared/shared_methods.dart';
import 'package:flutter/material.dart';
import '../../../shared/theme.dart';
import '../../widgets/buttons.dart';
import '../../widgets/forms.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if(nameController.text.isEmpty || 
        emailController.text.isEmpty || 
        passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: <Widget>[
            Container(
              height: 50,
              width: 155,
              margin: const EdgeInsets.symmetric(vertical: 100),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img_logo_light.png'))),
            ),
            Text(
              'Join Us to Unlock\nYour Growth',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(22),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: whiteColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! NOTE: FULL NAME INPUT
                   CustomForm(
                    title: 'Full Name',
                    controller: nameController,
                  ),
                  const SizedBox(height: 16),
                  //! NOTE: EMAIL INPUT
                  CustomForm(
                    title: 'Email Address',
                    controller: emailController,
                  ),
                  const SizedBox(height: 16),
                  //! NOTE: PASSWORD INPUT
                  CustomForm(
                    title: 'Password',
                    obscureText: true,
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomFilleButton(
                    title: 'Continue',
                    onPressed: () {
                      if(validate()) {
                        Navigator.pushNamed(context, '/sign-up-upload');
                      } else {
                        showCustomSnackbar(
                          context,
                          'Semua kolom harus diisi!'
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextWidget(
              title: 'Sign In',
              onPressed: () {
                Navigator.pushNamed(context, '/sign-in');
              },
            ),
            const SizedBox(height: 55),
          ],
        ),
      ),
    );
  }
}
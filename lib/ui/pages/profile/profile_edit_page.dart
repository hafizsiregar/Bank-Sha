import 'package:flutter/material.dart';
import '../../../shared/theme.dart';
import '../../widgets/buttons.dart';
import '../../widgets/forms.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: blackColor),
            onPressed: () {
              Navigator.pop(context, true);
            }),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: <Widget>[
          const SizedBox(height: 30),
          Container(
              padding: EdgeInsets.all(22),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: whiteColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! NOTE: USERNAME INPUT
                   CustomForm(
                    title: 'Username',
                  ),
                  const SizedBox(height: 16),
                  //! NOTE: FULL NAME INPUT
                   CustomForm(
                    title: 'Full Name',
                  ),
                  const SizedBox(height: 16),
                  //! NOTE: EMAIL INPUT
                  CustomForm(
                    title: 'Email Address',
                  ),
                  const SizedBox(height: 16),
                  //! NOTE: PASSWORD INPUT
                  CustomForm(
                    title: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomFilleButton(
                    title: 'Update Now',
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, '/profile-edit-success', (route) => false);
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
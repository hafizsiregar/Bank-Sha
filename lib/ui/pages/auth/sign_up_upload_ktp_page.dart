import 'package:bank_sha/models/sign_up_form_model.dart';
import 'package:flutter/material.dart';
import '../../../shared/theme.dart';
import '../../widgets/buttons.dart';

class SignUpUploadKtpPage extends StatelessWidget {
  final SignUpFormModel data;
  const SignUpUploadKtpPage({
    required this.data,
    super.key
  });

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
              'Verify Your\nAccount',
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
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightBackgroundColor,
                    ),
                    child: Center(
                      child: Image.asset('assets/ic_upload.png'),
                    ),
                  ),
                  // Container(
                  //   height: 120,
                  //   width: 120,
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     image: DecorationImage(
                  //       fit: BoxFit.cover,
                  //       image: AssetImage('assets/img_profile.png')
                  //     )
                  //   ),
                  // ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('Passport/ID Card',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium
                  )),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomFilleButton(
                    title: 'Continue',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            CustomTextWidget(
              title: 'Skip for Now',
              onPressed: () {
                Navigator.pushNamed(context, '/sign-up-success');
              },
            ),
          ],
        ),
      ),
    );
  }
}

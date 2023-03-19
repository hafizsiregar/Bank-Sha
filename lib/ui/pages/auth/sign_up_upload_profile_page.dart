import 'dart:convert';
import 'dart:io';

import 'package:bank_sha/models/sign_up_form_model.dart';
import 'package:bank_sha/ui/pages/auth/sign_up_upload_ktp_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../shared/shared_methods.dart';
import '../../../shared/theme.dart';
import '../../widgets/buttons.dart';
import '../../widgets/forms.dart';

class SignUpUploadProfilePage extends StatefulWidget {
  final SignUpFormModel data;
  const SignUpUploadProfilePage({
    required this.data,
    super.key
  });

  @override
  State<SignUpUploadProfilePage> createState() => _SignUpUploadProfilePageState();
}

class _SignUpUploadProfilePageState extends State<SignUpUploadProfilePage> {

  final pinController = TextEditingController(text: '');
  XFile? selectedImage;

  bool validate() {
    if(pinController.text.length != 6) {
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
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: whiteColor),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      final image = await selectImages();
                      setState(() {
                        selectedImage = image;
                      });
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: lightBackgroundColor,
                        image: selectedImage == null
                        ? null
                        : DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(
                          File(selectedImage!.path),
                        ),
                      ),
                      ),
                      child: selectedImage != null ?
                      null
                      : Center(
                        child: Image.asset('assets/ic_upload.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('Shayna Hanna',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium
                  )),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomForm(
                    title: 'Set PIN (6 digit number)',
                    obscureText: true,
                    controller: pinController,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomFilleButton(
                    title: 'Continue',
                    onPressed: () {
                      if(validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignUpUploadKtpPage(data: widget.data.copyWith(
                                pin: pinController.text,
                                profilePicture: selectedImage == null ? null :
                                'data:image/png;base64,${base64Encode(File(selectedImage!.path).readAsBytesSync())}'
                              ));
                            }
                          )
                        );
                      } else {
                        showCustomSnackbar(context, 'PIN Harus Terdiri dari 6 Digit!');
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

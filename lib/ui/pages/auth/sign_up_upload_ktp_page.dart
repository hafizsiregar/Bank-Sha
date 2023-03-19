import 'dart:io';
import 'package:bank_sha/models/sign_up_form_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../shared/shared_methods.dart';
import '../../../shared/theme.dart';
import '../../widgets/buttons.dart';

class SignUpUploadKtpPage extends StatefulWidget {
  final SignUpFormModel data;
  const SignUpUploadKtpPage({
    required this.data,
    super.key
  });

  @override
  State<SignUpUploadKtpPage> createState() => _SignUpUploadKtpPageState();
}

class _SignUpUploadKtpPageState extends State<SignUpUploadKtpPage> {
  
  XFile? selectedImage;

  bool validete() {
    if(selectedImage == null) {
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
                    onPressed: () {
                      if(validete()) {
                        
                      } else {
                        showCustomSnackbar(context, 'Gambar Tidak Boleh Kosong');
                      }
                    },
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

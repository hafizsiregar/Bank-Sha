import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import '../../../shared/theme.dart';
import '../../widgets/buttons.dart';

class ProfileEditPinPage extends StatelessWidget {
  const ProfileEditPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Edit PIN',
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
                  //! NOTE: Old PIN INPUT
                   CustomForm(
                    title: 'Old PIN',
                  ),
                  const SizedBox(height: 16),
                  //! NOTE: New PIN INPUT
                   CustomForm(
                    title: 'New PIN',
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
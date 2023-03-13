import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:bank_sha/ui/widgets/transfer_recent_user_item.dart';
import 'package:bank_sha/ui/widgets/transfer_result_user_item.dart';
import 'package:flutter/material.dart';
import '../../../shared/theme.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildRecentUsers() {
      return Container(
        margin: const EdgeInsets.only(
          top: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Users',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            const TransferRecentUserItem(
              name: 'Yona Jie', 
              imageUrl: 'assets/img_friend1.png', 
              username: 'yoenna', 
              isVerified: true
            ),
            const TransferRecentUserItem(
              name: 'John Hi', 
              imageUrl: 'assets/img_friend2.png', 
              username: 'johnhi', 
            ),
            const TransferRecentUserItem(
              name: 'Rifqi Eka', 
              imageUrl: 'assets/img_friend3.png', 
              username: 'rifqieh', 
            ),
          ],
        ),
      );
    }

    Widget buildResult() {
      return Container(
        margin: const EdgeInsets.only(
          top: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Result',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Wrap(
              spacing: 17, 
              runSpacing: 17,
              children: const [
                TransferResultUserItem(
                name: 'Rifqi Eka', 
                imageUrl: 'assets/img_friend1.png', 
                username: 'rifqieh',
                isVerified: true, 
              ),
              TransferResultUserItem(
                name: 'Rifqi Eka', 
                imageUrl: 'assets/img_friend2.png', 
                username: 'rifqieh',
                isVerified: true, 
              ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Transfer',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          Text(
            'Search',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const CustomForm(
            title: 'by username',
            isShowTitle: false,
          ),
          // buildRecentUsers(),
          buildResult(),
          const SizedBox(
            height: 274,
          ),
          CustomFilleButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/transfer-amount');
            },
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

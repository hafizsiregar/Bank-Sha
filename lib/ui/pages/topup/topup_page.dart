import 'package:bank_sha/ui/widgets/bank_item.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import '../../../shared/theme.dart';

class TopupPage extends StatelessWidget {
  const TopupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Top Up',
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
          Text(
            'Wallet',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Image.asset('assets/img_wallet.png',
              width: 80,
              ),
              const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('8008 2208 1996',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
              ),
              const SizedBox(
            height: 2,
          ),
          Text('Angga Risky',
              style: greyTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
              ),
            ],
          ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text('Select Bank',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
              ),
          const SizedBox(
            height: 14,
          ),
          const BankItem(
            title: 'BANK BCA',
            imageUrl: 'assets/img_bank_bca.png',
            isSelected: true,
          ),
          const BankItem(
            title: 'BANK BNI',
            imageUrl: 'assets/img_bank_bni.png',
          ),
          const BankItem(
            title: 'BANK OCBC',
            imageUrl: 'assets/img_bank_ocbc.png',
          ),
          const SizedBox(
            height: 12,
          ),
          CustomFilleButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/topup-amount');
            },
          ),
          const SizedBox(
            height: 57,
          ),
        ],
      ),
    );
  }
}
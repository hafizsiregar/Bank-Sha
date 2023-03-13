import 'package:bank_sha/ui/widgets/package_item.dart';
import 'package:flutter/material.dart';
import '../../../shared/theme.dart';
import '../../widgets/buttons.dart';
import '../../widgets/forms.dart';

class DataPackagePage extends StatelessWidget {
  const DataPackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Paket Data',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24
        ),
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          Text(
            'Phone Number',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const CustomForm(
            title: '+628',
            isShowTitle: false,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Package',
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
                PackageItem(
                  amount: 10,
                  price: 100000,
                ),
                PackageItem(
                  amount: 25,
                  price: 200000,
                  isSelected: true,
                ),
                PackageItem(
                  amount: 40,
                  price: 400000,
                ),
                PackageItem(
                  amount: 99,
                  price: 1000000,
                ),
              ],
            ),
            const SizedBox(
            height: 85,
          ),
           CustomFilleButton(
            title: 'Continue',
            onPressed: () async {
              if(await Navigator.pushNamed(context, '/pin') == true) {
                Navigator.pushNamedAndRemoveUntil(context, '/data-success', (route) => false);
              }
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
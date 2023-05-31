import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/home_latest_transaction_item.dart';
import 'package:bank_sha/ui/widgets/home_service_item.dart';
import 'package:bank_sha/ui/widgets/home_tips_item.dart';
import 'package:bank_sha/ui/widgets/home_user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/shared_methods.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildProfile() {
      return BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Howdy',
                        style: greyTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        state.user.name.toString(),
                        style: blackTextStyle.copyWith(
                            fontSize: 20, fontWeight: semiBold),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: state.user.profilePicture == null
                                ? const AssetImage('assets/img_profile.png')
                                : NetworkImage(state.user.profilePicture!)
                                    as ImageProvider,
                          ),
                        ),
                        child: state.user.verified == 1
                            ? Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: whiteColor),
                                  child: Center(
                                    child: Icon(Icons.check_circle,
                                        color: greenColor, size: 14),
                                  ),
                                ),
                              )
                            : null),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      );
    }

    Widget buildWalletCard() {
      return BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              width: double.infinity,
              height: 235,
              margin: const EdgeInsets.only(top: 30),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/img_bg_card.png',
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    state.user.name.toString(),
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    '**** **** **** ${state.user.cardNumber!.substring(12, 16)}',
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                      letterSpacing: 6,
                    ),
                  ),
                  const SizedBox(height: 21),
                  Text('Balance', style: whiteTextStyle),
                  Text(
                    formatCurrency(state.user.balance ?? 0),
                    style: whiteTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      );
    }

    Widget buildLevel() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
        ),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Level 1',
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
                const Spacer(),
                Text(
                  '55%',
                  style: greenTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(width: 3),
                Text(
                  'of ${formatCurrency(20000)}',
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(55),
              child: LinearProgressIndicator(
                value: 0.55,
                minHeight: 5,
                valueColor: AlwaysStoppedAnimation(greenColor),
                backgroundColor: lightBackgroundColor,
              ),
            ),
          ],
        ),
      );
    }

    Widget buildServices() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Do Something',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                HomeServiceItem(
                  iconUrl: 'assets/ic_topup.png',
                  title: 'Top Up',
                  onTap: () {
                    Navigator.pushNamed(context, '/topup');
                  },
                ),
                HomeServiceItem(
                  iconUrl: 'assets/ic_send.png',
                  title: 'Send',
                  onTap: () {},
                ),
                HomeServiceItem(
                  iconUrl: 'assets/ic_withdraw.png',
                  title: 'Withdraw',
                  onTap: () {},
                ),
                HomeServiceItem(
                  iconUrl: 'assets/ic_more.png',
                  title: 'More',
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const MoreDialog();
                        });
                  },
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget buildLatestTransaction() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Latest Transaction',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 14),
              padding: EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteColor,
              ),
              child: Column(
                children: <Widget>[
                  HomeLatestTransactionItem(
                      iconUrl: 'assets/ic_transaction_cat1.png',
                      title: 'Top Up',
                      time: 'Yesterday',
                      value: '+ ${formatCurrency(450000, symbol: '')}'),
                  HomeLatestTransactionItem(
                      iconUrl: 'assets/ic_transaction_cat2.png',
                      title: 'Cashback',
                      time: 'Sep 11',
                      value: '+ ${formatCurrency(22000, symbol: '')}'),
                  HomeLatestTransactionItem(
                      iconUrl: 'assets/ic_transaction_cat3.png',
                      title: 'Withdraw',
                      time: 'Sep 2',
                      value: '- ${formatCurrency(5000, symbol: '')}'),
                  HomeLatestTransactionItem(
                      iconUrl: 'assets/ic_transaction_cat4.png',
                      title: 'Transfer',
                      time: 'Aug 27',
                      value: '- ${formatCurrency(123500, symbol: '')}'),
                  HomeLatestTransactionItem(
                      iconUrl: 'assets/ic_transaction_cat5.png',
                      title: 'Electric',
                      time: 'Feb 18',
                      value: '- ${formatCurrency(12300000, symbol: '')}'),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget buildSendAgain() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Send Again',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const <Widget>[
                  HomeUserItem(
                    imageUrl: 'assets/img_friend1.png',
                    username: 'Yuanita',
                  ),
                  HomeUserItem(
                    imageUrl: 'assets/img_friend2.png',
                    username: 'Jani',
                  ),
                  HomeUserItem(
                    imageUrl: 'assets/img_friend3.png',
                    username: 'Urip',
                  ),
                  HomeUserItem(
                    imageUrl: 'assets/img_friend4.png',
                    username: 'Masa',
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget buildFriendlyTips() {
      return Container(
        margin: const EdgeInsets.only(top: 30, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Friendly Tips',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 14,
            ),
            Center(
              child: Wrap(
                spacing: 17,
                runSpacing: 18,
                children: const <Widget>[
                  HomeTipsItem(
                    imageUrl: 'assets/img_tips1.png',
                    title: 'Best tips for using a credit card',
                    url: 'https://www.google.com',
                  ),
                  HomeTipsItem(
                    imageUrl: 'assets/img_tips1.png',
                    title: 'Best tips for using a credit card',
                    url: 'https://www.google.com',
                  ),
                  HomeTipsItem(
                    imageUrl: 'assets/img_tips1.png',
                    title: 'Best tips for using a credit card',
                    url: 'https://www.google.com',
                  ),
                  HomeTipsItem(
                    imageUrl: 'assets/img_tips1.png',
                    title: 'Best tips for using a credit card',
                    url: 'https://www.google.com',
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            buildProfile(),
            buildWalletCard(),
            buildLevel(),
            buildServices(),
            buildLatestTransaction(),
            buildSendAgain(),
            buildFriendlyTips(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: whiteColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: whiteColor,
          selectedItemColor: blueColor,
          unselectedItemColor: blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle:
              blueTextStyle.copyWith(fontSize: 10, fontWeight: medium),
          unselectedLabelStyle:
              blackTextStyle.copyWith(fontSize: 10, fontWeight: medium),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_overview.png',
                width: 20,
                color: blueColor,
              ),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_history.png',
                width: 20,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_statistic.png',
                width: 20,
              ),
              label: 'Statistic',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_reward.png',
                width: 20,
              ),
              label: 'Reward',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: purpleColor,
        child: Image.asset(
          'assets/ic_plus_circle.png',
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class MoreDialog extends StatelessWidget {
  const MoreDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        height: 326,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: lightBackgroundColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Do More With Us',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 13,
            ),
            Wrap(
              spacing: 29,
              runSpacing: 25,
              children: <Widget>[
                HomeServiceItem(
                  iconUrl: 'assets/ic_product_data.png',
                  title: 'Data',
                  onTap: () {
                    Navigator.pushNamed(context, '/data-provider');
                  },
                ),
                HomeServiceItem(
                  iconUrl: 'assets/ic_product_water.png',
                  title: 'Water',
                  onTap: () {},
                ),
                HomeServiceItem(
                  iconUrl: 'assets/ic_product_stream.png',
                  title: 'Stream',
                  onTap: () {},
                ),
                HomeServiceItem(
                  iconUrl: 'assets/ic_product_movie.png',
                  title: 'Movie',
                  onTap: () {},
                ),
                HomeServiceItem(
                  iconUrl: 'assets/ic_product_food.png',
                  title: 'Food',
                  onTap: () {},
                ),
                HomeServiceItem(
                  iconUrl: 'assets/ic_product_tarvel.png',
                  title: 'Travel',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

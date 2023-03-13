import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class TransferResultUserItem extends StatelessWidget {
  // final UserModel user;
  final String name;
  final String imageUrl;
  final String username;
  final bool isVerified;
  final bool isSelected;

  const TransferResultUserItem({
    Key? key,
    // required this.user,
    required this.name,
    required this.imageUrl,
    required this.username,
    this.isVerified = false,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 175,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 22,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? blueColor : whiteColor,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image:
                    // user.profilePicture == null || user.profilePicture!.isEmpty
                    //     ? 
                        AssetImage(imageUrl)
                        // : 
                        // NetworkImage(
                        //     user.profilePicture!,
                        //   ) as ImageProvider,
              ),
            ),
            child:
            //  user.verified == 1
            //     ? 
            isVerified ? 
                Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check_circle,
                          color: greenColor,
                          size: 14,
                        ),
                      ),
                    ),
                  )
                : 
                null,
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            // user.name.toString(),
            name,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            // '@${user.username}',
            '@$username',
            style: greyTextStyle.copyWith(
              fontSize: 12,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

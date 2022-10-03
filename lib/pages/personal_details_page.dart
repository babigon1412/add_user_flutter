import 'package:add_user_flutter/providers/user_provider.dart';
import 'package:add_user_flutter/utils/app_colors.dart';
import 'package:add_user_flutter/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PersonalPage extends StatelessWidget {
  PersonalPage({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.email,
    required this.password,
    required this.position,
    required this.index,
  }) : super(key: key);

  String firstName;
  String lastName;
  String age;
  String email;
  String password;
  String position;
  int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueWhite,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: Consumer(builder: (context, UserProvider provider, child) {
        return Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: Dimensions.screenHeight / 1.6,
              child: Container(
                color: Colors.red,
              ),
            ),
            Positioned(
              top: Dimensions.screenHeight / 7,
              left: Dimensions.ten * 2.5,
              right: Dimensions.ten * 2.5,
              child: Container(
                height: Dimensions.ten * 50,
                width: Dimensions.screenWidth,
                padding: EdgeInsets.all(Dimensions.ten * 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.ten * 2),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      offset: const Offset(0, 5),
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: Dimensions.ten * 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${firstName} ${lastName}',
                            style: TextStyle(
                              color: AppColors.greyBlack,
                              fontSize: Dimensions.ten * 2.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: Dimensions.ten),
                          Icon(
                            Icons.add_reaction_sharp,
                            color: Colors.green[500],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimensions.ten * 0.05),
                    SvgPicture.asset(
                      'assets/images/profile.svg',
                      height: Dimensions.ten * 22,
                      width: Dimensions.ten * 22,
                    ),
                    SizedBox(height: Dimensions.ten * 1),
                    _DetailsRow(title: 'Age', text: age),
                    if (position == 'Leader' || position == 'leader')
                      _DetailsRow(title: 'Position', text: 'Leader')
                    else
                      _DetailsRow(title: 'Position', text: 'Normal'),
                    _DetailsRow(title: 'Email', text: email),
                    _DetailsRow(title: 'Password', text: password),
                  ],
                ),
              ),
            ),
            Positioned(
              top: Dimensions.screenHeight / 1.25,
              left: Dimensions.ten * 2.5,
              right: Dimensions.ten * 2.5,
              child: TextButton(
                onPressed: () {
                  provider.removeUser(firstName, lastName);
                  Navigator.pop(context);
                },
                child: Text(
                  'Delete User',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: Dimensions.ten * 1.8,
                  ),
                ),
              ),
            ),
            if (position == 'Leader' || position == 'leader')
              Positioned(
                top: Dimensions.screenHeight / 1.15,
                left: Dimensions.ten * 2.5,
                right: Dimensions.ten * 2.5,
                child: TextButton(
                  onPressed: () {
                    provider.reducePosition(index);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Demote to Normal',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: Dimensions.ten * 1.8,
                    ),
                  ),
                ),
              )
            else
              Positioned(
                top: Dimensions.screenHeight / 1.15,
                left: Dimensions.ten * 2.5,
                right: Dimensions.ten * 2.5,
                child: TextButton(
                  onPressed: () {
                    provider.promotionUser(index);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Promote to Leader',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: Dimensions.ten * 1.8,
                    ),
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }
}

class _DetailsRow extends StatelessWidget {
  _DetailsRow({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  String title;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenWidth,
      margin: EdgeInsets.all(Dimensions.ten * 0.5),
      padding: EdgeInsets.symmetric(horizontal: Dimensions.ten * 1.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.grey,
              fontSize: Dimensions.ten * 1.6,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: AppColors.greyBlack,
              fontSize: Dimensions.ten * 1.6,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

import 'package:add_user_flutter/pages/personal_details_page.dart';
import 'package:add_user_flutter/providers/user_provider.dart';
import 'package:add_user_flutter/utils/app_colors.dart';
import 'package:add_user_flutter/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LeaderPage extends StatelessWidget {
  const LeaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        title: Text(
          'L E A D E R',
          style: TextStyle(color: Colors.red, fontSize: Dimensions.ten * 2),
        ),
      ),
      body: Container(
        height: Dimensions.screenHeight,
        padding: EdgeInsets.only(
          top: Dimensions.ten * 3,
          left: Dimensions.ten * 2,
          right: Dimensions.ten * 2,
        ),
        child: Consumer(
          builder: (context, UserProvider provider, child) {
            return ListView.builder(
              itemCount: provider.leaders.length,
              itemBuilder: (BuildContext context, int index) {
                var leaders = provider.leaders[index];

                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => PersonalPage(
                        firstName: leaders.firstName,
                        lastName: leaders.lastName,
                        age: leaders.age,
                        position: leaders.position,
                        email: leaders.email,
                        password: leaders.password,
                        index: index,
                      ),
                    ),
                  ),
                  child: Container(
                    height: Dimensions.ten * 11,
                    margin: EdgeInsets.only(bottom: Dimensions.ten * 2),
                    padding: EdgeInsets.all(Dimensions.ten * 2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.ten * 2),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: Dimensions.ten * 0.5,
                          offset: Offset(0, Dimensions.ten * 0.5),
                          color: Colors.blueGrey.shade50,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/profile_2.svg',
                          height: Dimensions.ten * 7,
                          width: Dimensions.ten * 7,
                        ),
                        SizedBox(width: Dimensions.ten * 4),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${leaders.firstName} ${leaders.lastName}',
                              style: TextStyle(
                                color: AppColors.greyBlack,
                                fontSize: Dimensions.ten * 2,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: Dimensions.ten),
                            Text(
                              'Age ${leaders.age}',
                              style: TextStyle(
                                color: AppColors.blueGrey.withOpacity(0.65),
                                fontSize: Dimensions.ten * 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

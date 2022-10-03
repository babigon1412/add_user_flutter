import 'package:add_user_flutter/models/leader_model.dart';
import 'package:add_user_flutter/models/user_model.dart';
import 'package:add_user_flutter/pages/general_page.dart';
import 'package:add_user_flutter/pages/leader_page.dart';
import 'package:add_user_flutter/pages/form_page.dart';
import 'package:add_user_flutter/pages/personal_details_page.dart';
import 'package:add_user_flutter/providers/user_provider.dart';
import 'package:add_user_flutter/utils/app_colors.dart';
import 'package:add_user_flutter/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class AllUser extends StatefulWidget {
  AllUser({Key? key}) : super(key: key);

  @override
  State<AllUser> createState() => _AllUserState();
}

class _AllUserState extends State<AllUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueWhite,
      appBar: const _CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          height: Dimensions.screenHeight,
          margin: EdgeInsets.only(top: Dimensions.ten * 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.ten * 2),
                child: Row(
                  children: [
                    Text(
                      'NETFLAX',
                      style: TextStyle(
                          color: AppColors.greyBlack,
                          fontSize: Dimensions.ten * 3,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: Dimensions.ten),
                    Icon(
                      Icons.wifi_tethering_off_sharp,
                      color: Colors.red,
                      size: Dimensions.ten * 4,
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.ten * 3),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.ten * 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Leader Users  (${UserProvider().leaders.length})',
                      style: TextStyle(
                          color: AppColors.blueGrey,
                          fontSize: Dimensions.ten * 1.5),
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const LeaderPage()),
                      ),
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: Dimensions.ten * 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const _LeaderList(),
              SizedBox(height: Dimensions.ten * 3),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.ten * 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'General Users  (${UserProvider().users.length})',
                      style: TextStyle(
                          color: AppColors.blueGrey,
                          fontSize: Dimensions.ten * 1.5),
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const GeneralPage()),
                      ),
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: Dimensions.ten * 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const _UserList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _LeaderList extends StatelessWidget {
  const _LeaderList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.ten * 14.5,
      width: Dimensions.screenWidth,
      padding: EdgeInsets.only(
        left: Dimensions.ten * 2,
        top: Dimensions.ten * 2,
      ),
      // Used consumer to get status from provider
      child: Consumer(
        builder: (context, UserProvider provider, child) {
          return ListView.builder(
            itemCount:
                provider.leaders.length >= 3 ? 3 : provider.leaders.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              LeaderModel leaders = provider.leaders[index];
              Color randomColor =
                  Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0);

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
                  height: Dimensions.ten * 8,
                  width: Dimensions.ten * 19,
                  padding: EdgeInsets.all(Dimensions.ten * 1),
                  margin: EdgeInsets.only(right: Dimensions.ten),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.ten * 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: Dimensions.ten * 2.5,
                            backgroundColor: randomColor,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: Dimensions.ten * 3.5,
                            ),
                          ),
                          SizedBox(width: Dimensions.ten * 1.5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: Dimensions.ten * 10,
                                child: Text(
                                  '${leaders.firstName} ${leaders.lastName}',
                                  style: TextStyle(
                                    color: randomColor,
                                    fontSize: Dimensions.ten * 1.6,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: Dimensions.ten),
                              Text(
                                leaders.position,
                                style: TextStyle(
                                  color: AppColors.grey.withOpacity(0.5),
                                  fontSize: Dimensions.ten * 1.6,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Dimensions.ten),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Contact',
                              style: TextStyle(
                                color: AppColors.grey,
                                fontSize: Dimensions.ten * 1.6,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.phone,
                              color: Colors.green[500],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _UserList extends StatelessWidget {
  const _UserList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(Dimensions.ten * 2),
        height: Dimensions.ten * 5,
        child: Consumer(
          builder: ((context, UserProvider provider, child) {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: provider.users.length >= 5 ? 5 : provider.users.length,
              itemBuilder: (BuildContext context, int index) {
                UserModel users = provider.users[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => PersonalPage(
                        firstName: users.firstName,
                        lastName: users.lastName,
                        age: users.age,
                        position: users.position,
                        email: users.email,
                        password: users.password,
                        index: index,
                      ),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: Dimensions.ten * 6,
                    margin: EdgeInsets.only(bottom: Dimensions.ten * 0.6),
                    padding: EdgeInsets.only(left: Dimensions.ten),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.ten * 2),
                    ),
                    child: ListTile(
                      leading: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: Dimensions.ten * 1.8,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      title: Text(
                        '${users.firstName} ${users.lastName}',
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: Dimensions.ten * 1.8,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
      elevation: 0,
      leading: SizedBox(
        width: Dimensions.ten * 3,
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                fullscreenDialog: true,
                builder: (context) => FormPage(),
              ),
            );
          },
          child: Text(
            'New',
            style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.ten * 1.8,
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: Dimensions.ten * 0.9),
          child: const Icon(Icons.grid_view_rounded, color: Colors.white),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Dimensions.ten * 5.6);
}

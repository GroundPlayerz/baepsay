import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:golden_balance_flutter/bloc/cubit/auth_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/home_feed_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/auth_state.dart';
import 'package:golden_balance_flutter/bloc/state/home_feed_state.dart';
import 'package:golden_balance_flutter/constant/color.dart';
import 'package:golden_balance_flutter/screen/post/post_widget.dart';
import 'package:golden_balance_flutter/screen/profile/my_profile_screen.dart';
import 'package:golden_balance_flutter/screen/upload/upload_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isForYouSelected = true;
  bool isStateChecked = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeFeedCubit>(context).getUserHomeFeed();
  }

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, authState) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kBackgroundNavyColor,
          leadingWidth: 0,
          titleSpacing: 0,
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: authState is FirebaseSignedIn
                    ? () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UploadScreen()));
                      }
                    : () {
                        Fluttertoast.showToast(
                          msg: '업로드를 하기 위해서는 로그인 해야합니다.',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }),
            IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyProfileScreen()));
                }),
          ],
        ),
        backgroundColor: kBackgroundNavyColor,
        body: BlocBuilder<HomeFeedCubit, HomeFeedState>(
            builder: (context, feedState) {
          if (feedState is Loaded) {
            return PageView.builder(
              allowImplicitScrolling: true,
              scrollDirection: Axis.horizontal,
              controller: pageController,
              itemCount: feedState.feed.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index < feedState.feed.length) {
                  return PostWidget(
                    postIndex: index,
                  );
                }
                return Container();
              },
            );
          } else if (feedState is FeedError) {
            print(feedState.message);
          } else if (feedState is Loading) {
            return Text('스켈레톤 띄우기');
          }

          return Text(feedState.toString());
        }),
      );
    });
  }
}

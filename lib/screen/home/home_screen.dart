import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/auth_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/auth_state.dart';
import 'package:golden_balance_flutter/constant/color.dart';
import 'package:golden_balance_flutter/constant/textstyle.dart';
import 'package:golden_balance_flutter/screen/notification_screen.dart';
import 'package:golden_balance_flutter/screen/profile/my_profile_screen.dart';
import 'package:golden_balance_flutter/screen/upload/upload_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isForYouSelected = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AuthCubit>(context).checkIsFirebaseSignedIn();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is FirebaseSignedIn) {
          BlocProvider.of<AuthCubit>(context).signInFlask();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kBackgroundNavyColor,
          leadingWidth: 0,
          titleSpacing: 0,
          title: Row(
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    '추천',
                    style: isForYouSelected
                        ? kHomeScreenSelectedTabTextStyle
                        : kHomeScreenUnselectedTabTextStyle,
                  )),
              BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
                if (state is FlaskSignedIn) {
                  return TextButton(
                      onPressed: () {},
                      child: Text('팔로잉',
                          style: !isForYouSelected
                              ? kHomeScreenSelectedTabTextStyle
                              : kHomeScreenUnselectedTabTextStyle));
                } else {
                  return TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyProfileScreen()));
                      },
                      child: Text('팔로잉',
                          style: !isForYouSelected
                              ? kHomeScreenSelectedTabTextStyle
                              : kHomeScreenUnselectedTabTextStyle));
                }
              }),
            ],
          ),
          actions: [
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is FlaskSignedIn) {
                  return IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UploadScreen()));
                      });
                } else {
                  return IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyProfileScreen()));
                      });
                }
              },
            ),
            BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
              if (state is FlaskSignedIn) {
                return IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationScreen()));
                    });
              } else {
                return IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyProfileScreen()));
                    });
              }
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
        body: PostWidget(),
      ),
    );
  }
}

class PostWidget extends StatefulWidget {
  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  // User exampleUser = User(
  //   id: 1,
  //   profileName: '김루카',
  //   role: 'general',
  //   email: 'rukaruka@gmail.com',
  //   createdAt: '2020-05-20T05:31:12.331843',
  //   profilePhotoUrl: '',
  // );
  // Post examplePost = Post(
  //   id: 1,
  //   author: exampleUser,
  //   firstContentText: '',
  // );
  String _title = '둘 중 하나를 꼭 먹어야 한다면? 맛이 없는 음식 대결 레전드 1탄';
  String _firstContentText = '토맛토마토';
  String _secondContentText = '토마토맛토';
  int _likeCount = 421;
  int _voteCount = 1254;
  int _commentCount = 77;
  int _firstContentVoteCount = 851;
  int _secondContentVoteCount = 403;
  bool _isLikeButtonPressed = false;

  bool _isVoted = true;
  String _userName = '김루카';

  double _titleAreaHeight = 56;
  bool _isTitleStretched = true;

  Widget _likeButtonDeactivated() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Icon(
              Icons.favorite_border_rounded,
              size: 35,
              color: kWhiteColor.withOpacity(0.4),
            ),
            SizedBox(width: 11),
            Text(
              _likeCount.toString(),
              style: kPostInfoNumberTextStyle.copyWith(
                  color: kWhiteColor.withOpacity(0.4)),
            ),
          ],
        ),
      );
  Widget _likeButton() => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            if (!_isLikeButtonPressed) {
              _isLikeButtonPressed = true;
              //ToDo: 좋아요 누른거 DB와 연동
            } else {
              _isLikeButtonPressed = false;
              //ToDo: 좋아요 누른거 DB와 연동
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              !_isLikeButtonPressed
                  ? Icon(Icons.favorite_border_rounded,
                      size: 35, color: kWhiteColor)
                  : Icon(Icons.favorite_rounded,
                      size: 35, color: kAccentYellowColor),
              SizedBox(width: 11),
              !_isLikeButtonPressed
                  ? Text(_likeCount.toString(), style: kPostInfoNumberTextStyle)
                  : Text((_likeCount + 1).toString(),
                      style: kPostInfoNumberTextStyle),
            ],
          ),
        ),
      );
  Widget _commentButtonDeactivated() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Icon(Icons.mode_comment_outlined,
                size: 30, color: kWhiteColor.withOpacity(0.4)),
            SizedBox(width: 11),
            Text((_commentCount).toString(),
                style: kPostInfoNumberTextStyle.copyWith(
                    color: kWhiteColor.withOpacity(0.4))),
          ],
        ),
      );
  Widget _commentButton() => GestureDetector(
        onTap: () {
          //Todo : 댓글 화면으로 넘어가기
        },
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Icon(Icons.mode_comment_outlined, size: 30, color: kWhiteColor),
              SizedBox(width: 11),
              Text((_commentCount).toString(), style: kPostInfoNumberTextStyle),
            ],
          ),
        ),
      );
  Widget _postInfoWidgetArea(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          top: 11,
          bottom: MediaQuery.of(context).padding.bottom, //정도 내렸을 때 적당한듯..
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //첫째줄
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text('투표', style: kPostInfoTextStyle),
                  SizedBox(width: 4),
                  Text(_voteCount.toString(),
                      style: kPostInfoNumberTextStyle.copyWith(fontSize: 14)),
                  SizedBox(width: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(9),
                    child: Container(
                      width: 20,
                      height: 20,
                      child: Image.asset("images/default_profile_photo.png"),
                    ),
                  ),
                  SizedBox(width: 11),
                  Text(_userName),
                ],
              ),
            ),
            //둘째줄
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                !_isVoted ? _likeButtonDeactivated() : _likeButton(),
                !_isVoted ? _commentButtonDeactivated() : _commentButton(),
              ],
            ),
          ],
        ),
      );

  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
        child: Stack(children: [
          //전체 배경
          Container(
            color: Colors.red,
            //decoration: BoxDecoration(gradient: kPostGradient50),
          ),

          Positioned(
            top: _titleAreaHeight,
            left: 0,
            right: 0,
            child: Container(color: Colors.grey, width: 100, height: 100),
          ),
          //제목 위젯
          Positioned(
            child: Container(
              height:
                  !_isTitleStretched ? _titleAreaHeight : _titleAreaHeight + 30,
              decoration: BoxDecoration(gradient: kPostGradient70),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 16, top: 15, bottom: 15),
                      child: Text(
                        _title,
                        maxLines: !_isTitleStretched ? 1 : 2,
                        style: kNoto18B,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: IconButton(
                        icon: !_isTitleStretched
                            ? Icon(Icons.keyboard_arrow_down_rounded)
                            : Icon(Icons.keyboard_arrow_up_rounded),
                        onPressed: () {
                          setState(() {
                            if (!_isTitleStretched) {
                              _isTitleStretched = true;
                            } else {
                              _isTitleStretched = false;
                            }
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
      _postInfoWidgetArea(context),
    ]);
  }
}

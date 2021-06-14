import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/auth_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/home_feed_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/home_feed_state.dart';
import 'package:golden_balance_flutter/constant/color.dart';
import 'package:golden_balance_flutter/constant/textstyle.dart';
import 'package:golden_balance_flutter/model/member/member.dart';
import 'package:golden_balance_flutter/model/post/post.dart';
import 'package:golden_balance_flutter/screen/post/comment_screen.dart';
import 'package:golden_balance_flutter/screen/post/post_report_screen.dart';

class FeedPostWidgetNew extends StatefulWidget {
  final int postIndex;
  final double safeAreaTopHeight;
  final double safeAreaVerticalHeight;

  FeedPostWidgetNew(
      {required this.postIndex,
      required this.safeAreaTopHeight,
      required this.safeAreaVerticalHeight});

  @override
  _FeedPostWidgetNewState createState() => _FeedPostWidgetNewState();
}

class _FeedPostWidgetNewState extends State<FeedPostWidgetNew> {
  late int postIndex;
  double outerHorizontalPadding = 10;
  double innerHorizontalPadding = 20;
  late double mediaWidthHeight;
  late double completeButtonWidth;

  late double safeAreaTopHeight;
  late double safeAreaVerticalHeight;

  int selectedContent = -1; //선택안된거임.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postIndex = widget.postIndex;
    BlocProvider.of<HomeFeedCubit>(context).viewPost(postIndex: postIndex);

    safeAreaTopHeight = widget.safeAreaTopHeight;
    safeAreaVerticalHeight = widget.safeAreaVerticalHeight;
  }

  void tapContent(int tappedContent) {
    setState(() {
      selectedContent = tappedContent;
    });
  }

  Widget _completeButtonDeactivated() => Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: kAccentPinkColor.withOpacity(0.2),
          borderRadius: BorderRadius.all(Radius.circular(11)),
        ),
        child: Center(
          child: Text(
            '완료',
            style: kNoto16M.copyWith(color: kWhiteColor),
          ),
        ),
      );
  Widget _completeButton() => GestureDetector(
        onTap: () {
          //Todo
          BlocProvider.of<HomeFeedCubit>(context)
              .voteToPost(postIndex: postIndex, choice: selectedContent);
        },
        child: Container(
          //padding: EdgeInsets.symmetric(vertical: 10.0),
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
            color: kAccentPinkColor,
            borderRadius: BorderRadius.all(Radius.circular(11)),
          ),
          child: Center(
            child: Text(
              '완료',
              style: kNoto16M.copyWith(color: kWhiteColor),
            ),
          ),
        ),
      );

  Widget _voteResultWidget(
      {required int firstContentVoteCount,
      required int secondContentVoteCount}) {
    var firstPercent = 100 *
        (firstContentVoteCount /
            (firstContentVoteCount + secondContentVoteCount));
    var secondPercent = 100 - firstPercent;
    int firstPercentInt = firstPercent.toInt();
    int secondPercentInt = secondPercent.toInt();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 45 + (completeButtonWidth - 45 * 2) * firstPercent / 100,
          height: 45,
          decoration: firstPercent >= secondPercent
              ? BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xffFF0045).withOpacity(0.3),
                      Color(0xffEA425D).withOpacity(0.14),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(11),
                      bottomLeft: Radius.circular(11)),
                )
              : BoxDecoration(
                  color: Color(0xffF4F4F4),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(11),
                      bottomLeft: Radius.circular(11)),
                ),
          child: Center(
            child: Text(
              firstPercentInt.toString() + '%',
              style: kPostVoteResultPercentTextStyle,
            ),
          ),
        ),
        Container(
          width: 45 + (completeButtonWidth - 45 * 2) * secondPercent / 100,
          height: 45,
          decoration: secondPercent >= firstPercent
              ? BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xffEA425D).withOpacity(0.14),
                      Color(0xffFF0045).withOpacity(0.3),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(11),
                      bottomRight: Radius.circular(11)),
                )
              : BoxDecoration(
                  color: Color(0xffF4F4F4),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(11),
                      bottomRight: Radius.circular(11)),
                ),
          child: Center(
            child: Text(
              secondPercentInt.toString() + '%',
              style: kPostVoteResultPercentTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _likeButtonDeactivated(Post post) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Icon(
              Icons.favorite_border_rounded,
              size: 35,
              color: kAccentPinkColor.withOpacity(0.4),
            ),
            SizedBox(width: 11),
            Text(
              post.likeCount.toString(),
              style: kPostInfoNumberTextStyle.copyWith(
                  color: kGreyColor1_767676.withOpacity(0.4)),
            ),
          ],
        ),
      );
  Widget _likeButton(Post post) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            BlocProvider.of<HomeFeedCubit>(context)
                .pressLikeButton(postIndex: postIndex);
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              post.memberLikeCount == 0
                  ? Icon(Icons.favorite_border_rounded,
                      size: 35, color: kIconGreyColor_CBCBCB)
                  : Icon(Icons.favorite_rounded,
                      size: 35, color: kAccentPinkColor),
              SizedBox(width: 11),
              Text(
                post.likeCount.toString(),
                style: kPostInfoNumberTextStyle,
              ),
            ],
          ),
        ),
      );
  Widget _commentButtonDeactivated(Post post) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Icon(Icons.mode_comment_outlined,
                size: 30, color: kIconGreyColor_CBCBCB.withOpacity(0.4)),
            SizedBox(width: 11),
            Text((post.commentCount).toString(),
                style: kPostInfoNumberTextStyle.copyWith(
                    color: kGreyColor1_767676.withOpacity(0.4))),
          ],
        ),
      );
  Widget _commentButton({required Post post, required int postId}) =>
      GestureDetector(
        onTap: () {
          //Todo : 댓글 화면으로 넘어가기
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CommentScreen(
                        postId: postId,
                        postCommentCount: post.commentCount,
                      )));
        },
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Icon(Icons.mode_comment_outlined,
                  size: 30, color: kIconGreyColor_CBCBCB),
              SizedBox(width: 11),
              Text((post.commentCount).toString(),
                  style: kPostInfoNumberTextStyle),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    mediaWidthHeight = (MediaQuery.of(context).size.width -
            (outerHorizontalPadding + innerHorizontalPadding) * 2 -
            24) /
        2;
    completeButtonWidth = MediaQuery.of(context).size.width -
        (outerHorizontalPadding + innerHorizontalPadding) * 2;

    print(MediaQuery.of(context).padding.bottom);
    return BlocBuilder<HomeFeedCubit, HomeFeedState>(builder: (context, state) {
      if (state is HomeFeedLoaded) {
        Post post = state.feed[postIndex];
        List<Map<String, dynamic>> mediaList = [{}, {}];

        if (post.mediaContentOrders != null) {
          List<String> mediaContentOrdersList =
              post.mediaContentOrders!.split(',');
          List<String> mediaTypesList = post.mediaTypes!.split(',');
          List<String> mediaUrlsList = post.mediaUrls!.split(',');

          for (int i = 0; i < mediaContentOrdersList.length; i++) {
            if (mediaTypesList[i] == 'thumbnail') {
              mediaList[int.parse(mediaContentOrdersList[i]) - 1]
                  ['thumbnail_url'] = mediaUrlsList[i];
            } else {
              mediaList[int.parse(mediaContentOrdersList[i]) - 1]['type'] =
                  mediaTypesList[i];
              mediaList[int.parse(mediaContentOrdersList[i]) - 1]['url'] =
                  mediaUrlsList[i];
            }
          }
        }
        print('MediaQuery.size.height : ' +
            MediaQuery.of(context).size.height.toString());
        print('kToolbarHeight : ' + kToolbarHeight.toString());
        print('MediaQuery.padding.vertical : ' +
            MediaQuery.of(context).padding.vertical.toString());

        return SafeArea(
          child: ListView(children: [
            SizedBox(height: 5),
            ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height -
                      AppBar().preferredSize.height -
                      safeAreaVerticalHeight -
                      15),

              //Rounded 컨테이너
              child: Container(
                margin:
                    EdgeInsets.symmetric(horizontal: outerHorizontalPadding),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //-----덩어리시작1------
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(),
                            IconButton(
                                icon: Icon(
                                  Icons.more_horiz_sharp,
                                  color: kIconGreyColor_CBCBCB,
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SafeArea(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Builder(builder: (context) {
                                                Member? currentMember =
                                                    BlocProvider.of<AuthCubit>(
                                                            context)
                                                        .getCurrentMember();
                                                if (currentMember != null &&
                                                    (post.authorId ==
                                                            currentMember.id ||
                                                        currentMember.role ==
                                                            'admin')) {
                                                  return ListTile(
                                                    onTap: () {},
                                                    leading: Icon(Icons.delete),
                                                    title: Text('삭제'),
                                                  );
                                                } else {
                                                  return ListTile(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  PostReportScreen(
                                                                      postId: post
                                                                          .id)));
                                                    },
                                                    leading: Icon(Icons.report),
                                                    title: Text('신고하기'),
                                                  );
                                                }
                                              }),
                                            ],
                                          ),
                                        );
                                      });
                                }),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: innerHorizontalPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '참여  ' +
                                    (post.firstContentVoteCount +
                                            post.secondContentVoteCount)
                                        .toString(),
                                style: kPostInfoTextStyle,
                              ),
                              Text(post.title, style: kPostTitleTextStyle),
                              SizedBox(height: 30.0),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //항목 1
                                  Column(
                                    children: [
                                      mediaList[0]['type'] == 'image'
                                          ? Container(
                                              decoration: BoxDecoration(),
                                              width: mediaWidthHeight,
                                              height: mediaWidthHeight,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: CachedNetworkImage(
                                                  imageUrl: mediaList[0]['url'],
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          : SizedBox(),
                                      SizedBox(height: 13),
                                      Container(
                                        width: mediaWidthHeight,
                                        child: Text(
                                          post.firstContentText,
                                          style: kPostContentTextStyle,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      mediaList[0]['type'] == 'image'
                                          ? Container(
                                              decoration: BoxDecoration(),
                                              width: mediaWidthHeight,
                                              height: mediaWidthHeight,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: CachedNetworkImage(
                                                  imageUrl: mediaList[1]['url'],
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          : SizedBox(),
                                      SizedBox(height: 13),
                                      Container(
                                        width: mediaWidthHeight,
                                        child: Text(
                                          post.secondContentText,
                                          style: kPostContentTextStyle,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  //항목 2
                                ],
                              ),
                              SizedBox(height: 38.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                    //----덩어리시작 2----
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: innerHorizontalPadding),
                          child: Column(
                            children: [
                              //투표 버튼
                              post.memberVoteChoice == null
                                  ? Row(
                                      children: [
                                        //항목 1 선택버튼
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              tapContent(1);
                                            },
                                            behavior: HitTestBehavior.opaque,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 44,
                                                height: 44,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: kWhiteColor,
                                                  border: Border.all(
                                                    width: 2,
                                                    color: selectedContent == 1
                                                        ? kAccentPinkColor
                                                            .withOpacity(0.5)
                                                        : Color(0xffD5D5D5),
                                                  ),
                                                ),
                                                child: selectedContent == 1
                                                    ? Center(
                                                        child: Container(
                                                          width: 28,
                                                          height: 28,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color:
                                                                kAccentPinkColor,
                                                          ),
                                                        ),
                                                      )
                                                    : Container(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        //항목 2 선택버튼
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              tapContent(2);
                                            },
                                            behavior: HitTestBehavior.opaque,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 44,
                                                height: 44,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: kWhiteColor,
                                                  border: Border.all(
                                                    width: 2,
                                                    color: selectedContent == 2
                                                        ? kAccentPinkColor
                                                            .withOpacity(0.5)
                                                        : Color(0xffD5D5D5),
                                                  ),
                                                ),
                                                child: selectedContent == 2
                                                    ? Center(
                                                        child: Container(
                                                          width: 28,
                                                          height: 28,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color:
                                                                kAccentPinkColor,
                                                          ),
                                                        ),
                                                      )
                                                    : Container(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        //항목 1 선택버튼
                                        Expanded(
                                          child: post.memberVoteChoice == 1
                                              ? Container(
                                                  width: 44,
                                                  height: 44,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: kAccentPinkColor,
                                                  ),
                                                  child: Center(
                                                    child: Icon(Icons.check,
                                                        color: kWhiteColor),
                                                  ),
                                                )
                                              : post.memberVoteChoice == 2
                                                  ? Container()
                                                  : Container(
                                                      width: 44,
                                                      height: 44,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: kWhiteColor,
                                                        border: Border.all(
                                                          width: 2,
                                                          color:
                                                              Color(0xffD5D5D5),
                                                        ),
                                                      ),
                                                    ),
                                        ),
                                        //항목 2 선택버튼
                                        Expanded(
                                          child: post.memberVoteChoice == 2
                                              ? Container(
                                                  width: 44,
                                                  height: 44,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: kAccentPinkColor,
                                                  ),
                                                  child: Center(
                                                    child: Icon(Icons.check,
                                                        color: kWhiteColor),
                                                  ),
                                                )
                                              : post.memberVoteChoice == 1
                                                  ? Container()
                                                  : Container(
                                                      width: 44,
                                                      height: 44,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: kWhiteColor,
                                                        border: Border.all(
                                                          width: 2,
                                                          color:
                                                              Color(0xffD5D5D5),
                                                        ),
                                                      ),
                                                    ),
                                        ),
                                      ],
                                    ),
                              SizedBox(height: 49.0),
                              //투표 버튼, 투표 결과 영역
                              post.memberVoteChoice != null
                                  ? _voteResultWidget(
                                      firstContentVoteCount:
                                          post.firstContentVoteCount,
                                      secondContentVoteCount:
                                          post.secondContentVoteCount)
                                  : selectedContent == -1
                                      ? _completeButtonDeactivated()
                                      : _completeButton(),
                              SizedBox(
                                height: 23,
                              ),
                            ],
                          ),
                        ),
                        //좋아요, 댓글 버튼
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //좋아요 버튼
                            post.memberVoteChoice == null
                                ? _likeButtonDeactivated(post)
                                : _likeButton(post),

                            // 댓글 버튼
                            post.memberVoteChoice == null
                                ? _commentButtonDeactivated(post)
                                : _commentButton(post: post, postId: post.id),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            //아래 Info Area
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '시작일  ' + post.createdAt.split('T')[0].replaceAll('-', '/'),
                    style: kPostInfoTextStyleOld.copyWith(
                        color: kGreyColor2_999999),
                  ),
                  Text(
                    'BY  ' + post.profileName,
                    style: kPostInfoTextStyleOld.copyWith(
                        color: kGreyColor2_999999),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
          ]),
        );
      } else {
        return Container(
          child: Text('스켈레톤'),
        );
      }
    });
  }
}

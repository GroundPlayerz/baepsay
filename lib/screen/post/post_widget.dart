import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/constant/color.dart';
import 'package:golden_balance_flutter/constant/textstyle.dart';
import 'package:golden_balance_flutter/model/post/post.dart';
import 'package:golden_balance_flutter/screen/post/comment_screen.dart';
import 'package:golden_balance_flutter/screen/post/video_network_viewer.dart';

class PostWidget extends StatefulWidget {
  Post post;

  PostWidget({required this.post});
  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  late Post post;

  late final String _title;
  late final String _firstContentText;
  late final String _secondContentText;
  late int _likeCount;
  late int _voteCount;
  int _commentCount = 77;
  late int _firstContentVoteCount;
  late int _secondContentVoteCount;
  late bool _isLikeButtonPressed;
  late bool _isVoted;
  late String _userName;
  late List<ImageMedia> _imageMediaList;
  late List<VideoMedia> _videoMediaList;
  //Todo: initState에서 결정해야하는 변수
  late Widget _firstMediaWidget;
  late Widget _secondMediaWidget;
  late bool _isFirstMediaExist;
  late bool _isSecondMediaExist;
  //Todo: stateful 위젯 내에서 변하는 변수
  final double _titleAreaHeight = 56;
  bool _isTitleStretched = false;
  String _votedContent = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    post = widget.post;

    _title = widget.post.title;
    _isVoted = widget.post.isVoted;
    _firstContentVoteCount = widget.post.firstContentVoteCount;
    _secondContentVoteCount = widget.post.secondContentVoteCount;
    _firstContentText = widget.post.firstContentText;
    _secondContentText = widget.post.secondContentText;
    _isLikeButtonPressed = widget.post.isLikeButtonPressed;
    _likeCount = widget.post.likeCount;
    _voteCount = _firstContentVoteCount + _secondContentVoteCount;
    _userName = widget.post.author.profileName;
    if (widget.post.imageMediaList != null) {
      for (ImageMedia imageMedia in widget.post.imageMediaList!) {
        if (imageMedia.contentOrder == 1) {
          _firstMediaWidget = _imageWidget(imageMedia);
          _isFirstMediaExist = true;
        } else if (imageMedia.contentOrder == 2) {
          _secondMediaWidget = _imageWidget(imageMedia);
          _isSecondMediaExist = true;
        }
      }
    }

    if (widget.post.videoMediaList != null) {
      for (VideoMedia videoMedia in widget.post.videoMediaList!) {
        if (videoMedia.contentOrder == 1) {
          _firstMediaWidget = _videoWidget(videoMedia);
          _isFirstMediaExist = true;
        } else if (videoMedia.contentOrder == 2) {
          _secondMediaWidget = _videoWidget(videoMedia);
          _isSecondMediaExist = true;
        }
      }
    }
  }


  Widget _videoWidget(VideoMedia videoMedia) {
    return ClipRect(
      child: SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.cover,
          //alignment: Alignment.center,
          child: VideoNetworkViewer(
            videoUrl: videoMedia.url,
            thumbnailUrl: videoMedia.thumbnail.url,
          ),
        ),
      ),
    );
  }

  Widget _imageWidget(ImageMedia imageMedia) {
    return Stack(children: [
      Positioned.fill(
        child: CachedNetworkImage(
          imageUrl: imageMedia.url,
          fit: BoxFit.cover,
        ),
      ),
      _topBlackGradient,
      _bottomBlackGradient,
    ]);
  }

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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CommentScreen()));
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
                      child: Image.asset('images/default_profile_photo.png'),
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
  Widget _postTitleAreaWidget(BuildContext context) => Stack(
        children: [
          Container(
              color: kBackgroundNavyColor,
              width: MediaQuery.of(context).size.width,
              height: _titleAreaHeight),
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
                        style: kPostTitleTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
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
        ],
      );

  final Widget _topBlackGradient = Positioned.fill(
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0, -0.7),
            colors: [
              Color(0x40000000),
              Colors.transparent,
            ]),
      ),
    ),
  );
  final Widget _bottomBlackGradient = Positioned.fill(
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment(0, 0.7),
            colors: [
              Color(0x40000000),
              Colors.transparent,
            ]),
      ),
    ),
  );

  void _voteToFirstContent() {
    setState(() {
      _isVoted = true;
      _votedContent = 'First';
      _firstContentVoteCount++;
    });
    //Todo: 투표한것 DB와 연동
  }

  void _voteToSecondContent() {
    setState(() {
      _isVoted = true;
      _votedContent = 'Second';
      _secondContentVoteCount++;
    });
    //Todo: 투표한것 DB와 연동
  }

  Widget _voteResultWidget() {
    var firstPercent = 100 *
        (_firstContentVoteCount /
            (_firstContentVoteCount + _secondContentVoteCount));
    int firstPercentInt = firstPercent.toInt();
    int secondPercentInt = 100 - firstPercentInt;
    return Positioned.fill(
      top: _titleAreaHeight,
      child: Stack(
        children: [
          //색깔 배경
          Column(
            children: [
              Expanded(
                flex: firstPercentInt,
                child: Container(
                  color: Color(0xff0000BF).withOpacity(0.6),
                ),
              ),
              Expanded(
                flex: secondPercentInt,
                child: Container(
                  color: Color(0xffBF0000).withOpacity(0.6),
                ),
              ),
            ],
          ),
          //퍼센트 띄우기
          Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    firstPercentInt.toString() + '%',
                    style: kPostVoteResultPercentTextStyle,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    secondPercentInt.toString() + '%',
                    style: kPostVoteResultPercentTextStyle,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _voteCompleteIconWidget(String whichWidget) {
    if (_votedContent == whichWidget) {
      return Container(
          height: 40,
          width: 40,
          child: Image.asset('images/icon_check_circle.png'));
    } else {
      return Container();
    }
  }

  Widget _voteButton(String whichWidget) {
    return GestureDetector(
      onTap: () {
        if (whichWidget == 'First') {
          _voteToFirstContent();
        } else if (whichWidget == 'Second') {
          _voteToSecondContent();
        }
      },
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(12),
          child: Text('선택'),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: Colors.white, width: 2),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
        child: Stack(children: [
          //전체 배경
          Container(
            decoration: BoxDecoration(gradient: kPostGradient50),
          ),
          //미디어위젯
          Positioned.fill(
            top: _titleAreaHeight,
            child: Column(
              children: [
                Expanded(
                  child: _isFirstMediaExist
                      ? _firstMediaWidget
                      : Container(
                          color: Colors.red.withOpacity(0.1),
                        ),
                ),
                Expanded(
                  child: _isSecondMediaExist
                      ? _secondMediaWidget
                      : Container(
                          color: Colors.red.withOpacity(0.1),
                        ),
                ),
              ],
            ),
          ),
          //투표비율위젯
          _isVoted ? _voteResultWidget() : Container(),
          //항목 위젯
          Positioned.fill(
            top: _titleAreaHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: 6, bottom: 8, left: 20, right: 20),
                        color: Colors.black.withOpacity(0.5),
                        child: Text(
                          _firstContentText,
                          style: kPostContentTextStyle,
                        ),
                      ),
                      SizedBox(height: 40.0),
                    ],
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.0),
                    Container(
                      padding: EdgeInsets.only(
                          top: 6, bottom: 8, left: 20, right: 20),
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        _secondContentText,
                        style: kPostContentTextStyle,
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
          Positioned.fill(
              top: _titleAreaHeight - 10,
              child: Center(
                child: Text(
                  'vs',
                  style: kPostVSTextStyle.copyWith(fontSize: 55),
                ),
              )),
          //투표 버튼
          Positioned.fill(
            top: _titleAreaHeight,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                    child: !_isVoted
                        ? _voteButton('First')
                        : _voteCompleteIconWidget('First'),
                  ),
                ),
                //버튼2
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                    child: !_isVoted
                        ? _voteButton('Second')
                        : _voteCompleteIconWidget('Second'),
                  ),
                ),
              ],
            ),
          ),
          _postTitleAreaWidget(context),
        ]),
      ),
      _postInfoWidgetArea(context),
    ]);
  }
}

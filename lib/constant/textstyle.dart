import 'package:flutter/material.dart';
import 'color.dart';

//홈화면 선택 탭 스타일, 게시물 제목 스타일
const TextStyle kNoto18B = TextStyle(
  fontFamily: 'NotoSansCJKkr',
  fontSize: 18.0,
  fontWeight: FontWeight.w700,
  letterSpacing: -0.36,
  color: kWhiteColor,
);

//홈화면 비선택 탭 스타일, 게시물 항목 스타일
const TextStyle kNoto18R = TextStyle(
  fontFamily: 'NotoSansCJKkr',
  fontSize: 18.0,
  fontWeight: FontWeight.w400,
  letterSpacing: -0.36,
  color: kWhiteColor,
);

//게시물 Info
const TextStyle kNoto12R = TextStyle(
  fontFamily: 'NotoSansCJKkr',
  fontSize: 12.0,
  fontWeight: FontWeight.w400,
  letterSpacing: -0.24,
  color: kWhiteColor,
);
const TextStyle kNoto12B = TextStyle(
  fontFamily: 'NotoSansCJKkr',
  fontSize: 12.0,
  fontWeight: FontWeight.w700,
  letterSpacing: -0.24,
  color: kWhiteColor,
);

//게시물 Info 숫자
const TextStyle kSkia16R = TextStyle(
  fontFamily: 'Skia',
  fontSize: 16.0,
  fontWeight: FontWeight.w400,
  letterSpacing: -0.32,
  color: kWhiteColor,
);

const TextStyle kNoto16R = TextStyle(
  fontFamily: 'NotoSansCJKkr',
  fontSize: 16.0,
  fontWeight: FontWeight.w400,
  letterSpacing: -0.32,
  color: kWhiteColor,
);

const TextStyle kNoto16B = TextStyle(
  fontFamily: 'NotoSansCJKkr',
  fontSize: 16.0,
  fontWeight: FontWeight.w700,
  letterSpacing: -0.32,
  color: kWhiteColor,
);

const TextStyle kPermanentMarker60R = TextStyle(
  fontFamily: 'PermanentMarker',
  fontSize: 60.0,
  fontWeight: FontWeight.w400,
  letterSpacing: -1.2,
  color: kWhiteColor,
);

const TextStyle kNoto50B = TextStyle(
  fontFamily: 'NotoSansCJKkr',
  fontSize: 50,
  fontWeight: FontWeight.w700,
  letterSpacing: -1,
  color: kWhiteColor,
);

const TextStyle kSkia18B = TextStyle(
  fontFamily: 'Skia',
  fontSize: 18,
  fontWeight: FontWeight.w700,
  letterSpacing: -0.36,
  color: kWhiteColor,
);

const TextStyle kNoto13R = TextStyle(
  fontFamily: 'NotoSansCJKkr',
  fontSize: 13,
  fontWeight: FontWeight.w400,
  letterSpacing: -0.26,
  color: kWhiteColor,
);

TextStyle kDefaultBody2TextStyle = kNoto12R;

TextStyle kHomeScreenSelectedTabTextStyle = kNoto18B;
TextStyle kHomeScreenUnselectedTabTextStyle =
    kNoto18R.copyWith(color: kWhiteColor.withOpacity(0.4));

//Post
TextStyle kPostTitleTextStyle = kNoto18B;
TextStyle kPostContentTextStyle = kNoto18R;
TextStyle kPostVSTextStyle = kPermanentMarker60R;
TextStyle kPostInfoTextStyle = kNoto12R;
TextStyle kPostInfoNumberTextStyle = kSkia16R;
TextStyle kPostVoteResultPercentTextStyle = kNoto50B;

//AppBar
TextStyle kAppBarTitleTextStyle = kNoto16R;
TextStyle kAppBarButtonTextStyle = kNoto16B.copyWith(color: Colors.red);

//Comment
TextStyle kCommentInfoTextStyle = kNoto12R;
TextStyle kCommentTextTextStyle = kNoto13R;
TextStyle kCommentLikeNumberTextStyle = kSkia16R;
TextStyle kNestedCommentButtonsTextStyle = kNoto12B;

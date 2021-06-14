import 'package:flutter/material.dart';
import 'color.dart';

//홈화면 선택 탭 스타일, 게시물 제목 스타일
const TextStyle kNoto18B = TextStyle(
  fontFamily: 'NotoSansCJKkr',
  fontSize: 18.0,
  fontWeight: FontWeight.w700,
  letterSpacing: -0.36,
  color: kBlackColor,
);

//홈화면 비선택 탭 스타일, 게시물 항목 스타일
const TextStyle kNoto18R = TextStyle(
  fontFamily: 'NotoSansCJKkr',
  fontSize: 18.0,
  fontWeight: FontWeight.w400,
  letterSpacing: -0.36,
  color: kBlackColor,
);

//게시물 Info
const TextStyle kNoto12R = TextStyle(
  fontFamily: 'NotoSansCJKkr',
  fontSize: 12.0,
  fontWeight: FontWeight.w400,
  letterSpacing: -0.24,
  color: kBlackColor,
);
const TextStyle kNoto12B = TextStyle(
  fontFamily: 'NotoSansCJKkr',
  fontSize: 12.0,
  fontWeight: FontWeight.w700,
  letterSpacing: -0.24,
  color: kBlackColor,
);

//게시물 Info 숫자
const TextStyle kSkia16R = TextStyle(
  fontFamily: 'Skia',
  fontSize: 16.0,
  fontWeight: FontWeight.w400,
  letterSpacing: -0.32,
  color: kBlackColor,
);

const TextStyle kNoto16R = TextStyle(
  fontFamily: 'NotoSansCJKkr',
  fontSize: 16.0,
  fontWeight: FontWeight.w400,
  letterSpacing: -0.32,
  color: kBlackColor,
);

const TextStyle kNoto16B = TextStyle(
  fontFamily: 'NotoSansCJKkr',
  fontSize: 16.0,
  fontWeight: FontWeight.w700,
  letterSpacing: -0.32,
  color: kBlackColor,
);

const TextStyle kPermanentMarker60R = TextStyle(
  fontFamily: 'PermanentMarker',
  fontSize: 60.0,
  fontWeight: FontWeight.w400,
  letterSpacing: -1.2,
  color: kBlackColor,
);

const TextStyle kNoto50B = TextStyle(
  fontFamily: 'NotoSansCJKkr',
  fontSize: 50,
  fontWeight: FontWeight.w700,
  letterSpacing: -1,
  color: kBlackColor,
);

const TextStyle kSkia18B = TextStyle(
  fontFamily: 'Skia',
  fontSize: 18,
  fontWeight: FontWeight.w700,
  letterSpacing: -0.36,
  color: kBlackColor,
);

const TextStyle kNoto13R = TextStyle(
  fontFamily: 'NotoSansCJKkr',
  fontSize: 13,
  fontWeight: FontWeight.w400,
  letterSpacing: -0.26,
  color: kBlackColor,
);

//새로운
const TextStyle kNoto16M = TextStyle(
  fontFamily: 'NotoSansCJKkr',
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
  letterSpacing: -0.32,
  color: kBlackColor,
);

const TextStyle kNoto24B = TextStyle(
  fontFamily: 'NotoSansCJKkr',
  fontSize: 24.0,
  fontWeight: FontWeight.w700,
  letterSpacing: -0.32,
  color: kBlackColor,
);

const TextStyle kNoto20B = TextStyle(
  fontFamily: 'NotoSansCJKkr',
  fontSize: 20,
  fontWeight: FontWeight.w700,
  letterSpacing: -0.4,
  color: kBlackColor,
);

const TextStyle kNoto14R = TextStyle(
  fontFamily: 'NotoSansCJKkr',
  fontSize: 14,
  fontWeight: FontWeight.w400,
  letterSpacing: -0.28,
  color: kBlackColor,
);

TextStyle kDefaultBody2TextStyle = kNoto12R;

TextStyle kHomeScreenSelectedTabTextStyle = kNoto18B;
TextStyle kHomeScreenUnselectedTabTextStyle =
    kNoto18R.copyWith(color: kBlackColor.withOpacity(0.4));

//Post_Old
TextStyle kPostTitleTextStyleOld = kNoto18B;
TextStyle kPostContentTextStyleOld = kNoto18R;
TextStyle kPostVSTextStyleOld = kPermanentMarker60R;
TextStyle kPostInfoTextStyleOld = kNoto12R;
TextStyle kPostInfoNumberTextStyleOld = kSkia16R;
TextStyle kPostVoteResultPercentTextStyleOld = kNoto50B;

//새로운 Post
TextStyle kPostTitleTextStyle = kNoto24B;
TextStyle kPostContentTextStyle = kNoto16M;
TextStyle kPostInfoTextStyle = kNoto12R.copyWith(color: kGreyColor2_999999);
TextStyle kPostVoteResultPercentTextStyle = kNoto20B;
TextStyle kPostInfoNumberTextStyle =
    kNoto14R.copyWith(color: kGreyColor1_767676);

//AppBar
TextStyle kAppBarTitleTextStyle = kNoto16R;
TextStyle kAppBarButtonTextStyle = kNoto16B.copyWith(color: Colors.red);

//Comment
TextStyle kCommentAppBarTextStyle = kNoto20B;
TextStyle kCommentAppBarSmallTextStyle = kNoto18B;
TextStyle kCommentInfoTextStyle = kNoto12R;
TextStyle kCommentTextTextStyle = kNoto13R;
TextStyle kCommentLikeNumberTextStyle = kSkia16R;
TextStyle kNestedCommentButtonsTextStyle = kNoto12B;
TextStyle kCommentScreenTextFieldHintTextStyle =
    kNoto13R.copyWith(color: kGreyColor2_999999);
TextStyle kCommentScreenTextFieldTextStyle = kNoto13R;

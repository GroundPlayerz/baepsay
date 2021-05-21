import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/constant/color.dart';

//홈화면 선택 탭 스타일, 게시물 제목 스타일
const TextStyle kNoto18B = TextStyle(
  fontFamily: 'NotoSansCJKkr',
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
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
  fontWeight: FontWeight.w500,
  letterSpacing: -0.32,
  color: kWhiteColor,
);

TextStyle kDefaultBody2TextStyle = kNoto12R;

TextStyle kHomeScreenSelectedTabTextStyle = kNoto18B;
TextStyle kHomeScreenUnselectedTabTextStyle =
    kNoto18R.copyWith(color: kWhiteColor.withOpacity(0.4));

TextStyle kPostTitleTextStyle = kNoto18B;
TextStyle kPostContentTextStyle = kNoto18R;
TextStyle kPostInfoTextStyle = kNoto12R;
TextStyle kPostInfoNumberTextStyle = kSkia16R;

TextStyle kAppBarTitleTextStyle = kNoto16R;
TextStyle kAppBarButtonTextStyle = kNoto16B.copyWith(color: Colors.red);

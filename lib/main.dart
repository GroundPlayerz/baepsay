import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:golden_balance_flutter/bloc/cubit/comment_screen_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/home_feed_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/my_comment_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/my_post_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/my_voted_post_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/nested_comment_screen_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/post_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/report_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/reported_comment_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/reported_post_cubit.dart';
import 'package:golden_balance_flutter/repository/admin_repository.dart';
import 'package:golden_balance_flutter/repository/comment_repository.dart';
import 'package:golden_balance_flutter/repository/post_repository.dart';
import 'package:golden_balance_flutter/screen/splash_screen.dart';

import 'bloc/cubit/admin_feed_cubit.dart';
import 'bloc/cubit/admin_scoring_cubit.dart';
import 'bloc/cubit/auth_cubit.dart';
import 'bloc/cubit/upload_cubit.dart';
import 'constant/color.dart';
import 'constant/textstyle.dart';
import 'repository/auth_repository.dart';
import 'repository/member_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Phoenix(child: GoldenBalance()));
}

class GoldenBalance extends StatelessWidget {
  // This widget is the root of your application.

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
            create: (_) => AuthCubit(repository: AuthRepository())),
        BlocProvider<UploadCubit>(
            create: (_) => UploadCubit(repository: MemberRepository())),
        BlocProvider<HomeFeedCubit>(
            create: (_) => HomeFeedCubit(
                  memberRepository: MemberRepository(),
                )),
        BlocProvider<AdminFeedCubit>(
            create: (_) => AdminFeedCubit(adminRepository: AdminRepository())),
        BlocProvider<CommentScreenCubit>(
            create: (_) => CommentScreenCubit(
                postRepository: PostRepository(),
                memberRepository: MemberRepository())),
        BlocProvider<NestedCommentScreenCubit>(
          create: (_) => NestedCommentScreenCubit(
              commentRepository: CommentRepository(),
              userRepository: MemberRepository()),
        ),
        BlocProvider<ReportedPostCubit>(
            create: (_) =>
                ReportedPostCubit(adminRepository: AdminRepository())),
        BlocProvider<ReportedCommentCubit>(
            create: (_) =>
                ReportedCommentCubit(adminRepository: AdminRepository())),
        BlocProvider<PostCubit>(
            create: (_) => PostCubit(
                postRepository: PostRepository(),
                memberRepository: MemberRepository())),
        BlocProvider<MyPostCubit>(
            create: (_) => MyPostCubit(userRepository: MemberRepository())),
        BlocProvider<MyVotedPostCubit>(
            create: (_) =>
                MyVotedPostCubit(userRepository: MemberRepository())),
        BlocProvider<MyCommentCubit>(
            create: (_) =>
                MyCommentCubit(memberRepository: MemberRepository())),
        BlocProvider<ReportCubit>(
            create: (_) => ReportCubit(memberRepository: MemberRepository())),
        BlocProvider<AdminScoringCubit>(
            create: (_) =>
                AdminScoringCubit(adminRepository: AdminRepository())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.light,
        theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: 'NotoSansCJKkr',
          scaffoldBackgroundColor: kBackgroundGreyColor,
          backgroundColor: kBackgroundGreyColor,
          primaryColor: kBackgroundGreyColor, //->앱바 배경색
          accentColor: kAccentPinkColor,
          primaryTextTheme: TextTheme(
            headline6: kAppBarTitleTextStyle,
            bodyText2: kDefaultBody2TextStyle,
          ),
          //primaryIconTheme: ,
          textTheme: TextTheme(
            headline6: kAppBarTitleTextStyle,
            bodyText2: kDefaultBody2TextStyle,
          ),
          primarySwatch: createMaterialColor(kAccentPinkColor),
          dividerTheme: DividerThemeData(
            space: 0.5,
            thickness: 0.5,
            color: kIconGreyColor_CBCBCB,
          ),
        ),
        home: SplashScreen(),
      ),
    );
  }
}

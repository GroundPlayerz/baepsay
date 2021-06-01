import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/admin_feed_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/admin_feed_state.dart';

class AdminFeedScreen extends StatefulWidget {
  @override
  _AdminFeedScreenState createState() => _AdminFeedScreenState();
}

class _AdminFeedScreenState extends State<AdminFeedScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AdminFeedCubit>(context).getAdminFeed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<AdminFeedCubit, AdminFeedState>(
          builder: (context, state) {
        if (state is Loaded) {
          return ListView.builder(
              itemCount: state.feed.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Text(state.feed[index].title),
                      ],
                    )
                  ],
                );
              });
        }
        return Container();
      }),
    );
  }
}

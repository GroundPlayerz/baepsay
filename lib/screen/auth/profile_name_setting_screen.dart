import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/auth_cubit.dart';

class ProfileNameSettingScreen extends StatefulWidget {
  @override
  _ProfileNameSettingScreenState createState() =>
      _ProfileNameSettingScreenState();
}

class _ProfileNameSettingScreenState extends State<ProfileNameSettingScreen> {
  final TextEditingController profileNameController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    // double convertHeightRatio = mediaQuery.size.height / kIphoneXHeight;

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 38.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: double.infinity),
                SizedBox(height: 90),
                Text(
                  'Add profile name',
                ),
                SizedBox(height: 8),
                Text(
                  'Please enter your profile name.\n'
                  'This profile name will be used in our app.',
                  // style: kBodyTextStyle1M.copyWith(color: kGreyColor1_767676),
                ),
                SizedBox(height: 90),
                TextField(
                  // style: kBodyTextStyle1M,
                  // cursorColor: kSweaterzColor,
                  //keyboardType: TextInputType,
                  textAlign: TextAlign.start,
                  controller: profileNameController,
                  // decoration: kTextFieldDecoration.copyWith(
                  //     hintText: 'Enter profile name'),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                    FilteringTextInputFormatter.deny(' '),
                  ],
                  onChanged: (String value) {
                    if (value != '') {
                      setState(() {
                        _isButtonEnabled = true;
                      });
                    } else {
                      setState(() {
                        _isButtonEnabled = false;
                      });
                    }
                  },
                ),
                SizedBox(height: 18),
                TextButton(
                    child: Text('완료'),
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context).signUp(
                          profileName: profileNameController.text.trim());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:golden_balance_flutter/bloc/state/device_media_query_state.dart';

class DeviceMediaQueryCubit extends Cubit<DeviceMediaQueryState> {
  DeviceMediaQueryCubit() : super(Checking());

  void initializeMediaQuery(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    emit(Loaded(mediaQuery));
  }

  double getSafeAreaTopHeight() {
    if (state is Loaded) {
      final parsedState = (state as Loaded);
      return parsedState.mediaQuery.padding.top;
    }
    return 0.0;
  }

  double getSafeAreaVerticalHeight() {
    if (state is Loaded) {
      final parsedState = (state as Loaded);
      return parsedState.mediaQuery.padding.vertical;
    }
    return 0.0;
  }

  double getDeviceWidth() {
    if (state is Loaded) {
      final parsedState = (state as Loaded);
      return parsedState.mediaQuery.size.width;
    }
    return 0.0;
  }
}

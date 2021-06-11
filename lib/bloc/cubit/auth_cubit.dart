import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:golden_balance_flutter/bloc/state/auth_state.dart';
import 'package:golden_balance_flutter/model/member/member.dart';
import 'package:golden_balance_flutter/model/token/token.dart';
import 'package:golden_balance_flutter/repository/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  final fa.FirebaseAuth _auth = fa.FirebaseAuth.instance;

  AuthCubit({required this.repository}) : super(Checking());

  void checkMemberIdExistsInSecureStorage() async {
    try {
      String? memberId = await _secureStorage.read(key: 'member_id');
      print(memberId);
      if (memberId != null) {
        emit(DeviceMemberIdExists(memberId));
      } else {
        Response response = await repository.unauthenticatedSignUp();
        final member = Member.fromJson(response.data);
        print(member.toString());
        await _secureStorage.write(
            key: 'member_id', value: member.id.toString());
        checkMemberIdExistsInSecureStorage();
      }
    } catch (e) {
      print(e.toString());
      emit(AuthError(message: e.toString()));
    }
  }

  void signInGoogle() async {
    try {
      if (state is DeviceSignedIn) {
        await repository.googleSignIn();
        if (_auth.currentUser != null) {
          emit(FirebaseSigningIn());
        }
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  void checkIsFirebaseSignedIn() async {
    try {
      if (repository.isFirebaseSignedIn()) {
        emit(FirebaseSigningIn());
      } else {
        emit(FirebaseSignedOut());
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> getAccessTokenByState() async {
    if (state is FirebaseSignedIn) {
      await getAuthenticatedMemberAccessToken();
    } else if (state is DeviceSignedIn) {
      await getUnauthenticatedMemberAccessToken();
    }
  }

  String? getProfileName() {
    try {
      if (state is FirebaseSignedIn) {
        final parsedState = (state as FirebaseSignedIn);

        return parsedState.member.profileName;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  int? getMemberId() {
    try {
      if (state is FirebaseSignedIn) {
        final parsedState = (state as FirebaseSignedIn);

        return parsedState.member.id;
      } else if (state is DeviceSignedIn) {
        final parsedState = (state as DeviceSignedIn);

        return parsedState.member.id;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Member? getCurrentMember() {
    try {
      if (state is FirebaseSignedIn) {
        final parsedState = (state as FirebaseSignedIn);

        return parsedState.member;
      } else if (state is DeviceSignedIn) {
        final parsedState = (state as DeviceSignedIn);

        return parsedState.member;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getUnauthenticatedMemberAccessToken() async {
    try {
      final resp = await repository.getUnauthenticatedUserAccessToken();
      final accessToken = Token.fromJson(resp.data['access_token']);
      final Member member = Member.fromJson(resp.data['member']);
      await _secureStorage.delete(key: 'access_token');
      await _secureStorage.write(
          key: 'access_token', value: accessToken.accessToken);
      emit(DeviceSignedIn(member));
    } catch (e) {
      emit(AuthError(
        message: e.toString(),
      ));
    }
  }

  Future<void> getAuthenticatedMemberAccessToken() async {
    try {
      final resp = await repository.getAuthenticatedUserAccessToken();
      final accessToken = Token.fromJson(resp.data['access_token']);
      final Member member = Member.fromJson(resp.data['member']);
      await _secureStorage.delete(key: 'access_token');
      await _secureStorage.delete(key: 'user_id');
      await _secureStorage.write(
          key: 'access_token', value: accessToken.accessToken);
      emit(FirebaseSignedIn(member));
    } catch (e) {
      emit(AuthError(
        message: e.toString(),
      ));
    }
  }

  void firebaseSignOut() async {
    try {
      if (state is FirebaseSignedIn) {
        await repository.firebaseSignOut();
        emit(FirebaseSignedOut());
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}

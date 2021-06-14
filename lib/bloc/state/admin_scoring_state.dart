import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AdminScoringState extends Equatable {}

class Default extends AdminScoringState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Error extends AdminScoringState {
  final String message;
  final int? statusCode;

  Error({required this.message, this.statusCode});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class Processing extends AdminScoringState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Complete extends AdminScoringState {
  final int scoringPostCount;

  Complete({required this.scoringPostCount});

  @override
  // TODO: implement props
  List<Object?> get props => [scoringPostCount];
}

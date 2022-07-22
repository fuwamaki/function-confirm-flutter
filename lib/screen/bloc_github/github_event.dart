import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class GithubEvent extends Equatable {
  const GithubEvent();

  @override
  List<Object?> get props => [];
}

class OnSubmitSearchRequest extends GithubEvent {
  const OnSubmitSearchRequest({required this.inputText}) : super();
  final String inputText;
}

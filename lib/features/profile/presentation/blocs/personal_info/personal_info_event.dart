
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class PersonalInfoEvent extends Equatable {
  @override
  //TODO: implements props
  List<Object?> get props => [];
}

class OnEditEvent extends PersonalInfoEvent {}

class OnSaveEvent extends PersonalInfoEvent {
  final String? employeeName;
  final String? fatherName;
  final String? grandpaName;
  final String? familyName;
  final String? phoneNumber;
  final String? email;
  final File? imageUrl;

  OnSaveEvent({
    this.employeeName,
    this.fatherName,
    this.grandpaName,
    this.familyName,
    this.phoneNumber,
    this.email,
    this.imageUrl,
  });
}

class AddProfileImageEvent extends PersonalInfoEvent {
  final BuildContext? context;
  AddProfileImageEvent({this.context});
}



import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class User_model extends Equatable {
  final String id;
  final String email;
  final String name;
  final String hobby;
  final int balance;
  final String password;

  User_model({
    required this.id,
    required this.email,
    this.hobby = '',
    required this.name,
    this.balance = 280000000,
    required this.password,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [id, email, name, hobby, balance, password];
}

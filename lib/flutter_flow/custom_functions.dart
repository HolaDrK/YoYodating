import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

bool? hasNoChats(List<ChatsRecord>? allChats) {
  return allChats?.isEmpty ?? true;
}

List<String> newCustomFunction(
  List<String>? match,
  List<String>? rejected,
) {
  // combine list of match array and rejected array of users by uid and return a new list
  List<String> matchArray = ['uid1', 'uid2', 'uid3'];
  List<String> rejectedArray = ['uid2', 'uid4', 'uid5'];

  List<String> combinedArray = [...matchArray, ...rejectedArray];

  Set<String> uniqueUids = Set<String>.from(combinedArray);

  List<String> finalArray = uniqueUids.toList();

  return finalArray;
}

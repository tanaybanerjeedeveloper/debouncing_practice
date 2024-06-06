import 'package:dio/dio.dart';
import 'package:flutter_number_pagination/myhomepage_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myhomepageNotifierProvider =
    StateNotifierProvider.autoDispose<MyhomepageNotifier, AsyncValue>(
        (ref) => MyhomepageNotifier());

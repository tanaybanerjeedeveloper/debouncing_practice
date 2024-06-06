import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyhomepageNotifier extends StateNotifier<AsyncValue> {
  MyhomepageNotifier() : super(const AsyncValue<void>.data(null));

  dynamic response;

  List responseList = [];
  List<TextEditingController> listOfTextControllers = [];
  int page = 1;
  final dio = Dio();

  Future getData(int page) async {
    try {
      final response =
          await dio.get('https://jsonplaceholder.typicode.com/users/$page');

      if (response.data != null) {
        responseList.add(response);
        print(responseList);
        listOfTextControllers = responseList
            .map<TextEditingController>((item) => TextEditingController())
            .toList();
      }
    } catch (e) {
      print('error');
    }
  }
}

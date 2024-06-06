import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myhomepageNotifierProvider =
    ChangeNotifierProvider.autoDispose((ref) => MyhomepageNotifier());

class MyhomepageNotifier extends ChangeNotifier {
  MyhomepageNotifier() : super();

  dynamic response;
  bool isLoading = false;
  List responseList = [];
  List<TextEditingController> listOfTextControllers = [];
  int page = 1;
  final dio = Dio();

  Future getData(int page) async {
    try {
      isLoading = true;
      notifyListeners();

      final response =
          await dio.get('https://jsonplaceholder.typicode.com/users/$page');

      if (response.data != null) {
        isLoading = false;
        notifyListeners();

        responseList.add(response);
        print(responseList);
        listOfTextControllers = responseList
            .map<TextEditingController>((item) => TextEditingController())
            .toList();
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print('error');
    }
  }
}

// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';

void main() {
  debugPrint(minValue([7, 2, 5, 9, 1, 7, 2]).toString());
}

int minValue(arr) {
  List<int> resultList;
  int result = 0;
  resultList = arr.toSet().toList();
  resultList.sort((a, b) => a.compareTo(b));
  //debugPrint(resultList.join(""));
  for (int i in resultList) {
    result = result * 10 + i;
    //print(i);
    debugPrint(result.toString());
  }

  return result;
}







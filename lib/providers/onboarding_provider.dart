import 'package:flutter/cupertino.dart';

class OnBoardingProvider with ChangeNotifier{
  int _currentPage = 0;
  int get currentPage =>_currentPage;

  setOnBoardingPages(page){
    _currentPage = page;
    notifyListeners();
  }
}
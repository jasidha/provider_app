import 'package:flutter/material.dart';
class Provideroperations extends ChangeNotifier{
  List _word=[];
  List get words=>_word;

  void favoriteswords(String word){
    if(_word.contains(word)){
      _word.remove(word);
    }
    else{
      _word.add(word);
    }
    notifyListeners();
  }
  bool colorchange(String word){
    final colorchange2=_word.contains(word);
    return colorchange2;

  }
}
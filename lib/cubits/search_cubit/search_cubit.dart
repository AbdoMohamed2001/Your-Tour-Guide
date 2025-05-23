import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  List allResults = [];
  static SearchCubit get(context) => BlocProvider.of(context);
  static String collectionName = '' ;
  static String? collectionNameAfter ;
  final List<String> searchAbout = [
    'hotels',
    'malls',
    'places',
    'mosques',
    'cinemas',
    'cafes',
    'churchs',
    'cities',
    'restaurants',
  ];
  final List<String> searchAboutArabic = [
    'Hotels',
    'Malls',
    'Places',
    'Mosques',
    'Cinemas',
    'Cafes',
    'Churches',
    'cities',
    'Restaurants',

    // S.current.Hotels,
    // S.current.Malls,
    // S.current.Places,
    // S.current.Mosques,
    // S.current.Cinemas,
    // S.current.Cafes,
    // S.current.Churches,
    // S.current.cities,
    // S.current.Restaurants,
  ];
  //---------------------------------------------
  getClientStream() async {
    var data = await FirebaseFirestore.instance.collection('places').orderBy('name').get();
  emit(SearchDone());
  }
  void changeCollectionName(int index)  {
    collectionName = searchAbout[index];
    collectionNameAfter = collectionName;
    print('this is collection name with cubit function $collectionName');
    emit(SearchChangeCollectionName());
  }
  void pop(context){
    Navigator.pop(context,collectionName);
    emit(SearchUpdateUi());
    print('this is collectionName when pop $collectionName');

  }
  void updateUi(){
    emit(SearchUpdateUi());
  }
//---------------------------------------------------------------------
}
part of 'search_cubit.dart';

abstract class SearchState {
}

class SearchInitial extends SearchState {}
class SearchChangeIndexState extends SearchState {}
class SearchChangeCollectionName extends SearchState {}
class SearchUpdateUi extends SearchState {}
class SearchDone extends SearchState {}

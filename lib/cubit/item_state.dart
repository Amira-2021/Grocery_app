part of 'item_cubit.dart';

@immutable
abstract class ItemState {}

class ItemInitial extends ItemState {}

class ItemLoading extends ItemState {}

class ItemSuccess extends ItemState {}

class ItemFailure extends ItemState {
  final String errMessage;
  ItemFailure({required this.errMessage});
}

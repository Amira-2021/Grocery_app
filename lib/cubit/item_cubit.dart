import 'package:bloc/bloc.dart';
import 'package:grocery_app/models/item_modal_column.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit() : super(ItemInitial());

  addItem(ItemModelColumn model) async {
    emit(ItemLoading());
    try {
      var itemBox = Hive.box<ItemModelColumn>("itemBox");
      await itemBox.add(model);
      emit(ItemSuccess());
    } catch (e) {
      emit(ItemFailure(errMessage: e.toString()));
    }
  }
}

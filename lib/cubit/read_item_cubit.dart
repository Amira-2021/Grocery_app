import 'package:bloc/bloc.dart';
import 'package:grocery_app/models/item_modal_column.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

part 'read_item_state.dart';

class ReadItemCubit extends Cubit<ReadItemState> {
  ReadItemCubit() : super(ReadItemInitial());
  List<ItemModelColumn>? list;
  fetchAllItem() {
    var itemBox = Hive.box<ItemModelColumn>("itemBox");
    list = itemBox.values.toList();
    // list!.clear();
    emit(ReadItemSuccess());
  }

  clearAll() {
    list!.clear();
  }
}

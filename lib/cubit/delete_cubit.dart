import 'package:bloc/bloc.dart';
import 'package:grocery_app/models/item_modal_column.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

part 'delete_state.dart';

class DeleteCubit extends Cubit<DeleteState> {
  DeleteCubit() : super(DeleteInitial());
  removeAllNotes() {
    var notes = Hive.box<ItemModelColumn>("itemBox");
    notes.clear();
    emit(DeleteSuccess());
  }
}

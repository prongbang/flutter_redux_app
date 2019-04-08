import 'package:flutter_redux_app/core/viewmodel/item_viewmodel.dart';
import 'package:meta/meta.dart';

@immutable
class EmptyItemViewModel extends ItemViewModel {
  final String hint;
  final Function(String) onCreateItem;
  final String createItemToolTip;

  EmptyItemViewModel(this.hint, this.onCreateItem, this.createItemToolTip);
}
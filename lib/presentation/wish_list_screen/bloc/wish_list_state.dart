// ignore_for_file: must_be_immutable

part of 'wish_list_bloc.dart';

/// Represents the state of WishList in the application.
class WishListState extends Equatable {
  WishListState({
    this.taskfieldoneController,
    this.filesizeController,
    this.wishListModelObj,
  });

  TextEditingController? taskfieldoneController;

  TextEditingController? filesizeController;

  WishListModel? wishListModelObj;

  @override
  List<Object?> get props => [
        taskfieldoneController,
        filesizeController,
        wishListModelObj,
      ];
  WishListState copyWith({
    TextEditingController? taskfieldoneController,
    TextEditingController? filesizeController,
    WishListModel? wishListModelObj,
  }) {
    return WishListState(
      taskfieldoneController:
          taskfieldoneController ?? this.taskfieldoneController,
      filesizeController: filesizeController ?? this.filesizeController,
      wishListModelObj: wishListModelObj ?? this.wishListModelObj,
    );
  }
}

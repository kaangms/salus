// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatDetailViewModel on _ChatDetailViewModelBase, Store {
  final _$hasFocusAtom = Atom(name: '_ChatDetailViewModelBase.hasFocus');

  @override
  bool get hasFocus {
    _$hasFocusAtom.reportRead();
    return super.hasFocus;
  }

  @override
  set hasFocus(bool value) {
    _$hasFocusAtom.reportWrite(value, super.hasFocus, () {
      super.hasFocus = value;
    });
  }

  final _$chatDetailListAtom =
      Atom(name: '_ChatDetailViewModelBase.chatDetailList');

  @override
  List<ChatDetailResult> get chatDetailList {
    _$chatDetailListAtom.reportRead();
    return super.chatDetailList;
  }

  @override
  set chatDetailList(List<ChatDetailResult> value) {
    _$chatDetailListAtom.reportWrite(value, super.chatDetailList, () {
      super.chatDetailList = value;
    });
  }

  final _$initialLoadingAtom =
      Atom(name: '_ChatDetailViewModelBase.initialLoading');

  @override
  bool get initialLoading {
    _$initialLoadingAtom.reportRead();
    return super.initialLoading;
  }

  @override
  set initialLoading(bool value) {
    _$initialLoadingAtom.reportWrite(value, super.initialLoading, () {
      super.initialLoading = value;
    });
  }

  final _$_ChatDetailViewModelBaseActionController =
      ActionController(name: '_ChatDetailViewModelBase');

  @override
  void _changeInitialLoading() {
    final _$actionInfo = _$_ChatDetailViewModelBaseActionController.startAction(
        name: '_ChatDetailViewModelBase._changeInitialLoading');
    try {
      return super._changeInitialLoading();
    } finally {
      _$_ChatDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasFocus: ${hasFocus},
chatDetailList: ${chatDetailList},
initialLoading: ${initialLoading}
    ''';
  }
}

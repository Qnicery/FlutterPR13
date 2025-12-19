// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_review_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddReviewStore on _AddReviewStore, Store {
  Computed<bool>? _$canSubmitComputed;

  @override
  bool get canSubmit => (_$canSubmitComputed ??= Computed<bool>(
    () => super.canSubmit,
    name: '_AddReviewStore.canSubmit',
  )).value;

  late final _$textAtom = Atom(name: '_AddReviewStore.text', context: context);

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  late final _$ratingAtom = Atom(
    name: '_AddReviewStore.rating',
    context: context,
  );

  @override
  int get rating {
    _$ratingAtom.reportRead();
    return super.rating;
  }

  @override
  set rating(int value) {
    _$ratingAtom.reportWrite(value, super.rating, () {
      super.rating = value;
    });
  }

  late final _$_AddReviewStoreActionController = ActionController(
    name: '_AddReviewStore',
    context: context,
  );

  @override
  void setText(String value) {
    final _$actionInfo = _$_AddReviewStoreActionController.startAction(
      name: '_AddReviewStore.setText',
    );
    try {
      return super.setText(value);
    } finally {
      _$_AddReviewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRating(int value) {
    final _$actionInfo = _$_AddReviewStoreActionController.startAction(
      name: '_AddReviewStore.setRating',
    );
    try {
      return super.setRating(value);
    } finally {
      _$_AddReviewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
text: ${text},
rating: ${rating},
canSubmit: ${canSubmit}
    ''';
  }
}

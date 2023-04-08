import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hydra_sip/constants/constants.dart';
import 'package:hydra_sip/utils/shared_pref.dart';
import 'package:meta/meta.dart';

part 'introduction_event.dart';

part 'introduction_state.dart';

class IntroductionBloc extends Bloc<IntroductionEvent, IntroductionState> {
  IntroductionBloc() : super(IntroductionInitial()) {
    /// To get the saved index of the latest page.
    on<GetCurrentPageEvent>((event, emit) {
      emit(LoadingPageState());
      int index = _getCurrentIndex();
      emit (GetPageIndexState(index: index));
    });

    /// To save the current index of the page locally.
    on<SaveCurrentIndexEvent>((event, emit) async {
      await _updateCurrentIndex(event.index);
    });
  }

  int _getCurrentIndex() {
    return SharedPref.instance.getInt(KeyConstants.pageIndex) ?? 0;
  }

  Future<bool?> _updateCurrentIndex(int i) async {
    return await SharedPref.instance.setValue(i, KeyConstants.pageIndex);
  }
}

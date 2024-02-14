
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, Locale> {
  LanguageBloc() : super( const Locale("uz")) {
    on<ChangeLanguageEvent>((event, emit) async{
      emit(event.locale);
    });
  }
}

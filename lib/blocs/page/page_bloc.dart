import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(PageState()) {
    on<PageEvent>((event, emit) {});

    on<OnGoTo>((event, emit) {
      log('si veo entro al bloc');
      PageController controlador = PageController();
      controlador.animateToPage(
        event.index, //ver el parseo
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      log( '${event.index}');  
      // emit(state.copyWith(scrollControllerParam: controlador));
    });
  }
}

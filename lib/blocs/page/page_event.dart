part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();

  @override
  List<Object> get props => [];
}

class OnGoTo extends PageEvent {
  final int index;

  const OnGoTo({required this.index});
}

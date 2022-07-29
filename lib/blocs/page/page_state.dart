part of 'page_bloc.dart';

class PageState extends Equatable {

   PageController? scrollController =  PageController();
   

   PageState({
     this.scrollController 
   });

   PageState copyWith({
    scrollControllerParam
    }) => PageState(scrollController: scrollControllerParam ?? scrollController );

  @override
  List<Object> get props => [scrollController!];


    // llenar(){
    //   // PageController scrollControllerParam = PageController();
    //   this.scrollController!.animateToPage(
    //     1, 
    //     duration: Duration( milliseconds: 300), 
    //     curve: Curves.easeInOut
    //   );

}

// class PageInitial extends PageState {}
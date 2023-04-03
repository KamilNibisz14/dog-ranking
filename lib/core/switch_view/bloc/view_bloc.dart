import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'view_event.dart';
part 'view_state.dart';

class ViewBloc extends Bloc<ViewEvent, ViewState> {
  ViewBloc() : super(ViewNormal(isViewNormal: true)) {
    on<ViewEvent>((event, emit) {
    });
    on<ChangeView>(_onChangeView);
  }
  _onChangeView(ChangeView event, Emitter<ViewState> emit){
    if(state is ViewNormal){
      emit(ViewForOlder(isViewNormal: false));
    }
    else{
      emit(ViewNormal(isViewNormal: true));
    }
  }
}

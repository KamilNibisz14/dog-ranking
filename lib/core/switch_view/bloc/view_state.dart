part of 'view_bloc.dart';

abstract class ViewState extends Equatable {
  bool isViewNormal;
  ViewState({required this.isViewNormal});
  
  @override
  List<Object> get props => [isViewNormal];
}

class ViewNormal extends ViewState {
  ViewNormal({
    required super.isViewNormal
  });
}
class ViewForOlder extends ViewState {
  ViewForOlder({
    required super.isViewNormal
  });
}



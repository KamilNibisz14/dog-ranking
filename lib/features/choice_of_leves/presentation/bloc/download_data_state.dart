part of 'download_data_bloc.dart';

abstract class DownloadDataState extends Equatable {
  bool isVisible;
  DownloadDataState({required this.isVisible});
  
  @override
  List<Object> get props => [];
}

class DownloadDataInitial extends DownloadDataState {
  DownloadDataInitial({required super.isVisible});
}
class DownloadDataError extends DownloadDataState {
  DownloadDataError({required super.isVisible});
}
class DownloadDataSuccess extends DownloadDataState {
  DownloadDataSuccess({required super.isVisible});
}

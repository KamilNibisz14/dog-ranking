part of 'download_data_bloc.dart';

abstract class DownloadDataEvent extends Equatable {
  const DownloadDataEvent();

  @override
  List<Object> get props => [];
}

class DownloadData extends DownloadDataEvent{}
class SetInitialState extends DownloadDataEvent{}

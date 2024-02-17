part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}
class DetailLoadedEvent extends DetailEvent{
  int id;
  DetailLoadedEvent({required this.id});
}

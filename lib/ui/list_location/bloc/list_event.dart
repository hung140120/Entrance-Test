import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_event.freezed.dart';

abstract class ListEvent {
  const ListEvent();
}

@freezed
class InitListLocation extends ListEvent with _$InitListLocation {
  const factory InitListLocation() = _InitListLocation;
}

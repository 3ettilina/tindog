import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'location_request_event.dart';
part 'location_request_state.dart';

class LocationRequestBloc
    extends Bloc<LocationRequestEvent, LocationRequestState> {
  LocationRequestBloc() : super(const LocationRequestCheckingPermission()) {}
}

part of 'location_request_bloc.dart';

sealed class LocationRequestState extends Equatable {
  const LocationRequestState();
}

class LocationRequestCheckingPermission extends LocationRequestState {
  const LocationRequestCheckingPermission();

  @override
  List<Object?> get props => [];
}

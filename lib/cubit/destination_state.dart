part of 'destination_cubit.dart';

abstract class DestinationState extends Equatable {
  const DestinationState();

  @override
  List<Object> get props => [];
}

class DestinationInitial extends DestinationState {}

class DestinationLoading extends DestinationState {}

class DestinationSuccess extends DestinationState {
  final List<destinationModel> destinations;

  DestinationSuccess(this.destinations);

  @override
  // TODO: implement props
  List<Object> get props => [destinations];
}

class DestinationFail extends DestinationState {
  final String error;
  DestinationFail(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

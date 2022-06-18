import 'package:airplane/models/destination_model.dart';
import 'package:airplane/services/destination_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  void fetchDestinations() async {
    try {
      emit(DestinationLoading());
      List<destinationModel> destinations =
          await DestinationService().fetchDestination();
      emit(DestinationSuccess(destinations));
    } catch (e) {
      emit(DestinationFail(e.toString()));
    }
  }
}

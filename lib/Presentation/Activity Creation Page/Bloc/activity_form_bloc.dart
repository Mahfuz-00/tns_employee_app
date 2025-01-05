import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../Domain/Entities/activity_form_entities.dart';
import '../../../Domain/Usecases/activity_form_usercase.dart';


part 'activity_form_event.dart';
part 'activity_form_state.dart';

class ActivityFormBloc extends Bloc<ActivityFormEvent, ActivityFormState> {
  final ActivityFormUseCase createActivityUseCase;

  ActivityFormBloc(this.createActivityUseCase) : super(ActivityFormInitial());

  @override
  Stream<ActivityFormState> mapEventToState(ActivityFormEvent event) async* {
    if (event is SubmitActivityEvent) {
      yield ActivityFormLoading();
      try {
        await createActivityUseCase(event.activity);
        yield ActivityFormSuccess();
      } catch (error) {
        yield ActivityFormFailure(error.toString());
      }
    }
  }
}

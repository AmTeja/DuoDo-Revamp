import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:duodo/core/db/database.dart';
import 'package:duodo/core/domain/entities/category.dart';
import 'package:duodo/core/domain/entities/wrapped.dart';
import 'package:duodo/core/helpers/duo_logger.dart';
import 'package:duodo/features/create_todo/domain/repository/create_todo_repository.dart';
import 'package:equatable/equatable.dart';

part 'create_todo_event.dart';
part 'create_todo_state.dart';

class CreateTodoBloc extends Bloc<CreateTodoEvent, CreateTodoState> {
  CreateTodoBloc({required CreateTodoRepository createTodoRepository})
      : _createTodoRepository = createTodoRepository,
        super(const CreateTodoState()) {
    on<CreateTodoTitleChanged>(_onCreateTodoTitleChanged);
    on<CreateTodoDescriptionChanged>(_onCreateTodoDescriptionChanged);
    on<CreateTodoCategoryChanged>(_onCreateTodoCategoryChanged);
    on<CreateTodoDueDateChanged>(_onCreateTodoDueDateChanged);
    on<CreateTodoSubmitted>(_onCreateTodoSubmitted);
  }

  final CreateTodoRepository _createTodoRepository;

  void _onCreateTodoTitleChanged(
    CreateTodoTitleChanged event,
    Emitter<CreateTodoState> emit,
  ) {
    emit(state.copyWith(title: event.title));
  }

  void _onCreateTodoDescriptionChanged(
    CreateTodoDescriptionChanged event,
    Emitter<CreateTodoState> emit,
  ) {
    emit(state.copyWith(description: event.description));
  }

  void _onCreateTodoCategoryChanged(
    CreateTodoCategoryChanged event,
    Emitter<CreateTodoState> emit,
  ) {
    emit(state.copyWith(category: event.category));
  }

  void _onCreateTodoDueDateChanged(
    CreateTodoDueDateChanged event,
    Emitter<CreateTodoState> emit,
  ) {
    emit(state.copyWith(dueDate: event.dueDate));
  }

  void _onCreateTodoSubmitted(
    CreateTodoSubmitted event,
    Emitter<CreateTodoState> emit,
  ) async {
    if (state.status == CreateTodoStatus.submitting) return;

    emit(state.copyWith(status: CreateTodoStatus.submitting));

    if (state.title.trim().isEmpty) {
      emit(const CreateTodoState(
        status: CreateTodoStatus.error,
        failureMessage: 'Title cannot be empty',
      ));
      return;
    }

    if (state.description.trim().isEmpty) {
      emit(const CreateTodoState(
        status: CreateTodoStatus.error,
        failureMessage: 'Description cannot be empty',
      ));
      return;
    }

    await _createTodoRepository.createTodo(
      TodosCompanion.insert(
        title: state.title,
        description: state.description,
        category: Value(state.category?.id),
        dueDate: Value(state.dueDate),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );

    emit(const CreateTodoState(status: CreateTodoStatus.success));

    Log().info('Successfully created a todo');
  }
}

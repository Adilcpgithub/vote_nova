import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:vote_nova/data/models/candidate_model.dart';
import 'package:vote_nova/data/repositories/candidate_repository.dart';

part 'candidate_event.dart';
part 'candidate_state.dart';

class CandidateBloc extends Bloc<CandidateEvent, CandidateState> {
  final CandidateRepository repository;

  CandidateBloc(this.repository) : super(CandidateInitial()) {
    on<LoadCandidates>((event, emit) async {
      emit(CandidateLoading());
      // Simulate a delay for loading candidates
      await Future.delayed(const Duration(milliseconds: 500));

      final list = repository.getAllCandidates();
      emit(CandidateLoaded(list));
    });

    on<AddCandidate>((event, emit) {
      repository.addCandidate(event.candidate);
      add(LoadCandidates());
    });

    on<DeleteCandidate>((event, emit) {
      repository.deleteCandidate(event.index);
      add(LoadCandidates());
    });

    on<EditCandidate>((event, emit) {
      repository.updateCandidate(event.index, event.updatedCandidate);
      add(LoadCandidates());
    });

    on<VoteCandidate>((event, emit) {
      repository.voteForCandidate(event.index);
      add(LoadCandidates());
    });
    on<DeleteAllCandidates>((event, emit) {
      repository.deleteAllCandidates();
      add(LoadCandidates());
    });
  }
}

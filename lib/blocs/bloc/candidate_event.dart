part of 'candidate_bloc.dart';

@immutable
sealed class CandidateEvent {}

class LoadCandidates extends CandidateEvent {}

class AddCandidate extends CandidateEvent {
  final Candidate candidate;
  AddCandidate(this.candidate);
}

class DeleteCandidate extends CandidateEvent {
  final int index;
  DeleteCandidate(this.index);
}

class EditCandidate extends CandidateEvent {
  final int index;
  final Candidate updatedCandidate;
  EditCandidate(this.index, this.updatedCandidate);
}

class VoteCandidate extends CandidateEvent {
  final int index;
  VoteCandidate(this.index);
}

class DeleteAllCandidates extends CandidateEvent {}

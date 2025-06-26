part of 'candidate_bloc.dart';

@immutable
sealed class CandidateState {}

final class CandidateInitial extends CandidateState {}

class CandidateLoaded extends CandidateState {
  final List<Candidate> candidates;
  CandidateLoaded(this.candidates);
}

class CandidateLoading extends CandidateState {}

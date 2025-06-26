import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:vote_nova/data/models/candidate_model.dart';

class CandidateRepository {
  final Box<Candidate> candidateBox;

  CandidateRepository(this.candidateBox);

  List<Candidate> getAllCandidates() => candidateBox.values.toList();

  void addCandidate(Candidate candidate) {
    candidateBox.add(candidate);
    log(
      'Candidate added: ${candidate.name}, Total candidates: ${candidateBox.length}',
    );
  }

  void deleteCandidate(int key) {
    candidateBox.delete(key);
    log(
      'Candidate deleted at ket: $key, Remaining candidates: ${candidateBox.length}',
    );
  }

  void updateCandidate(int key, Candidate candidate) {
    candidateBox.put(key, candidate);
    log('Candidate updated at key: $key, Candidate: ${candidate.name}');
  }

  void voteForCandidate(int key) {
    final candidate = candidateBox.get(key);
    if (candidate != null) {
      candidate.voteCount++;
      candidate.save();
      log(
        'Vote added for candidate ${candidate.name}, New vote count: ${candidate.voteCount}',
      );
    }
  }

  void deleteAllCandidates() {
    candidateBox.clear();
    log('All candidates deleted, Remaining candidates: ${candidateBox.length}');
  }
}

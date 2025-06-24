import 'package:flutter/material.dart';
import 'package:vote_nova/core/utility/colors.dart';

class ResultsPage extends StatelessWidget {
  final List<CandidateResult> results;

  ResultsPage({required this.results});

  @override
  Widget build(BuildContext context) {
    final totalVotes = results.fold<int>(0, (sum, c) => sum + c.votes);
    final sortedResults = [...results]
      ..sort((a, b) => b.votes.compareTo(a.votes));
    final winner = sortedResults.first;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.primayColor,
        title: Text(
          "Election Results",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //!  Total Votes
            Text(
              "Total Votes: $totalVotes",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 16),

            // ! Winner Card
            Card(
              elevation: 4,
              color: AppColors.primayColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(winner.imagePath),
                ),
                title: Text(
                  winner.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
                subtitle: Text(
                  "🏆 Winner",
                  style: TextStyle(color: AppColors.textColor),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${winner.votes} Votes",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor,
                      ),
                    ),
                    Text(
                      "${((winner.votes / totalVotes) * 100).toStringAsFixed(1)}%",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 24),

            Text(
              "All Candidates",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),

            // 📊 All Candidates with Bars
            ...sortedResults.map((candidate) {
              final percentage = (candidate.votes / totalVotes) * 100;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          candidate.name,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "${candidate.votes} Votes (${percentage.toStringAsFixed(1)}%)",
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width *
                              (percentage / 100),
                          height: 12,
                          decoration: BoxDecoration(
                            color:
                                candidate == winner
                                    ? const Color.fromARGB(255, 66, 227, 72)
                                    : const Color.fromARGB(255, 107, 183, 221),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class CandidateResult {
  final String name;
  final int votes;
  final String imagePath;

  CandidateResult({
    required this.name,
    required this.votes,
    required this.imagePath,
  });
}

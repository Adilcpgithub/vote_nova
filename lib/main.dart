import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vote_nova/blocs/bloc/candidate_bloc.dart';
import 'package:vote_nova/core/utility/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vote_nova/data/models/candidate_model.dart';
import 'package:vote_nova/data/repositories/candidate_repository.dart';
import 'package:vote_nova/views/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // !Initialize Hive
  await Hive.initFlutter();

  //! Register adapters
  Hive.registerAdapter(CandidateAdapter());
  //! Open the box
  final candidateBox = await Hive.openBox<Candidate>('candidateBox');

  //! Create Repository
  final candidateRepository = CandidateRepository(candidateBox);

  runApp(MyApp(repository: candidateRepository));
}

class MyApp extends StatelessWidget {
  final CandidateRepository repository;
  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CandidateBloc(repository),
      child: MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class SS extends StatelessWidget {
  const SS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.discreteCircle(
          color: AppColors.primayColor,
          secondRingColor: Colors.black,
          thirdRingColor: Colors.blueAccent,
          size: 50,
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarot_app/data/repositories/tarot_repository.dart';
import 'package:tarot_app/data/source/firebase/firebase_datasource.dart';
import 'package:tarot_app/presentation/states/tarot/tarot_cubit.dart';

class DailyTarotBlocProviderWidget extends StatelessWidget{
  Widget child;

  DailyTarotBlocProviderWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RepositoryProvider.value(
        value: TarotDefaultRepository(firebaseDataSource: context.read<FirebaseDataSource>()),
        child: BlocProvider(
            create: (context) => TarotCubit(context.read<TarotDefaultRepository>()),
            child: child
        )
    );
  }
}
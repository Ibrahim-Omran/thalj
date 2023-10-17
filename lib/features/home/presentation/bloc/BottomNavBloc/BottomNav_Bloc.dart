import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thalj/features/home/presentation/bloc/BottomNavBloc/BottomNav_Event.dart';
import 'package:thalj/features/home/presentation/bloc/BottomNavBloc/BottomNav_State.dart';

class LandingPageBloc extends Bloc<LandingPageState, LandingPageEvent> {
  LandingPageBloc() : super(intialLandingPageState() as LandingPageEvent);
  static LandingPageBloc get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  // List<Widget> screens = const [Home(), Analytics(), CardScreen(), Settings()];

  // void changeIconBottonNav(index) {
  //   currentIndex = index;
  //   // ignore: invalid_use_of_visible_for_testing_member
  //   emit(changeLandingPageState() as LandingPageEvent);
  // }
}

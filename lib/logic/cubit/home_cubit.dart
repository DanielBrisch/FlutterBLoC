import 'package:bilheteria_panucci/services/movies_api.dart';
import 'package:bloc/bloc.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  final HomeService homeService = HomeService();

    Future<void> getMovies() async {
      emit(HomeLoading());

      final movies = homeService.fetchMovies();
    }
  } 


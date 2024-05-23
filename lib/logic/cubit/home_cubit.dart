import 'package:bilheteria_panucci/models/movie.dart';
import 'package:bilheteria_panucci/services/movies_api.dart';
import 'package:bloc/bloc.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  final HomeService homeService = HomeService();

  Future<void> getMovies() async {
    emit(HomeLoading());
    final movies = homeService.fetchMovies();
    try {
      final movies = await homeService.fetchMovies();
      emit(HomeSucess(movies));
    } catch (e) {
      emit(HomeError('Nao foi possivel carregar a lista de filmes'));
    }
  }
}

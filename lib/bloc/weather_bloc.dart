import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_flutter_app/model/weather_model.dart';
import 'package:weather_flutter_app/repository/weather_repository.dart';

class WeatherEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchWeatherEvent extends WeatherEvents {
  final _city;

  FetchWeatherEvent(this._city);

  @override
  List<Object> get props => [_city];
}

class ResetWeather extends WeatherEvents {}

class WeatherStates extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WeatherIsNotSearched extends WeatherStates {
  @override
  List<Object> get props => [];
}

class WeatherIsLoading extends WeatherStates {}

class WeatherIsLoaded extends WeatherStates {
  final _weather;

  WeatherIsLoaded(this._weather);

  WeatherModel get getWeather => _weather;

  @override
  List<Object> get props => [_weather];
}

class WeatherIsNotLoaded extends WeatherStates {}

class WeatherBloc extends Bloc<WeatherEvents, WeatherStates> {
  WeatherRepository weatherRepo;

  WeatherBloc(this.weatherRepo) : super(WeatherIsNotSearched());
  WeatherStates get initialState => WeatherIsNotSearched();

  @override
  Stream<WeatherStates> mapEventToState(WeatherEvents event) async* {
    if (event is FetchWeatherEvent) {
      yield WeatherIsLoading();
      try {
        WeatherModel weather = await weatherRepo.fetchWeather(event._city);
        yield WeatherIsLoaded(weather);
      } catch (_) {
        yield WeatherIsNotLoaded();
      }
    } else if (event is ResetWeather) {
      yield WeatherIsNotSearched();
    }
  }
}

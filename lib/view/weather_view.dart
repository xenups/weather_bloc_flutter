import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/bloc/weather_bloc.dart';
import 'package:weather_flutter_app/repository/weather_repository.dart';

class WeatherHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (BuildContext context) => WeatherBloc(WeatherRepository()),
          child: SearchPage()),
    );
  }
}

class SearchPage extends StatelessWidget {
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        weatherTemperature(context),
        SizedBox(
          height: 40,
        ),
        cityInput(context),
        SizedBox(
          height: 20,
        ),
        searchButton(context)
      ],
    );
  }

  Widget cityInput(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight:
              400 //put here the max height to which you need to resize the textbox
          ),
      child: Container(
        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
        // data: Theme.of(context).copyWith(splashColor: Colors.black),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: TextField(
            maxLines: null,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              contentPadding:
                  const EdgeInsets.only(left: 12.0, top: 8.0, bottom: 8.0),
              hintText: "Write City Name",
              hintStyle: TextStyle(
                  fontSize: 20.0, color: Color.fromRGBO(142, 142, 147, 0.5)),
              focusedBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                  borderSide: new BorderSide(color: Colors.black26)),
              enabledBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                  borderSide: new BorderSide(color: Colors.black26)),
              border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                  borderSide: new BorderSide(color: Colors.black26)),
            ),
            textAlign: TextAlign.left,
            controller: this.cityController,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget searchButton(BuildContext context) {
    // ignore: close_sinks
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Center(
        child: new SizedBox(
            child: FlatButton(
                padding: EdgeInsets.all(0),
                highlightColor: Color.fromRGBO(13, 61, 114, 0.2),
                // shape: RoundedRectangleBorder(
                //     borderRadius: new BorderRadius.circular(10.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Icon(
                      Icons.search,
                      size: 40.0,
                      color: Color.fromRGBO(13, 61, 114, 0.9),
                    ),
                    Text(
                      "Search",
                      style: TextStyle(fontSize: 20.0),
                    )
                  ],
                ),
                onPressed: () {
                  weatherBloc.add(FetchWeatherEvent("london"));
                })));
  }

  Widget weatherTemperature(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherStates>(builder: (context, state) {
      if (state is WeatherIsLoaded) {
        return Text(
          state.getWeather.temp.toString(),
          style: TextStyle(fontSize: 60),
        );
      }
      return Text("Nothing", style: TextStyle(fontSize: 60));
    });
  }
}

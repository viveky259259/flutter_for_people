import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_for_people/hive/bloc/hive.bloc.dart';
import 'package:flutter_for_people/hive/event/hive.event.dart';
import 'package:flutter_for_people/hive/hive.model.dart';
import 'package:flutter_for_people/hive/state/hive.state.dart';

class HiveExampleUi extends StatefulWidget {
  @override
  _HiveExampleUiState createState() => _HiveExampleUiState();
}

class _HiveExampleUiState extends State<HiveExampleUi> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HiveBloc hiveBloc = BlocProvider.of<HiveBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Hive Test"),
      ),
      body: BlocBuilder<HiveBloc, HiveState>(
        builder: (context, HiveState state) {
          Widget common = Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  hiveBloc.dispatch(WriteEvent(HiveModel("a", "B")));
                },
                child: Text("Add"),
              ),
              RaisedButton(
                onPressed: () {
                  hiveBloc.dispatch(ReadEvent());
                },
                child: Text("View"),
              ),
              RaisedButton(
                onPressed: () {
                  hiveBloc.dispatch(DeleteEvent());
                },
                child: Text("Clear"),
              )
            ],
          );

          Widget data = Text("No data");
          if (state is ReadCompleteState) {
            data = Text(state.models.length.toString());
          } else if (state is DeletingState) {
            data = Text("Deleting");
          } else if (state is DeleteCompleteState) {
            data = Text("Deleted all");
          }
          return Column(
            children: <Widget>[data, common],
          );
        },
      ),
    );
  }
}

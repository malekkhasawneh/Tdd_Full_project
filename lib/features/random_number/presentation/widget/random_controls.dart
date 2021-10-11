import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_full_project/features/random_number/presentation/bloc/random_number_bloc.dart';
import 'package:tdd_full_project/features/random_number/presentation/bloc/random_number_event.dart';

class TriviaControls extends StatefulWidget {
  @override
  _TriviaControlsState createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<TriviaControls> {
  final controller = TextEditingController();
  late String inputStr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 1.0)),
            hintText: 'Enter a number',
          ),
          onChanged: (value) {
            inputStr = value;
          },
          onSubmitted: (_) {
            dispatchConcrete();
          },
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                child: Text('Search'),
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: dispatchConcrete,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                child: Text('Get random number'),
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: dispatchRandom,
              ),
            ),
          ],
        )
      ],
    );
  }

  void dispatchConcrete() {
    controller.clear();
    BlocProvider.of<RandomNumberBloc>(context)
        .add(GetRandomForConcreteNumber(inputStr));
  }

  void dispatchRandom() {
    controller.clear();
    BlocProvider.of<RandomNumberBloc>(context).add(GetForRandomNumber());
  }
}

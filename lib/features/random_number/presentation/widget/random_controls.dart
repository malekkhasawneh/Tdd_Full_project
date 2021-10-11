import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tddfullproject/features/random_number/presentation/bloc/random_number_bloc.dart';
import 'package:tddfullproject/features/random_number/presentation/bloc/random_number_event.dart';

class RandomControls extends StatefulWidget {
  @override
  _RandomControlsState createState() => _RandomControlsState();
}

class _RandomControlsState extends State<RandomControls> {
  final controller = TextEditingController();
  String inputStr='';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.red, width: 1.0)),
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
              child: ElevatedButton(
                child: Text('Search'),
                style: ElevatedButton.styleFrom(primary: Colors.red),
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

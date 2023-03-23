import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
  const ScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //faz incrollagem
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          height: 400,
          color: Colors.amber,
        ),
        Container(
          height: 400,
          color: Colors.green,
        ),
      ],
    ));
  }
}

class ListProblem extends StatelessWidget {
  const ListProblem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      //remove erro de tamanho
      shrinkWrap: true,
      children: [
        Column(
          children: [
            Container(
              height: 400,
              color: Colors.blueGrey,
            ),
            Container(
              height: 400,
              color: Colors.deepOrangeAccent,
            ),
          ],
        ),
      ],
    );
  }
}

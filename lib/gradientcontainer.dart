import "dart:math";
import "package:flutter/material.dart";

class GradientContainer extends StatelessWidget {
  GradientContainer(this.colorList, {this.begin = Alignment.topLeft,
      this.end = Alignment.bottomRight, Key? key}) : super(key: key);

   GradientContainer.blue({super.key}) :
      colorList = [Colors.blueAccent, Colors.lightBlue],
      begin = Alignment.topLeft, end = Alignment.bottomRight;

  List<Color> colorList;
  AlignmentGeometry begin, end;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colorList,
          begin: begin,
          end: end,
        ),
      ),
      child: const Center(
        child: DiceRoller()
      )
    );
  }
}

class StyledText extends StatelessWidget {
  const StyledText(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 30,
      ),
    );
  }
}

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }

}

class _DiceRollerState extends State<DiceRoller> {

  var image1Path = "assets/images/dice-2.png",
      image2Path = "assets/images/dice-3.png";

  void rollDice() {

    final rand = Random();

    setState(() {
      var imagenumbers = [1, 2, 3, 4, 5, 6];
      var leftNum = imagenumbers[rand.nextInt(imagenumbers.length)],
          rightNum = imagenumbers[rand.nextInt(imagenumbers.length)];

      image1Path = "assets/images/dice-$leftNum.png";
      image2Path = "assets/images/dice-$rightNum.png";
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image1Path, width: 150),
            const SizedBox(width: 15,),
            Image.asset(image2Path, width: 150,)
          ],
        ),
        const SizedBox(height: 15,),
        TextButton(onPressed: rollDice,
          child: const Text("Roll Dice"),
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blueAccent,
            textStyle: const TextStyle(fontSize: 22),

          ),
        )
      ],
    );
  }

}
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.icon, required this.labelText});

  final IconData icon;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          labelText,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xff8d8e98),
          ),
        )
      ],
    );
  }
}

class thycontainer extends StatelessWidget {
  thycontainer({required this.thyChild, thyColor}) {
    
    this.thyColor = thyColor;
  }
  final Widget thyChild;
  late Color thyColor;
  late VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: thyChild,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: thyColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class ClickDetector extends StatelessWidget {

  ClickDetector(
      {required this.onPress, required this.child, required this.color});
  VoidCallback onPress;
  Widget child;
  Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPress});
  IconData icon;
  VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}
class BottumButton extends StatelessWidget {
  BottumButton({required this.onTap, required this.buttonTitlle});
  final VoidCallback onTap;
  final String buttonTitlle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitlle,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        color: Color(0xffeb1555),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 80,
      ),
    );
  }
}

import 'package:bmi/components/reuseable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi/constatnts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecardcolor=kInactiveCardColour;
  Color femalecardcolor=kInactiveCardColour;


  void updatecolor(int gender){
    if (gender==1){
      if (malecardcolor==kInactiveCardColour){
        malecardcolor=kActiveCardColour;
        femalecardcolor=kInactiveCardColour;
      }
      else{
        malecardcolor=kInactiveCardColour;
      }
    }
    if(gender==2){
      if(femalecardcolor==kInactiveCardColour){
        femalecardcolor=kActiveCardColour;
        malecardcolor=kInactiveCardColour;
      }
      else{
        femalecardcolor=kInactiveCardColour;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updatecolor(1);
                      });
                    },
                    child: ReusableCard(
                      colour: malecardcolor,
                      cardChild: IconContent(icon: FontAwesomeIcons.mars,text: "Male",
                      ),
                      
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updatecolor(2);
                      });
                    },
                    child: ReusableCard(
                      colour: femalecardcolor,
                      cardChild: IconContent(icon: FontAwesomeIcons.venus,text: "Female",),
                      
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                children: [
                  // Text("HEIGHT"),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.baseline,
                    //textBaseline: TextBaseline.alphabetic,
                    children: [],
                  )
                ],
              ),
              colour: kActiveCardColour,
              onPress: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Container(),
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Container(),
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'Calculate',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class IconContent extends StatelessWidget {
  IconContent({required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Icon(
          icon,
          size: 60.0,
          ),
        SizedBox(
          height: 15.0,
        ),
        Text(text,style: kLabelTextStyle,),
      ],
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({required this.buttonTitle, required this.onTap});

  final String buttonTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'play_quiz.dart';

class Result extends StatefulWidget {
  int score, totalQuestion, correct, incorrect;
  Result(
      {this.score,
      this.totalQuestion,
      this.correct,
      this.incorrect});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String greeting = "";
  var notAttempted=0;
  double percentage=0;
  @override


  @override
  void initState() {
    super.initState();
    setState(() {
      notAttempted = widget.totalQuestion-(widget.correct+widget.incorrect);
      percentage = (widget.score / (widget.totalQuestion * 20)) * 100;
      if (percentage >= 90) {

          greeting = "Outstanding";

      } else if (percentage > 80 && percentage < 90) {

          greeting = "Good Work";

      } else if (percentage > 70 && percentage < 80) {
          greeting = "Good Effort";
      } else if (percentage < 70) {

          greeting = "Need Improvment";
    }}
      );
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "$greeting",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "you scored ${widget.score} out of ${widget.totalQuestion * 20}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "${widget.correct} correct , ${widget.incorrect} incorrect , ${notAttempted} out of ${widget.totalQuestion} not attempted",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => PlayQuiz()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 54.0),
                child: Text("Replay Quiz Now"),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.blue),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => PlayQuiz()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 54.0),
                child: Text("go to home"),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

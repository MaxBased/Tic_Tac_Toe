import 'package:flutter/material.dart';

class hom_page extends StatefulWidget {
  const hom_page({super.key});

  @override
  State<hom_page> createState() => _hom_pageState();
}

class _hom_pageState extends State<hom_page> {
  bool isturno = false;
  List<String> list = ["", "", "", "", "", "", "", "", ""];
  var faildbox = 0;
  bool gamehasresult = false;
  int scorex = 0;
  int scoreo = 0;
  String winertitle = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              cleargame();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
        title: Text(
          "TicTacToe",
          style: TextStyle(
            fontSize: 23,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            scoredboard(),
            resultbutton(),
            SizedBox(height: 15),
            getgridview(),
            getturn(),
          ],
        ),
      ),
    );
  }

  Widget getgridview() {
    return (Expanded(
      child: GridView.builder(
        itemCount: 9,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                tapped(index);
              });
            },
            child: Container(
              width: 100,
              height: 100,
              child: Center(
                child: Text(
                  list[index],
                  style: TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: list[index] == "X" ? Colors.white : Colors.red,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
            ),
          );
        },
      ),
    ));
  }

  Widget resultbutton() {
    return Visibility(
      visible: gamehasresult,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.white),
        ),
        onPressed: () {
          setState(() {
            cleargame();
            gamehasresult = false;
          });
        },
        child: Text(
          "$winertitle" + " , play again!",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  setResult(String winner, String title) {
    setState(() {
      gamehasresult = true;
      winertitle = title;
      if (winner == 'X') {
        scorex = scorex + 1;
      } else if (winner == 'O') {
        scoreo = scoreo + 1;
      } else {
        scorex = scorex + 1;
        scoreo = scoreo + 1;
      }
    });
  }

  ///
  ///
  //////
  ///
  ///
  checkwin() {
    if (list[0] == list[1] && list[0] == list[2] && list[0] != '') {
      setResult(list[0], 'winner is ' + list[0]);
      return;
    }
    if (list[3] == list[4] && list[3] == list[5] && list[3] != '') {
      setResult(list[3], 'winner is ' + list[3]);

      return;
    }
    if (list[6] == list[7] && list[6] == list[8] && list[6] != '') {
      setResult(list[6], 'winner is ' + list[6]);

      return;
    }
    if (list[0] == list[3] && list[0] == list[6] && list[0] != '') {
      setResult(list[0], 'winner is ' + list[0]);
      return;
    }
    if (list[1] == list[4] && list[1] == list[7] && list[1] != '') {
      setResult(list[1], 'winner is ' + list[1]);
      return;
    }
    if (list[2] == list[5] && list[2] == list[8] && list[2] != '') {
      setResult(list[2], 'winner is ' + list[2]);
      return;
    }
    if (list[0] == list[4] && list[0] == list[8] && list[0] != '') {
      setResult(list[0], 'winner is ' + list[0]);
      return;
    }
    if (list[2] == list[4] && list[2] == list[6] && list[2] != '') {
      setResult(list[2], 'winner is ' + list[2]);
      return;
    }
    if (faildbox == 9) {
      setResult('', 'Draw');
    }
  }

  cleargame() {
    setState(() {
      for (var i = 0; i < list.length; i++) {
        list[i] = "";
      }
      faildbox = 0;
    });
  }

  ///

  tapped(int index) {
    if (gamehasresult == true) {
      return;
    }
    if (list[index] != "") {
      return;
    }
    if (isturno == true) {
      list[index] = "X";
      faildbox++;
    } else {
      list[index] = "O";
      faildbox++;
    }
    isturno = !isturno;
    checkwin();
  }

  Widget getturn() {
    return Text(
      isturno == true ? " turn X" : "turn O",
      style: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget scoredboard() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                "player X",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "$scorex",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                "player O",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "$scoreo",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

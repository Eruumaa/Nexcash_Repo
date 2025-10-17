import 'package:flutter/material.dart';
import '../widgets/katru_daily.dart';
import '../widgets/kartu_quiz.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(padding: EdgeInsets.all(10),child:
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome back, user",style: TextStyle(color: Color.fromARGB(255, 25, 24, 59),fontWeight: FontWeight.bold,fontFamily: "Noto Sans Symbols"  )),
                    Text("Lets learn!",style: TextStyle(color: Color.fromARGB(255, 25, 24, 59),fontSize: 30,fontWeight: FontWeight.bold,fontFamily: "Noto Sans Symbols"))
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 25, 24, 59),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: KatruDaily()
                )
              ),
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255)
                ),
                child:
                Padding(padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),child: Text("Quiz of The day",style: TextStyle(color: Color.fromARGB(255, 25, 24, 59),fontWeight: FontWeight.bold,fontSize: 18,fontFamily: "Noto Sans Symbols")),)                
                 
              ),
              Expanded(child: Container(
                width: double.infinity,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: 
                Padding(
                  padding: EdgeInsets.all(10),
                  child:
                  ListView(
                    children: [
                      KatruQuiz(),
                      KatruQuiz(),
                      KatruQuiz(),
                      KatruQuiz(),
                      KatruQuiz(),
                    ]
                  )
                )
              ))
            ],
          ),
        ),
        )
      ) ,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset("assets/home.png", height: 35, width: 35),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/game.png", height: 35, width: 35),
            label: "Game",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/leader.png", height: 35, width: 35),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/people.png", height: 25, width: 25),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/settings.png", height: 30, width: 30),
            label: "home",
          ),
        ],
      ),
    );
  }
}

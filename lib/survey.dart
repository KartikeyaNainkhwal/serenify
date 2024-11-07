import 'package:flutter/material.dart';
import 'homepage.dart';

class StressApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AICompanionScreen(),
    );
  }
}

class AICompanionScreen extends StatefulWidget {
  @override
  _AICompanionScreenState createState() => _AICompanionScreenState();
}

class _AICompanionScreenState extends State<AICompanionScreen>
    with TickerProviderStateMixin {
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "How often do you feel overwhelmed by daily responsibilities?",
      "options": ["Almost always", "Frequently", "Sometimes", "Rarely"]
    },
    {
      "question": "How well do you sleep at night?",
      "options": [
        "I rarely sleep well",
        "I struggle with sleep most nights",
        "I have occasional sleepless nights",
        "I usually sleep well"
      ]
    },
    {
      "question":
          "How do you feel about the amount of control you have over your life?",
      "options": [
        "Very little control",
        "Limited control",
        "Moderate control",
        "A lot of control"
      ]
    },
    {
      "question":
          "How often do you feel physically tense or experience muscle tightness?",
      "options": [
        "Almost every day",
        "A few times a week",
        "Occasionally",
        "Rarely"
      ]
    },
    {
      "question": "How would you describe your work-life balance?",
      "options": [
        "Extremely unbalanced",
        "Mostly unbalanced",
        "Somewhat balanced",
        "Well-balanced"
      ]
    },
    {
      "question":
          "How often do you take time to relax or do something you enjoy?",
      "options": ["Almost never", "Rarely", "Sometimes", "Frequently"]
    },
    {
      "question":
          "When faced with unexpected changes, how do you typically react?",
      "options": [
        "I panic and feel stressed",
        "I feel anxious but manage it",
        "I try to stay calm but worry",
        "I adapt calmly and confidently"
      ]
    },
    {
      "question": "How often do you feel rushed in your daily activities?",
      "options": ["Almost always", "Frequently", "Sometimes", "Rarely"]
    },
    {
      "question":
          "Do you feel supported by family, friends, or a network when you're stressed?",
      "options": ["Rarely or never", "Occasionally", "Often", "Almost always"]
    },
    {
      "question": "How would you describe your general mood most days?",
      "options": [
        "Stressed and irritable",
        "Worried but managing",
        "Mostly calm but with some stress",
        "Calm and positive"
      ]
    },
  ];

  int currentQuestionIndex = 0;
  String selectedOption = '';

  late AnimationController _bubbleController;
  late Animation<double> _bubbleScale;
  late Animation<double> _bubbleOpacity;

  late AnimationController _imageController;
  late Animation<double> _imageScale;
  late Animation<double> _imageOpacity;

  @override
  void initState() {
    super.initState();

    // Animation setup for the white box
    _bubbleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );

    _bubbleScale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _bubbleController,
        curve: Curves.easeOutBack,
      ),
    );

    _bubbleOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _bubbleController,
        curve: Curves.easeInOut,
      ),
    );

    // Animation setup for the image
    _imageController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );

    _imageScale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _imageController,
        curve: Curves.easeOutBack,
      ),
    );

    _imageOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _imageController,
        curve: Curves.easeInOut,
      ),
    );

    // Start animations on load
    _bubbleController.forward();
    _imageController.forward();
  }

  void _sendResponse() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOption = ''; // Reset selected option for the next question
      });
      _bubbleController.reset();
      _imageController.reset();
      _bubbleController.forward();
      _imageController.forward();
    } else {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              CompletionScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.8, end: 1.0).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutBack,
                  ),
                ),
                child: child,
              ),
            );
          },
          transitionDuration: Duration(milliseconds: 600),
        ),
      );
    }
  }

  @override
  void dispose() {
    _bubbleController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3F2FD),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Talk to Your Buddy',
              style: TextStyle(
                fontSize: 28,
                color: Colors.blue[800],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Let your AI buddy help you relieve stress',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Stack(
              clipBehavior: Clip.none,
              children: [
                // White box with question and options
                AnimatedBuilder(
                  animation: _bubbleController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _bubbleScale.value,
                      child: Opacity(
                        opacity: _bubbleOpacity.value,
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 30),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 15,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '${currentQuestionIndex + 1}/${questions.length}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue[600],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  questions[currentQuestionIndex]['question'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 20),
                                ...questions[currentQuestionIndex]['options']
                                    .map<Widget>((option) => RadioListTile(
                                          title: Text(option),
                                          value: option,
                                          groupValue: selectedOption,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedOption = value!;
                                            });
                                          },
                                        ))
                                    .toList(),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: selectedOption.isNotEmpty
                                      ? _sendResponse
                                      : null,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue[700],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    minimumSize: Size(double.infinity, 50),
                                  ),
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                // Animated avatar image
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.7 +
                      10, // Adjust this value as needed
                  top: 10,
                  child: AnimatedBuilder(
                    animation: _imageController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _imageScale.value,
                        child: Opacity(
                          opacity: _imageOpacity.value,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/avatar.png'), // Update with your image path
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CompletionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3F2FD),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Thank you for your responses!',
              style: TextStyle(
                fontSize: 24,
                color: Colors.blue[800],
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4, // 40% width
              child: ElevatedButton(
                onPressed: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'Done',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
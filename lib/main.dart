import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyAppPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyAppPage extends StatelessWidget {
  const MyAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Results"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.notifications,
              color: Color.fromARGB(255, 113, 14, 14),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Quiz Results",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "85%",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B0000),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: const [
                    ResultRow(label: "Total Questions", value: "20"),
                    SizedBox(height: 8),
                    ResultRow(
                      label: "Correct Answers",
                      value: "17",
                      valueColor: Colors.green,
                    ),
                    SizedBox(height: 8),
                    ResultRow(
                      label: "Wrong Answers",
                      value: "3",
                      valueColor: Colors.red,
                    ),
                    SizedBox(height: 8),
                    ResultRow(
                      label: "Time Taken",
                      value: "25:30",
                      valueColor: Colors.blueAccent,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Quiz Review",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),

          // Example Review Cards
          const ReviewCard(
            questionNumber: 1,
            question: "What is the time complexity of binary search?",
            yourAnswer: "O(log n)",
            isCorrect: true,
          ),
          const SizedBox(height: 12),
          const ReviewCard(
            questionNumber: 2,
            question: "Which data structure uses LIFO principle?",
            yourAnswer: "Queue",
            isCorrect: false,
            correctAnswer: "Stack",
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Practice'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Jobs'),
          BottomNavigationBarItem(icon: Icon(Icons.card_membership), label: 'Certificates'),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
        ],
        onTap: (int indexOfItem) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Tapped on ${indexOfItem + 1}")),
          );
        },
      ),

      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                // Your try again logic
              },
              icon: const Icon(Icons.refresh),
              label: const Text("Try Again"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B0000), // Dark red
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 12),
            OutlinedButton.icon(
              onPressed: () {
                // Navigate to all questions
              },
              icon: const Icon(Icons.list),
              label: const Text("All Questions"),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF2C3E50), // Text color
                side: const BorderSide(color: Colors.transparent),
                backgroundColor: const Color(0xFFF5F5F5), // Light background
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const ResultRow({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 64, 60, 60),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: valueColor ?? Colors.black,
          ),
        ),
      ],
    );
  }
}

class ReviewCard extends StatelessWidget {
  final int questionNumber;
  final String question;
  final String yourAnswer;
  final bool isCorrect;
  final String? correctAnswer;

  const ReviewCard({
    super.key,
    required this.questionNumber,
    required this.question,
    required this.yourAnswer,
    required this.isCorrect,
    this.correctAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(
            color: isCorrect ? Colors.green : Colors.red,
            width: 5,
          ),
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                isCorrect ? Icons.check_circle : Icons.cancel,
                color: isCorrect ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 8),
              Text(
                "Question $questionNumber",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(question, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 12),
          Text(
            "Your answer: $yourAnswer ${isCorrect ? "✓" : "✗"}",
            style: TextStyle(
              color: isCorrect ? Colors.green : Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (!isCorrect && correctAnswer != null) ...[
            const SizedBox(height: 4),
            Text(
              "Correct answer: $correctAnswer",
              style: const TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

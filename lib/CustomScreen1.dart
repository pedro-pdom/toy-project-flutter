import 'package:flutter/material.dart';

class CustomScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enquetes',
      home: PollListScreen(),
    );
  }
}

class Poll {
  final String title;
  final String question;
  final List<PollOption> options;

  Poll({required this.title, required this.question, required this.options});
}

class PollOption {
  final String text;
  int voteCount;

  PollOption({required this.text, this.voteCount = 0});
}

List<Poll> polls = [
  Poll(
    title: 'Pergunta nº1',
    question: 'Qual sua linguagem de programação favorita?',
    options: [
      PollOption(text: 'Java'),
      PollOption(text: 'Python'),
      PollOption(text: 'Javascript'),
      PollOption(text: 'Dart'),
    ],
  ),
  Poll(
    title: 'Pergunta nº2',
    question: 'Qual editor de código você mais usa?',
    options: [
      PollOption(text: 'Visual Studio'),
      PollOption(text: 'Sublime'),
      PollOption(text: 'Visual Studio Code'),
      PollOption(text: 'Atom'),
    ],
  ),
  Poll(
    title: 'Pergunta nº3',
    question: 'Qual framework mobile você mais usa?',
    options: [
      PollOption(text: 'React Native'),
      PollOption(text: 'Flutter'),
      PollOption(text: 'Ionic'),
      PollOption(text: 'Kotlin'),
    ],
  ),
];

class PollListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(),
        title: Text('Tela de Enquetes'),
      ),
      body: ListView.builder(
        itemCount: polls.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(polls[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PollDetailScreen(poll: polls[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PollDetailScreen extends StatelessWidget {
  final Poll poll;

  PollDetailScreen({required this.poll});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(poll.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              poll.question,
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: poll.options.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(poll.options[index].text),
                subtitle: Text('Votos: ${poll.options[index].voteCount}'),
                onTap: () {
                  poll.options[index].voteCount++;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Voto registrado!')),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
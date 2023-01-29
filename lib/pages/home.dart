import 'package:Labayh/pages/appointments.dart';
import 'package:Labayh/pages/programs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

var currentIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget body;
    if (currentIndex == 0) {
      body = const Home();
    } else if (currentIndex == 2) {
      body = const ProgramPage();
    } else {
      body = const AppPage();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset(
            'images/logo.png',
            width: 80,
          ),
        ),
        actions: const [
          Icon(
            Icons.search_outlined,
            color: Colors.black,
          ),
          SizedBox(
            width: 24,
          ),
          Icon(
            Icons.notifications_outlined,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: const Color.fromARGB(255, 72, 109, 245),
        unselectedItemColor: Colors.grey,
        iconSize: 32.0,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month_outlined,
            ),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pending_actions_outlined),
            label: 'Programs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_outlined),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Menu',
          ),
        ],
        currentIndex: currentIndex,
      ),
      body: body,
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: const [
          Text(
            'How are we feeling today?',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 120,
            child: moodScroll(),
          ),
          SizedBox(
            height: 24,
          ),
          sessionOptions(),
          SizedBox(
            height: 24,
          ),
          businessSection(),
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}

class businessSection extends StatelessWidget {
  const businessSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Image.asset(
              'images/business.png',
              width: 50,
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Labayh Business',
                  style: TextStyle(
                    color: Color.fromARGB(255, 72, 109, 245),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'The ultimate wellbeing solution for \norganizations',
                  style: TextStyle(
                    color: Color.fromARGB(255, 72, 109, 245),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class sessionOptions extends StatelessWidget {
  const sessionOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey.withOpacity(0.3), width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          children: const [
            session(
              img: 'images/option1.png',
              title: 'Counseling Session',
              desc: 'Book a session with the right consultant for \nyou',
            ),
            session(
              img: 'images/option2.png',
              title: 'Instant Counseling',
              desc: 'Instant sessions for emergencies within 60 \nminutes',
            ),
            session(
              img: 'images/option3.png',
              title: 'Couple therapy',
              desc: 'Psychological, emotional and family \nsessions for two',
            ),
            session(
              img: 'images/option4.png',
              title: 'Self development',
              desc: 'To boost vour Self-esteem and life skills',
            )
          ],
        ),
      ),
    );
  }
}

class session extends StatelessWidget {
  final img;
  final title;
  final desc;
  const session({Key? key, required this.img, required this.title, required this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Image.asset(
              img,
              width: 50,
            ),
          ],
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              desc,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: false,
            ),
            const SizedBox(
              width: 290,
              child: Divider(
                thickness: 1,
                height: 36,
              ),
            )
          ],
        ),
      ],
    );
  }
}

class moodScroll extends StatelessWidget {
  const moodScroll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: const [
        Mood(
          mood: '😃',
          moodTitle: 'Happy',
        ),
        Mood(
          mood: '😐',
          moodTitle: 'Neutral',
        ),
        Mood(
          mood: '🤒',
          moodTitle: 'Tired',
        ),
        Mood(
          mood: '😓',
          moodTitle: 'Disappointed',
        ),
        Mood(
          mood: '😠',
          moodTitle: 'Angry',
        ),
        Mood(
          mood: '😢',
          moodTitle: 'Sad',
        ),
        Mood(
          mood: '😰',
          moodTitle: 'Anxious',
        ),
        Mood(
          mood: '😌',
          moodTitle: 'Content',
        ),
        Mood(
          mood: '🙂',
          moodTitle: 'Adaptive',
        ),
      ],
    );
  }
}

class Mood extends StatelessWidget {
  final String mood;
  final String moodTitle;
  const Mood({
    Key? key,
    required this.mood,
    required this.moodTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                mood,
                style: const TextStyle(fontSize: 36),
              ),
            ),
          ),
          Text(moodTitle),
        ],
      ),
    );
  }
}

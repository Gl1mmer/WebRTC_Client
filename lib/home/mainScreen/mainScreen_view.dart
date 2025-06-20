import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomad_codes_project/home/mainScreen/mainScreen_viewModel.dart';
import 'package:nomad_codes_project/home/pages/view.dart';


class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(mainTabProvider);

    final pages = const [
      ContactsPage(),
      HistoryPage(),
      DialerPage(),
      ChatPage(),
      TeamPageView(),
    ];

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: currentIndex,
        onTap: (index) => ref.read(mainTabProvider.notifier).changeTab(index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: 'Contacts'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.dialpad), label: 'Dialer'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Team'),
        ],
      ),
    );
  }
}

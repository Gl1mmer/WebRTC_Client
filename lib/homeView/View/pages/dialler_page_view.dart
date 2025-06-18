import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomad_codes_project/homeView/ViewModel/dialer_viewModel.dart';

class DialerPage extends ConsumerWidget {
  const DialerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final number = ref.watch(dialerProvider);
    final vm     = ref.read(dialerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialer'),
        centerTitle: true,
        elevation: 1,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  number.isEmpty ? 'Введите номер' : number,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 28),
                ),
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var row in [
                    ['1', '2', '3'],
                    ['4', '5', '6'],
                    ['7', '8', '9'],
                    ['*', '0', '#'],
                  ])
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: row.map((d) {
                          return _NumButton(
                            label: d,
                            onTap: () => vm.appendDigit(d),
                          );
                        }).toList(),
                      ),
                    ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    iconSize: 32,
                    icon: const Icon(Icons.clear),
                    onPressed: vm.clear,
                  ),

                  ElevatedButton(
                    onPressed: number.isEmpty ? null : vm.call,
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                      backgroundColor: Colors.green,
                    ),
                    child: const Icon(Icons.phone, size: 32, color: Colors.white),
                  ),

                  IconButton(
                    iconSize: 32,
                    icon: const Icon(Icons.backspace),
                    onPressed: vm.backspace,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NumButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _NumButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

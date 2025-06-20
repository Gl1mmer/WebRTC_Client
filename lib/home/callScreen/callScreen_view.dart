import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'callScreen_viewModel.dart';

class CallScreen extends ConsumerWidget {
  final String number;
  const CallScreen({super.key, required this.number});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inCall = ref.watch(callProvider);
    final vm = ref.read(callProvider.notifier);

    if (!inCall) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pop(context);
      });
      return const SizedBox.shrink();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Звонок'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              Text(
                number,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              const Text(
                'Идёт звонок...',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _FeatureButton(
                    icon: Icons.mic_off,
                    label: 'Mute',
                    onTap: vm.toggleMute,
                  ),
                  _FeatureButton(
                    icon: Icons.volume_up,
                    label: 'Speaker',
                    onTap: vm.toggleSpeaker,
                  ),
                ],
              ),
              const Spacer(),

              ElevatedButton(
                onPressed: vm.hangUp,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(24),
                  backgroundColor: Colors.red,
                ),
                child: const Icon(Icons.call_end, size: 36, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _FeatureButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey.shade200,
            child: Icon(icon, size: 28, color: Colors.grey.shade800),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}

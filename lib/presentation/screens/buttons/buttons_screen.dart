import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
            const ElevatedButton(
              onPressed: null,
              child: Text('ElevatedDisabled'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('ElevatedIcon'),
            ),
            FilledButton(onPressed: () {}, child: const Text('Filled')),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.abc_outlined),
              label: const Text('FilledIcon'),
            ),
            OutlinedButton(onPressed: () {}, child: const Text('Outline')),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.account_box_rounded),
              label: const Text('OutlineIcon'),
            ),
            TextButton(onPressed: () {}, child: const Text('Text')),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.receipt),
              label: const Text('Text Icon'),
            ),
            const CustomButton(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.app_registration_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.tab_outlined),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colors.primary),
                  iconColor: const MaterialStatePropertyAll(Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hola',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

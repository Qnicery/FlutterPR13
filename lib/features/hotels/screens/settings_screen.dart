import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../main.dart';
import '../stores/auth_store.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Настройки', style: TextStyle(fontWeight: FontWeight.bold)), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Сменить тему'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.push("/profile/settings/faq");
              },
              child: const Text('Помощь'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                getIt<AuthStore>().logout();
                GoRouter.of(context).go('/login');
              },
              child: const Text('Выйти'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                getIt<AuthStore>().deleteAccount();
                GoRouter.of(context).go('/login');
              },
              child: const Text('Удалить аккаунт'),
            ),
          ],
        ),
      ),
    );
  }
}

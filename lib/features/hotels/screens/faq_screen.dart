import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../main.dart';
import '../stores/faq_store.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final faqStore = getIt<FaqStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("FAQ"),
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: faqStore.items.length,
            itemBuilder: (context, index) {
              final item = faqStore.items[index];
              final expanded = faqStore.isExpanded(index);

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ExpansionTile(
                  initiallyExpanded: expanded,
                  title: Text(item.question),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(item.answer),
                    ),
                  ],
                  onExpansionChanged: (_) => faqStore.toggleExpand(index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

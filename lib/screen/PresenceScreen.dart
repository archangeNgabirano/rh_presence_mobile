import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rh_presence_mobile/model/presence.dart';
import 'package:rh_presence_mobile/providers/presenceProvider.dart';

class PresenceScreen extends ConsumerWidget {
  const PresenceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    //ApiService.getListePresence();
    final data = ref.refresh(serviceDataProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 6, 110, 5),
        title: const Text("Historique des presences"),
      ),
      body: data.when(
        data: (elements) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: elements.length,
                  itemBuilder: (ctx, index) => ItemPresence(elements[index]),
                ),
              ),
            ],
          );
        },
        error: (err, s) => Text(err.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class ItemPresence extends StatelessWidget {
  final Presence presence;
  const ItemPresence(this.presence, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xff764abc),
          child: Text("${presence.id}"),
        ),
        title: Center(child: Text('Date :  ${presence.getCreated_at}')),
        subtitle: Row(
          children: [
            const Icon(Icons.access_alarm),
            Text('${presence.getDate_in} '),
            const Spacer(),
            const Icon(Icons.blind),
            Text('${presence.getDate_out} '),
          ],
        ),
        trailing: Container(
          color: const Color.fromARGB(255, 154, 148, 163),
          child: Text("${presence.time_per_day} "),
        ),
      ),
    );
  }
}

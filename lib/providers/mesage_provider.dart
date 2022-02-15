
class MessageProvider {
  final int count;
  final Set<String> items;

  const MessageProvider({required this.count, required this.items});

  String get message => 'You have clicked $count times and list size is ${items.length}';
}
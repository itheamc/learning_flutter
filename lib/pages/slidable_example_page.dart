import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableExamplePage extends StatelessWidget {
  const SlidableExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slidable Example',
      home: Scaffold(
        body: ListView.builder(
          itemCount: _slidableItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Slidable(
              // Specify a key if the Slidable is dismissible.
              key: ValueKey(_slidableItems[index]),

              // The start action pane is the one at the left or the top side.
              startActionPane: const ActionPane(
                // A motion is a widget used to control how the pane animates.
                motion: BehindMotion(),
                // All actions are defined in the children parameter.
                children: [
                  // A SlidableAction can have an icon and/or a label.
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: 'Share',
                  ),
                ],
              ),

              // The end action pane is the one at the right or the bottom side.
              endActionPane: const ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    // An action can be bigger than the others.
                    flex: 2,
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF7BC043),
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    label: 'Archive',
                  ),
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF0392CF),
                    foregroundColor: Colors.white,
                    icon: Icons.save,
                    label: 'Save',
                  ),
                ],
              ),

              // The child of the Slidable is what the user sees when the
              // component is not dragged.
              child: _slidableView(context, _slidableItems[index]),
            );
          },

        )
      ),
    );
  }

}

void doNothing(BuildContext context) {

}


Widget _slidableView(BuildContext context, String string) {
  return ListTile(
    title: Text(string),
  );
}

var _slidableItems = [
  "Item - 1",
  "Item - 2",
  "Item - 3",
  "Item - 4",
  "Item - 5",
  "Item - 6",
  "Item - 7",
  "Item - 8",
  "Item - 9",
  "Item - 10",
];
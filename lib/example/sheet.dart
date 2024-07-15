import 'package:flutter/material.dart';

class SheetPage extends StatefulWidget {
  const SheetPage({super.key});

  @override
  State createState() => _SheetPageState();
}

class _SheetPageState extends State<SheetPage> {
  final DraggableScrollableController _scrollableController =
  DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Sheet Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => DraggableScrollableSheet(
                controller: _scrollableController,
                initialChildSize: 0.2,
                minChildSize: 0.2,
                maxChildSize: 0.7,
                expand: false,
                builder: (context, scrollController) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            color: Colors.red,
                            child: const Center(
                              child: Text('Drag me up and down'),
                            ),
                          ),
                          ListView.builder(
                            controller: scrollController,
                            shrinkWrap: true,
                            itemCount: 25,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text('Item $index'),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
          child: const Text('Show Bottom Sheet'),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class Rector extends StatefulWidget {
  const Rector({super.key});

  @override
  State<Rector> createState() => _RectorState();
}

class _RectorState extends State<Rector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Rektorga murojaat",
          style: TextStyle(color: Colors.amber),
        ),
        toolbarHeight: 150,
        backgroundColor: Color(0xFF002D6D),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return const MobileView();
          } else if (constraints.maxWidth < 1200) {
            return const TabletView();
          } else {
            return const DesktopView();
          }
        },
      ),
    );
  }
}

class MobileView extends StatelessWidget {
  const MobileView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("📱 Mobil Ko'rinish"));
  }
}

class TabletView extends StatelessWidget {
  const TabletView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("💻 Planshet Ko'rinish"));
  }
}

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.8,
      color: Colors.cyan,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300, // yoki MediaQuery.of(context).size.width * 0.8
                child: TextField(
                  decoration: InputDecoration(labelText: 'Ismingiz'),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}

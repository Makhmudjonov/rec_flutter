import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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
      backgroundColor: Color(0xFFF1F4F8),
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
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
        child: Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            padding: EdgeInsets.all(50),
            margin: EdgeInsets.all(50),
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF002D6D),
                  width: 1.0,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth *
                          0.2, // yoki MediaQuery.of(context).size.width * 0.8
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'Ism',
                            labelText: "Ism"),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: screenWidth *
                          0.2, // yoki MediaQuery.of(context).size.width * 0.8
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'Familiya',
                            labelText: "Familiya"),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: screenWidth *
                          0.2, // yoki MediaQuery.of(context).size.width * 0.8
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'Sharif',
                            labelText: "Sharif"),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth *
                          0.2, // yoki MediaQuery.of(context).size.width * 0.8
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'Pochta',
                            labelText: "Pochta"),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: screenWidth *
                          0.2, // yoki MediaQuery.of(context).size.width * 0.8
                      child: IntlPhoneField(
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                          counterText: '',
                          labelText: 'Telefon raqam',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        initialCountryCode: 'UZ',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: screenWidth *
                          0.2, // yoki MediaQuery.of(context).size.width * 0.8
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Jinsingiz',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        value: "Erkak",
                        items: ['Erkak', 'Ayol'].map((gender) {
                          return DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth *
                          0.62, // yoki MediaQuery.of(context).size.width * 0.8
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'Murojaat mavzusi',
                            labelText: "Murojaat mavzusi"),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: screenWidth *
                          0.62, // yoki MediaQuery.of(context).size.width * 0.8
                      child: TextFormField(
                        maxLines: 10, // yoki null desangiz cheksiz bo'ladi
                        minLines: 3,
                        decoration: InputDecoration(
                          labelText: 'Murojaat kiriting',
                          hintText: 'Murojaat',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: EdgeInsets.all(12),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Text("data"),
          flex: 1,
        )
      ],
    ));
  }
}

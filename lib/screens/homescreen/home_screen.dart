import 'dart:io';
import 'package:flutter/material.dart';
import 'package:quotes/colors/colors.dart';
import '../../utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool list = true;
  @override
  void initState() {
    super.initState();
    g1.generate();
  }

  @override
  Widget build(BuildContext context) {

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        {
          alert(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Morning Quotes",
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          leading: InkWell(
            onTap: () {
              alert(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  list = !list;
                });
              },
              icon: Icon(list ?Icons.grid_on:Icons.list),
            ),
          ],
        ),
        body: list
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: g1.quotes.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: RandomColorModel().getColor(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Column(
                        children: [
                          Text(
                            "${g1.quotes[index].types}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "${g1.quotes[index].quotes}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "${g1.quotes[index].originator}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            : ListView.builder(
                itemCount: g1.quotes.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: RandomColorModel().getColor(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Column(
                        children: [
                          Text(
                            "${g1.quotes[index].types}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${g1.quotes[index].quotes}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "- ${g1.quotes[index].originator}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  void alert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Are You Sure To Exit ?"),
        actions: [
          ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: const Text("Yes"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("No"),
          ),
        ],
      ),
    );
  }
}

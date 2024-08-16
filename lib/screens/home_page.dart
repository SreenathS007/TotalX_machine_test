import 'dart:io'; // Import to use File class
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../view/add_user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String sortOption = "All";
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final users = userProvider.users.where((user) {
      if (searchQuery.isNotEmpty &&
          !user.name.toLowerCase().contains(searchQuery.toLowerCase())) {
        return false;
      }

      if (sortOption == "Age Elder") {
        return user.age >= 60;
      } else if (sortOption == "Age Younger") {
        return user.age < 60;
      }
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Row(
          children: [
            Icon(
              Icons.location_on,
              color: Colors.white,
            ),
            SizedBox(width: 5),
            Text(
              "Nilampur",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: [
          // Removed menu icon from AppBar actions
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Search...",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    width:
                        10), // Add some spacing between the search bar and menu icon
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Sort'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RadioListTile<String>(
                                title: const Text('All'),
                                value: 'All',
                                groupValue: sortOption,
                                onChanged: (value) {
                                  setState(() {
                                    sortOption = value!;
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                              RadioListTile<String>(
                                title: const Text('Age Elder'),
                                value: 'Age Elder',
                                groupValue: sortOption,
                                onChanged: (value) {
                                  setState(() {
                                    sortOption = value!;
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                              RadioListTile<String>(
                                title: const Text('Age Younger'),
                                value: 'Age Younger',
                                groupValue: sortOption,
                                onChanged: (value) {
                                  setState(() {
                                    sortOption = value!;
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Users Lists",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: users.map((user) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: user.image.isEmpty
                              ? null
                              : FileImage(
                                  File(user.image)), // Convert String to File
                          child: user.image.isEmpty
                              ? const Icon(Icons.person)
                              : null,
                        ),
                        title: Text(user.name),
                        subtitle: Text("Age: ${user.age}"),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddUserDialog(
                onSave: (user) {
                  Provider.of<UserProvider>(context, listen: false)
                      .addUser(user);
                },
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

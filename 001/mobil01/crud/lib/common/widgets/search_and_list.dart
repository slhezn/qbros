import 'package:crud/logic/login_view_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../service/data_service.dart';

class SearchAndList extends StatefulWidget {
  const SearchAndList({Key? key, required this.title, required this.map})
      : super(key: key);
  final String title;
  final List<Map<String, dynamic>> map;

  @override
  State<SearchAndList> createState() => _SearchAndListState();
}

class _SearchAndListState extends State<SearchAndList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
        actions: [
          Center(child: Text(context.read<LoginViewLogic>().username!)),
          const SizedBox(width: 10),
          Center(child: Text(context.read<LoginViewLogic>().currentUserId!.toString())),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => context.read<DataService>().query = value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.map.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => widget.map[index]['link']));
                    context.read<DataService>().query = '';
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 5),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 189, 22, 78),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    height: 80,
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      color: const Color.fromARGB(255, 189, 22, 78),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://cdn-yb.ams3.cdn.digitaloceanspaces.com/uploads/universities/217/15554183161370535121.jpeg',
                            ),
                          ),
                          Text(
                            widget.map[index]['name'],
                            style: const TextStyle(color: Colors.white),
                          ),
                          const Icon(
                            Icons.arrow_right,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

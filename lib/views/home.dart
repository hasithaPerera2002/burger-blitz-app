// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, prefer_final_fields, unused_field, avoid_print, use_key_in_widget_constructors

import 'package:burger_blitz/components/burger_tile.dart';
import 'package:burger_blitz/const/colors.dart';
import 'package:burger_blitz/service/burger_service.dart';
import 'package:flutter/material.dart';

import '../model/burger.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Burger>> _burgers = Future.value([]);
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    print('init state called');
    loadBurgers();
  }

  loadBurgers() async {
    try {
      final burgers = await BurgerService().getBurgers();
      setState(() {
        _burgers = Future.value(burgers);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 120.0),
          child: Text(
            'Burger Blitz',
            style: TextStyle(
              fontFamily: 'Quicksand',
              color: kPrimary,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                child: FutureBuilder<List<Burger>>(
                  future: _burgers,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: kPrimary,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error loading burgers'),
                      );
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return BurgerTile(
                            burger: snapshot.data![index],
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text(
                          'No burgers found',
                          style: TextStyle(
                            color: kSecondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Quicksand',
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

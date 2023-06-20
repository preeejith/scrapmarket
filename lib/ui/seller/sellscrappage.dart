import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:scrap_market/homescreen.dart';
import 'package:scrap_market/models/scrapmodel.dart';

import '../../bloc/authbloc.dart';

class SellScrapPage extends StatefulWidget {
  const SellScrapPage({super.key});

  @override
  _SellScrapPageState createState() => _SellScrapPageState();
}

class _SellScrapPageState extends State<SellScrapPage> {
  bool valuefirst = false;
  Position? _currentPosition;
  String _selectedCategory = 'Metal';
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final List<ScrapModel> _scraplist = [];
  final List<String> _scraplist2 = [];
  final List<String> _categories = [
    'Metal',
    'Plastic',
    'Paper',
    'Glass',
    'Electronics',
    'Others',
  ];

  @override
  void dispose() {
    _quantityController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    ininfunc();
  }

  ininfunc() async {
    await _getCurrentLocation();
  }

  _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    _currentPosition = position;
    setState(() {
      _currentPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text('Sell My Scrap'),
          ),
      bottomNavigationBar: _currentPosition == null
          ? const SizedBox.shrink()
          : SizedBox(
              height: 80,
              child: Column(
                children: [
                  // const SizedBox(height: 20.0),
                  // location(),
                  // const SizedBox(height: 20.0),

                  ElevatedButton(
                      onPressed: () {
                        // Add functionality to submit scrap details
                        submitScrap(context);
                      },
                      child: BlocConsumer<LoginBloc, LoginState>(
                        builder: (context, state) {
                          if (state is Selling) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            return const Text('Submit');
                          }
                        },
                        listener: (context, state) {
                          if (state is SoldSuccess) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          } else if (state is SoldError) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                            Fluttertoast.showToast(
                                msg: "Scrap added successfully");
                          }
                        },
                      )),
                ],
              ),
            ),
      body: _currentPosition == null
          ? const Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text("Location Fetching..")
              ],
            ))
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Sell My Scrap',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20.0),
                    DropdownButtonFormField(
                      value: _selectedCategory,
                      items: _categories.map((category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value.toString();
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Select Category',
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextField(
                      controller: _quantityController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Quantity (in kilograms)',
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextField(
                      textInputAction: TextInputAction.done,
                      controller: _descriptionController,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        // Add functionality to submit scrap details
                        _addProduct();
                      },
                      child: const Text('Add'),
                    ),
                    const SizedBox(height: 20.0),
                    _scraplistview(),
                  ],
                ),
              ),
            ),
    );
  }

  _scraplistview() {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _scraplist.length,
        itemBuilder: (context, index) {
          ScrapModel scrap = _scraplist[index];
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  scrap.category.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text("${scrap.quantity!}gm"),
              ],
            ),
          );
        },
      ),
    );
  }

  location() {
    return Column(
      children: [
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Checkbox(
              checkColor: Colors.white,
              activeColor: const Color(0xff4e4376),
              value: valuefirst,
              onChanged: (value) {
                setState(() {
                  valuefirst = value!;
                });
              },
            ),

            const SizedBox(
              width: 200,
              child: Text(
                'Do you want to set this location as your Location: ',
                style: TextStyle(fontSize: 13.0),
              ),
            ), //Text
            const SizedBox(width: 10), //SizedBox
          ], //<Widget>[]
        ),
        // valuefirst
        //     ? Container(
        //         padding: const EdgeInsets.only(
        //             left: 12.0, right: 12.0, top: 20.0, bottom: 20.0),
        //         width: MediaQuery.of(context).size.width,
        //         decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(2),
        //           boxShadow: [
        //             BoxShadow(
        //               color: Colors.grey.withOpacity(0.3),
        //               spreadRadius: 4,
        //               blurRadius: 4,
        //             ),
        //           ],
        //         ),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: <Widget>[
        //             Row(
        //               children: [
        //                 const Text(
        //                   "SITE LOCATION",
        //                   overflow: TextOverflow.ellipsis,
        //                 ),
        //                 const Spacer(),
        //                 InkWell(
        //                   child: const Icon(
        //                     Icons.refresh,
        //                     size: 24,
        //                   ),
        //                   onTap: () {
        //                     setState(() {
        //                       _getCurrentLocation();
        //                     });
        //                   },
        //                 ),
        //               ],
        //             ),
        //             const SizedBox(
        //               height: 5.0,
        //             ),
        //             const Divider(
        //               // color: AppStyles.dividerColor,
        //               thickness: 1,
        //             ),
        //             const SizedBox(
        //               height: 5.0,
        //             ),
        //             Column(
        //               children: [
        //                 Row(
        //                   crossAxisAlignment: CrossAxisAlignment.center,
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: <Widget>[
        //                     _currentPosition == null
        //                         ? Container()
        //                         : Text(
        //                             _currentPosition!.latitude.toString(),
        //                           ),
        //                     const Spacer(),
        //                     _currentPosition == null
        //                         ? Container()
        //                         : Text(
        //                             _currentPosition!.longitude.toString(),
        //                           ),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //       )
        //     : const SizedBox.shrink(),
      ],
    );
  }

  Future<void> submitScrap(BuildContext context) async {
    if (_scraplist.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter the items");
    } else {
      // _scraplist2.add(_scraplist[0].category.toString());

      // _scraplist2.add(_scraplist[0].quantity.toString());
      // _scraplist2.add(_scraplist[0].description.toString());

      // if (_scraplist2.isEmpty) {
      //   await PrefManager.setIsProductdata(_scraplist2);
      // }

      BlocProvider.of<LoginBloc>(context).add(GetSellEvent(
        category: _scraplist.isEmpty ? "" : _scraplist[0].category,
        quantity: _scraplist.isEmpty ? "" : _scraplist[0].quantity,
        description: _scraplist.isEmpty ? "" : _scraplist[0].description,
      ));
    }

    print(_scraplist);
  }

  void _addProduct() {
    String category = _selectedCategory;
    String quantity = _quantityController.text.toString();
    double.parse(_quantityController.text);
    String description = _descriptionController.text;

    ScrapModel newProduct = ScrapModel(
        category: category, description: description, quantity: quantity);

    setState(() {
      _scraplist.add(newProduct);
    });

    _descriptionController.clear();
    _quantityController.clear();
  }

  void _submitScraplist() {
    setState(() {
      _scraplist.clear();
    });
  }
}

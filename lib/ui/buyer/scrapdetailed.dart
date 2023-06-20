import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:scrap_market/bloc/authbloc.dart';

class ProductViewPage extends StatefulWidget {
  final String category;
  final String metal;
  final String quantity;
  final String description;
  final String location;

  const ProductViewPage({
    super.key,
    required this.category,
    required this.metal,
    required this.quantity,
    required this.description,
    required this.location,
  });

  @override
  State<ProductViewPage> createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
  String? _currentAddress;
  final TextEditingController price = TextEditingController();
  Future<String> getLocationFromCoordinates(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks.first;

      String address =
          '${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}';
      return address;
    } catch (e) {
      return 'Error: Unable to fetch location';
    }
  }

  @override
  void initState() {
    // _getAddressFromLatLng();
    super.initState();
  }

  // _getlocation() async {

  //   var location = await getLocationFromCoordinates(latitude, longitude);
  //   print('Location: $location');
  // }

  _getAddressFromLatLng() async {
    double latitude = 9.5425; // Example latitude
    double longitude = 76.8202;
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      Placemark place = placemarks[0];
      setState(() {
        _currentAddress = "${place.locality}, ${place.postalCode}";
        print(_currentAddress);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                      itemCount: context.read<LoginBloc>().scraplist2!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Category:',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8.0),
                            Text(context
                                .read<LoginBloc>()
                                .scraplist2![index]
                                .category
                                .toString()),
                            const SizedBox(height: 16.0),
                            const SizedBox(height: 16.0),
                            const Text(
                              'Quantity:',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8.0),
                            Text(context
                                .read<LoginBloc>()
                                .scraplist2![index]
                                .quantity
                                .toString()),
                            const SizedBox(height: 16.0),
                            const Text(
                              'Description:',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8.0),
                            Text(context
                                .read<LoginBloc>()
                                .scraplist2![index]
                                .quantity
                                .toString()),
                            const SizedBox(height: 16.0),
                            const Text(
                              'Location:',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8.0),
                            const Text("Koovapally"),
                            const SizedBox(height: 32.0),
                          ],
                        );
                      }),
                ),
                Center(
                  child: SizedBox(
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: price,
                        decoration: const InputDecoration(
                          labelText: 'Amount',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement buy logic here
                    },
                    child: const Text('Buy Request'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ProductViewPage(
      category: 'Category 1',
      metal: 'Metal 1',
      quantity: '10',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      location: 'New York',
    ),
  ));
}

// import 'package:connectivity_plus/connectivity_plus.dart';

// class ConnectivityService {
//   final Connectivity _connectivity = Connectivity();
//   ConnectivityResult connectivityResult = ConnectivityResult.none;

//   ConnectivityService() {
//     _initializeConnectivity();
//   }

//   // Initialize connectivity and listen for changes
//   void _initializeConnectivity() {
//     _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
//       connectivityResult = result;
//       // You can add additional logic here if needed when connectivity changes.
//     });
//   }

//   // Check if connected to the internet
//   Future<bool> isConnected() async {
//     final result = await _connectivity.checkConnectivity();
//     connectivityResult = result; // Update the current connectivity result
//     return result != ConnectivityResult.none;
//   }
// }
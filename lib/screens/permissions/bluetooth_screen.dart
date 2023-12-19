import 'package:permission_handler/permission_handler.dart';

// export this function to main.dart

Future<void> fnRequestBluetoothPermissions() async {
  if (await Permission.bluetooth.request().isGranted) {
    // Permissions already granted, proceed with Bluetooth functionality
    // Call the method or perform actions related to Bluetooth here

    print("Bluetooth permissions are granted.");
  } else {
    // Permissions are not granted yet, request them
    Map<Permission, PermissionStatus> statuses = await [
      Permission.bluetooth,
      Permission.bluetoothConnect,
    ].request();
    // Check if permissions were granted or denied
    if (statuses[Permission.bluetooth] == PermissionStatus.granted &&
        statuses[Permission.bluetoothConnect] == PermissionStatus.granted) {
      // Permissions granted, proceed with Bluetooth functionality
      // Call the method or perform actions related to Bluetooth here

      print("Bluetooth permissions are granted (actual value: $statuses).");
    } else {
      // Permissions denied, handle this scenario accordingly
      // You may show a message or handle the lack of permissions

      // For example, show a SnackBar informing the user that they have
      // rejected a core permission and may not be able to accomplish
      // what they originally intended. In this case, the user must
      // navigate to the settings menu and manually enable permissions.

      print("Bluetooth permissions are denied (actual value: $statuses).");
    }
  }
}

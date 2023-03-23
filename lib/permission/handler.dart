import "package:permission_handler/permission_handler.dart";

Future<void> requestRecordPermission() async {
  PermissionStatus status = await Permission.microphone.status;
  if (!status.isGranted) {
    await Permission.microphone.request();
  }
}

Future<void> requestStoragePermission() async{

}

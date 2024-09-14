import 'package:flutter_uxcam/flutter_uxcam.dart';

void initUXCam() {
  FlutterUxcam
      .optIntoSchematicRecordings(); // Confirm that you have user permission for screen recording
  FlutterUxConfig config =
      FlutterUxConfig(userAppKey: "", enableAutomaticScreenNameTagging: false);
  FlutterUxcam.startWithConfiguration(config);
}

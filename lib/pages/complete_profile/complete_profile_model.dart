import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'complete_profile_widget.dart' show CompleteProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompleteProfileModel extends FlutterFlowModel<CompleteProfileWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for age widget.
  TextEditingController? ageController;
  String? Function(BuildContext, String?)? ageControllerValidator;
  // State field(s) for display_name widget.
  TextEditingController? displayNameController;
  String? Function(BuildContext, String?)? displayNameControllerValidator;
  // State field(s) for gender widget.
  TextEditingController? genderController;
  String? Function(BuildContext, String?)? genderControllerValidator;
  // State field(s) for desiredGender widget.
  TextEditingController? desiredGenderController;
  String? Function(BuildContext, String?)? desiredGenderControllerValidator;
  // State field(s) for location widget.
  TextEditingController? locationController;
  String? Function(BuildContext, String?)? locationControllerValidator;
  // State field(s) for number widget.
  TextEditingController? numberController;
  String? Function(BuildContext, String?)? numberControllerValidator;
  // State field(s) for yourEverythingelse widget.
  TextEditingController? yourEverythingelseController;
  String? Function(BuildContext, String?)?
      yourEverythingelseControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    ageController?.dispose();
    displayNameController?.dispose();
    genderController?.dispose();
    desiredGenderController?.dispose();
    locationController?.dispose();
    numberController?.dispose();
    yourEverythingelseController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

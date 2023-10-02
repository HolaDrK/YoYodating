import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'match_profile_f_s_model.dart';
export 'match_profile_f_s_model.dart';

class MatchProfileFSWidget extends StatefulWidget {
  const MatchProfileFSWidget({Key? key}) : super(key: key);

  @override
  _MatchProfileFSWidgetState createState() => _MatchProfileFSWidgetState();
}

class _MatchProfileFSWidgetState extends State<MatchProfileFSWidget> {
  late MatchProfileFSModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MatchProfileFSModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<List<UsersRecord>>(
        stream: queryUsersRecord(
          queryBuilder: (usersRecord) => usersRecord
              .where(
                'gender',
                isEqualTo:
                    valueOrDefault(currentUserDocument?.desiredGender, ''),
              )
              .whereNotIn(
                  'uid',
                  functions.newCustomFunction(
                      (currentUserDocument?.match?.toList() ?? []).toList(),
                      (currentUserDocument?.rejected?.toList() ?? [])
                          .toList())),
          singleRecord: true,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).success,
              body: Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              ),
            );
          }
          List<UsersRecord> matchProfileFSUsersRecordList =
              snapshot.data!.where((u) => u.uid != currentUserUid).toList();
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final matchProfileFSUsersRecord =
              matchProfileFSUsersRecordList.isNotEmpty
                  ? matchProfileFSUsersRecordList.first
                  : null;
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).success,
            appBar: AppBar(
              backgroundColor: Color(0xFF3391CF),
              automaticallyImplyLeading: false,
              leading: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pop();
                },
                child: Icon(
                  Icons.chevron_left_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 32.0,
                ),
              ),
              actions: [],
              elevation: 0.0,
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                            matchProfileFSUsersRecord!.photoUrl,
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 439.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        matchProfileFSUsersRecord!.displayName,
                        style: FlutterFlowTheme.of(context).headlineMedium,
                      ),
                      Divider(
                        height: 32.0,
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      Divider(
                        height: 32.0,
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      Divider(
                        height: 32.0,
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'rvp6t5n9' /*  Not For Me              For M... */,
                        ),
                        style: FlutterFlowTheme.of(context).headlineMedium,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.00, 0.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  19.0, 20.0, 0.0, 24.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'rejected': FieldValue.arrayUnion(
                                            [matchProfileFSUsersRecord?.uid]),
                                      },
                                    ),
                                  });

                                  context.pushNamed(
                                    'MatchProfileFS',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                                text: FFLocalizations.of(context).getText(
                                  'y8mgvrpp' /* Y */,
                                ),
                                options: FFButtonOptions(
                                  width: 60.0,
                                  height: 60.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Colors.black,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .headlineSmallFamily,
                                        color: Colors.white,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmallFamily),
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [],
                          ),
                          Flexible(
                            child: Align(
                              alignment: AlignmentDirectional(1.00, 0.00),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.00, 0.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 24.0, 24.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'match': FieldValue.arrayUnion(
                                            [matchProfileFSUsersRecord?.uid]),
                                      },
                                    ),
                                  });
                                  if (matchProfileFSUsersRecord!.match
                                      .contains(currentUserUid)) {
                                    await ChatsRecord.collection.doc().set({
                                      ...createChatsRecordData(
                                        userA: matchProfileFSUsersRecord
                                            ?.reference,
                                        userB: currentUserReference,
                                        lastMessage: '\"\"',
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'users': functions.createChatUserlist(
                                              matchProfileFSUsersRecord!
                                                  .reference,
                                              currentUserReference!),
                                          'last_message_time':
                                              FieldValue.serverTimestamp(),
                                        },
                                      ),
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Positive Potential Aways :)',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    await Future.delayed(
                                        const Duration(milliseconds: 3000));
                                  }

                                  context.pushNamed(
                                    'WelcomeHome',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                                text: FFLocalizations.of(context).getText(
                                  '89ixasc6' /* Y */,
                                ),
                                options: FFButtonOptions(
                                  width: 60.0,
                                  height: 60.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFEDF0F5),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .headlineSmallFamily,
                                        color: Color(0xFF090101),
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmallFamily),
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

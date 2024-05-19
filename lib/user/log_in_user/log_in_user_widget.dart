import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'log_in_user_model.dart';
export 'log_in_user_model.dart';

class LogInUserWidget extends StatefulWidget {
  const LogInUserWidget({super.key});

  @override
  State<LogInUserWidget> createState() => _LogInUserWidgetState();
}

class _LogInUserWidgetState extends State<LogInUserWidget> {
  late LogInUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogInUserModel());

    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<UserRecord>>(
      stream: queryUserRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<UserRecord> logInUserUserRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final logInUserUserRecord = logInUserUserRecordList.isNotEmpty
            ? logInUserUserRecordList.first
            : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: 400.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: Image.asset(
                                'assets/images/MEDI-GO_(12).png',
                              ).image,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -0.5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Text(
                            'MEDI-GO',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF163EB9),
                                  fontSize: 40.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -0.97),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          FFAppState().type = 'Customer';
                                          FFAppState().colorCustomer =
                                              Color(0xFFFF5733);
                                          FFAppState().colorRider =
                                              Color(0xFF1434A4);
                                          FFAppState().colorPharmacy =
                                              Color(0xFF1434A4);
                                        });
                                      },
                                      child: Icon(
                                        Icons.person_sharp,
                                        color: valueOrDefault<Color>(
                                          FFAppState().colorCustomer,
                                          Color(0xFF222B68),
                                        ),
                                        size: 90.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          FFAppState().type = 'Rider';
                                          FFAppState().colorCustomer =
                                              Color(0xFF1434A4);
                                          FFAppState().colorRider =
                                              Color(0xFFFF5733);
                                          FFAppState().colorPharmacy =
                                              Color(0xFF1434A4);
                                        });
                                      },
                                      child: Icon(
                                        FFIcons.klogisticShippingVehicles002512,
                                        color: valueOrDefault<Color>(
                                          FFAppState().colorRider,
                                          Color(0xFF222B68),
                                        ),
                                        size: 90.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          FFAppState().type = 'Pharmacy';
                                          FFAppState().colorCustomer =
                                              Color(0xFF1434A4);
                                          FFAppState().colorRider =
                                              Color(0xFF1434A4);
                                          FFAppState().colorPharmacy =
                                              Color(0xFFFF5733);
                                        });
                                      },
                                      child: Icon(
                                        Icons.local_pharmacy,
                                        color: valueOrDefault<Color>(
                                          FFAppState().colorPharmacy,
                                          Color(0xFF222B68),
                                        ),
                                        size: 90.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]
                                .divide(SizedBox(width: 10.0))
                                .addToStart(SizedBox(width: 25.0)),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -0.9),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 10.0),
                          child: Text(
                            'Log-in with your email',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF26399C),
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 10.0, 25.0, 10.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -0.9),
                                  child: Text(
                                    'Email Address',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF313B9A),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, -0.78),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.emailTextController,
                                      focusNode: _model.emailFocusNode,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Insert your email address',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF28347C),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF314BB6),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFF51515),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFF51515),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        filled: true,
                                        fillColor: Color(0xFF28347C),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 0.0, 0.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                          ),
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: _model
                                          .emailTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.99, -0.55),
                                  child: Text(
                                    'Password',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF26399C),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, -0.4),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.passwordTextController,
                                      focusNode: _model.passwordFocusNode,
                                      autofocus: true,
                                      obscureText: !_model.passwordVisibility,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Insert your password',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF28347C),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF314BB6),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFF51515),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFF51515),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        filled: true,
                                        fillColor: Color(0xFF28347C),
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                            () => _model.passwordVisibility =
                                                !_model.passwordVisibility,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            _model.passwordVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            letterSpacing: 0.0,
                                          ),
                                      validator: _model
                                          .passwordTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, -0.07),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Don\'t have an account?',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFF272E57),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'Signup_User',
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .rightToLeft,
                                                  ),
                                                },
                                              );
                                            },
                                            child: Text(
                                              'Sign Up',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Color(0xFF0029A0),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.02),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Just here to browse?    ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFF272E57),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context
                                                  .pushNamed('HomePageVisitor');
                                            },
                                            child: Text(
                                              'Proceed to Store',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Color(0xFF0029A0),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.4),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      GoRouter.of(context).prepareAuthEvent();

                                      final user =
                                          await authManager.signInWithEmail(
                                        context,
                                        _model.emailTextController.text,
                                        _model.passwordTextController.text,
                                      );
                                      if (user == null) {
                                        return;
                                      }

                                      if ((FFAppState().type ==
                                              valueOrDefault<String>(
                                                FFAppConstants.Customer,
                                                'Customer',
                                              )) &&
                                          (valueOrDefault(
                                                  currentUserDocument?.userType,
                                                  '') ==
                                              FFAppState().type)) {
                                        context.pushNamedAuth(
                                            'HomePage', context.mounted);
                                      } else if ((FFAppState().type ==
                                              FFAppConstants.Rider) &&
                                          (valueOrDefault(
                                                  currentUserDocument?.userType,
                                                  '') ==
                                              FFAppState().type)) {
                                        context.pushNamedAuth(
                                            'newOrder', context.mounted);
                                      } else if ((FFAppState().type ==
                                              FFAppConstants.Pharmacy) &&
                                          (valueOrDefault(
                                                  currentUserDocument?.userType,
                                                  '') ==
                                              FFAppState().type)) {
                                        context.pushNamedAuth(
                                            'ordersMed', context.mounted);
                                      } else {
                                        return;
                                      }
                                    },
                                    text: 'Log In',
                                    options: FFButtonOptions(
                                      width: 150.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFF163BE9),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFFE6EBE4),
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                      hoverColor: Color(0xFF163BE9),
                                      hoverTextColor: Color(0xFFE6EBE4),
                                    ),
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(height: 10.0))
                                  .addToStart(SizedBox(height: 20.0))
                                  .addToEnd(SizedBox(height: 50.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          height: 230.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: Image.asset(
                                'assets/images/MEDI-GO_(12)_-_Copy.png',
                              ).image,
                            ),
                          ),
                          alignment: AlignmentDirectional(0.0, 1.0),
                        ),
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pick_up_model.dart';
export 'pick_up_model.dart';

class PickUpWidget extends StatefulWidget {
  const PickUpWidget({
    super.key,
    required this.userOrder,
  });

  final DocumentReference? userOrder;

  @override
  State<PickUpWidget> createState() => _PickUpWidgetState();
}

class _PickUpWidgetState extends State<PickUpWidget> {
  late PickUpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PickUpModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OrdersRecord>(
      stream: OrdersRecord.getDocument(widget.userOrder!),
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
        final pickUpOrdersRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            drawer: Drawer(
              elevation: 16.0,
            ),
            appBar: AppBar(
              backgroundColor: Color(0xFF28347C),
              automaticallyImplyLeading: true,
              title: Text(
                'Pickup',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      fontSize: 30.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                background: Opacity(
                  opacity: 0.6,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'https://media.istockphoto.com/id/1010456164/photo/your-prescription-is-ready-for-collection.jpg?s=612x612&w=0&k=20&c=06KS1yfVkSZWygEK8YvuThgV7q3MPR_R3MmaR9Gt1vE=',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              centerTitle: true,
              elevation: 4.0,
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: StreamBuilder<OrdersRecord>(
                      stream: OrdersRecord.getDocument(
                          pickUpOrdersRecord.reference),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        final containerOrdersRecord = snapshot.data!;
                        return Material(
                          color: Colors.transparent,
                          elevation: 5.0,
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF163EB9),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-0.92, -0.63),
                                  child: Text(
                                    'Pharmacy Name:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.79, 0.48),
                                  child: StreamBuilder<UserRecord>(
                                    stream: UserRecord.getDocument(
                                        containerOrdersRecord.pharmacy!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final textUserRecord = snapshot.data!;
                                      return Text(
                                        textUserRecord.name,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.23, 0.7),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await pickUpOrdersRecord.reference
                            .update(createOrdersRecordData(
                          status: 'pickedUp',
                        ));
                      },
                      text: 'Pick Up',
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF001EBA),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 5.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -0.3),
                    child: StreamBuilder<OrdersRecord>(
                      stream: OrdersRecord.getDocument(
                          pickUpOrdersRecord.reference),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        final containerOrdersRecord = snapshot.data!;
                        return Material(
                          color: Colors.transparent,
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            height: MediaQuery.sizeOf(context).height * 0.6,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.85, -0.95),
                                        child: Text(
                                          'Order Details',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFF001EBA),
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, -0.73),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  35.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            containerOrdersRecord.orderNumber,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, -0.83),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  35.0, 0.0, 0.0, 0.0),
                                          child: StreamBuilder<UserRecord>(
                                            stream: UserRecord.getDocument(
                                                pickUpOrdersRecord
                                                    .parentReference),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              final textUserRecord =
                                                  snapshot.data!;
                                              return Text(
                                                textUserRecord.name,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 18.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.92, -0.57),
                                        child: Text(
                                          'Order Items:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFF001EBA),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.7),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'Total:',
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    containerOrdersRecord
                                                        .totalPrice
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, -0.1),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.25,
                                      decoration: BoxDecoration(),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final items =
                                                    containerOrdersRecord.items
                                                        .toList();
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: items.length,
                                                  itemBuilder:
                                                      (context, itemsIndex) {
                                                    final itemsItem =
                                                        items[itemsIndex];
                                                    return Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    itemsItem
                                                                        .quantity
                                                                        .toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  itemsItem
                                                                      .product,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  (itemsItem.price *
                                                                          itemsItem
                                                                              .quantity)
                                                                      .toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.89, 0.84),
                                  child: Text(
                                    'Payment:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF001EBA),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.83, 0.94),
                                  child: Text(
                                    'Cash on Delivery',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

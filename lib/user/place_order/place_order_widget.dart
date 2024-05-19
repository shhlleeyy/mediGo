import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'place_order_model.dart';
export 'place_order_model.dart';

class PlaceOrderWidget extends StatefulWidget {
  const PlaceOrderWidget({
    super.key,
    required this.order,
  });

  final DocumentReference? order;

  @override
  State<PlaceOrderWidget> createState() => _PlaceOrderWidgetState();
}

class _PlaceOrderWidgetState extends State<PlaceOrderWidget> {
  late PlaceOrderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaceOrderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFF28347C),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.close,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Order Status',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
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
          centerTitle: false,
          elevation: 2.0,
        ),
        body: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: StreamBuilder<OrdersRecord>(
            stream: OrdersRecord.getDocument(widget.order!),
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
              final stackOrdersRecord = snapshot.data!;
              return Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                child: Stack(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.8, -0.6),
                      child: Container(
                        width: 100.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: stackOrdersRecord.status ==
                                  FFAppConstants.delivered
                              ? Color(0xFF1633B9)
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, -0.3),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: MediaQuery.sizeOf(context).height * 0.15,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Order Details',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF1633B9),
                                          fontSize: 23.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Order Number:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: Color(0xFF1633B9),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '#${stackOrdersRecord.orderNumber}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFF1C0062),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Order From:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: Color(0xFF1633B9),
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        StreamBuilder<UserRecord>(
                                          stream: UserRecord.getDocument(
                                              stackOrdersRecord.pharmacy!),
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
                                                    color: Color(0xFF1C0062),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Payment Method:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: Color(0xFF1633B9),
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Cash on Delivery',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFF1C0062),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.01, -0.9),
                      child: Text(
                        () {
                          if (stackOrdersRecord.status ==
                              FFAppConstants.placedOrder) {
                            return 'Order confirmed. Seller is preparing your order.';
                          } else if (stackOrdersRecord.status ==
                              FFAppConstants.orderProcessed) {
                            return 'Order Processing.';
                          } else if (stackOrdersRecord.status ==
                              FFAppConstants.pickedUp) {
                            return 'Order Picked Up';
                          } else if (stackOrdersRecord.status ==
                              FFAppConstants.delivered) {
                            return 'Order Delivered.';
                          } else {
                            return 'Order not confirmed.';
                          }
                        }(),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFF163EB9),
                              fontSize: 25.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.05, -0.6),
                      child: Container(
                        width: 100.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: (stackOrdersRecord.status ==
                                      FFAppConstants.pickedUp) ||
                                  (stackOrdersRecord.status ==
                                      FFAppConstants.delivered)
                              ? Color(0xFF1633B9)
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.94, -0.61),
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: stackOrdersRecord.status ==
                                  FFAppConstants.delivered
                              ? Color(0xFF1633B9)
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.9, -0.6),
                      child: Container(
                        width: 100.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            (stackOrdersRecord.status ==
                                        FFAppConstants.orderProcessed) ||
                                    (stackOrdersRecord.status ==
                                        FFAppConstants.pickedUp) ||
                                    (stackOrdersRecord.status ==
                                        FFAppConstants.delivered)
                                ? Color(0xFF1633B9)
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                            FlutterFlowTheme.of(context).secondaryBackground,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, -0.61),
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            (stackOrdersRecord.status ==
                                        FFAppConstants.placedOrder) ||
                                    (stackOrdersRecord.status ==
                                        FFAppConstants.orderProcessed) ||
                                    (stackOrdersRecord.status ==
                                        FFAppConstants.pickedUp) ||
                                    (stackOrdersRecord.status ==
                                        FFAppConstants.delivered)
                                ? Color(0xFF1633B9)
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                            FlutterFlowTheme.of(context).secondaryBackground,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.3, -0.61),
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: (stackOrdersRecord.status ==
                                      FFAppConstants.pickedUp) ||
                                  (stackOrdersRecord.status ==
                                      FFAppConstants.delivered)
                              ? Color(0xFF1633B9)
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.35, -0.61),
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: (stackOrdersRecord.status ==
                                      FFAppConstants.orderProcessed) ||
                                  (stackOrdersRecord.status ==
                                      FFAppConstants.pickedUp) ||
                                  (stackOrdersRecord.status ==
                                      FFAppConstants.delivered)
                              ? Color(0xFF1633B9)
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

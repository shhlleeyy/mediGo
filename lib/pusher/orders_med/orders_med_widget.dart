import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'orders_med_model.dart';
export 'orders_med_model.dart';

class OrdersMedWidget extends StatefulWidget {
  const OrdersMedWidget({super.key});

  @override
  State<OrdersMedWidget> createState() => _OrdersMedWidgetState();
}

class _OrdersMedWidgetState extends State<OrdersMedWidget> {
  late OrdersMedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrdersMedModel());

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
        drawer: Drawer(
          elevation: 16.0,
          child: Stack(
            children: [
              Container(
                width: 316.0,
                height: 149.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.85, 0.78),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          FFAppState().colorCustomer = Color(4279514276);
                          FFAppState().colorRider = Color(4279514276);
                          FFAppState().colorPharmacy = Color(4279514276);
                          FFAppState().type = '';

                          context.pushNamedAuth('LogIn_User', context.mounted);
                        },
                        child: Text(
                          'Sign Out',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.86, -0.63),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('ProductManager');
                  },
                  child: Text(
                    'Product Manager',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.88, -0.58),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('ParmacistDashBoard');
                  },
                  child: Text(
                    'Dashboard',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.86, -0.53),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('pharmacyOrderHistory');
                  },
                  child: Text(
                    'Order History',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.89, -0.49),
                child: Text(
                  'Orders',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: Color(0xFF72757A),
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFF273588),
          automaticallyImplyLeading: true,
          title: Text(
            'Orders',
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
          child: StreamBuilder<List<UnprocessedOrdersRecord>>(
            stream: queryUnprocessedOrdersRecord(),
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
              List<UnprocessedOrdersRecord>
                  listViewUnprocessedOrdersRecordList = snapshot.data!;
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewUnprocessedOrdersRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewUnprocessedOrdersRecord =
                      listViewUnprocessedOrdersRecordList[listViewIndex];
                  return Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: StreamBuilder<OrdersRecord>(
                            stream: OrdersRecord.getDocument(
                                listViewUnprocessedOrdersRecord.orderID!),
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
                                elevation: 3.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.89, -0.67),
                                        child: Text(
                                          'Order Number: ${containerOrdersRecord.orderNumber}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.84, 0.17),
                                        child: Text(
                                          'to: ${containerOrdersRecord.address}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.73, 0.73),
                                        child: Text(
                                          'Cash on Delivery: ${containerOrdersRecord.totalPrice.toString()}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.85, -0.36),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await containerOrdersRecord
                                                .reference
                                                .update(createOrdersRecordData(
                                              status:
                                                  FFAppConstants.orderProcessed,
                                            ));

                                            await OrdersRecord.createDoc(
                                                    currentUserReference!)
                                                .set({
                                              ...createOrdersRecordData(
                                                orderNumber:
                                                    containerOrdersRecord
                                                        .orderNumber,
                                                totalPrice:
                                                    containerOrdersRecord
                                                        .totalPrice,
                                                address: containerOrdersRecord
                                                    .address,
                                                pharmacy: containerOrdersRecord
                                                    .pharmacy,
                                                status: containerOrdersRecord
                                                    .status,
                                                dateCreated:
                                                    containerOrdersRecord
                                                        .dateCreated,
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'items':
                                                      getItemsListFirestoreData(
                                                    containerOrdersRecord.items,
                                                  ),
                                                },
                                              ),
                                            });

                                            context.pushNamed(
                                              'pickUp',
                                              queryParameters: {
                                                'userOrder': serializeParam(
                                                  listViewUnprocessedOrdersRecord
                                                      .orderID,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          text: 'Accept',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFF001EBA),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.72, 0.49),
                                        child: Text(
                                          'Decline',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
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
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

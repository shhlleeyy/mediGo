import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'checkout_model.dart';
export 'checkout_model.dart';

class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({
    super.key,
    required this.docRef,
  });

  final DocumentReference? docRef;

  @override
  State<CheckoutWidget> createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
  late CheckoutModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckoutModel());

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
              context.pop();
            },
          ),
          title: Text(
            'Checkout',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
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
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -0.85),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.85,
                  height: MediaQuery.sizeOf(context).height * 0.15,
                  decoration: BoxDecoration(
                    color: Color(0xFFE3E9FC),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-0.45, -0.8),
                          child: Text(
                            'Delivery Address',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF1633B9),
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.94, -0.8),
                          child: Icon(
                            Icons.location_on_sharp,
                            color: Color(0xFF1633B9),
                            size: 30.0,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.7, -0.27),
                          child: AuthUserStreamWidget(
                            builder: (context) => Text(
                              valueOrDefault(currentUserDocument?.address, ''),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF1C0062),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.65),
                child: StreamBuilder<List<CartRecord>>(
                  stream: queryCartRecord(
                    parent: currentUserReference,
                    singleRecord: true,
                  ),
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
                    List<CartRecord> buttonCartRecordList = snapshot.data!;
                    final buttonCartRecord = buttonCartRecordList.isNotEmpty
                        ? buttonCartRecordList.first
                        : null;
                    return FFButtonWidget(
                      onPressed: () async {
                        var ordersRecordReference =
                            OrdersRecord.createDoc(currentUserReference!);
                        await ordersRecordReference.set({
                          ...createOrdersRecordData(
                            orderNumber: random_data
                                .randomInteger(100000, 999999)
                                .toString(),
                            totalPrice: buttonCartRecord!.sum +
                                (buttonCartRecord!.sum * 0.05),
                            address: valueOrDefault(
                                currentUserDocument?.address, ''),
                            status: FFAppConstants.placedOrder,
                            dateCreated: getCurrentTimestamp,
                          ),
                          ...mapToFirestore(
                            {
                              'items': getItemsListFirestoreData(
                                buttonCartRecord?.items,
                              ),
                            },
                          ),
                        });
                        _model.createOrder = OrdersRecord.getDocumentFromData({
                          ...createOrdersRecordData(
                            orderNumber: random_data
                                .randomInteger(100000, 999999)
                                .toString(),
                            totalPrice: buttonCartRecord!.sum +
                                (buttonCartRecord!.sum * 0.05),
                            address: valueOrDefault(
                                currentUserDocument?.address, ''),
                            status: FFAppConstants.placedOrder,
                            dateCreated: getCurrentTimestamp,
                          ),
                          ...mapToFirestore(
                            {
                              'items': getItemsListFirestoreData(
                                buttonCartRecord?.items,
                              ),
                            },
                          ),
                        }, ordersRecordReference);

                        await UnprocessedOrdersRecord.collection
                            .doc()
                            .set(createUnprocessedOrdersRecordData(
                              userID: currentUserReference,
                              orderID: _model.createOrder?.reference,
                            ));
                        await buttonCartRecord!.reference.delete();

                        context.pushNamed(
                          'placeOrder',
                          queryParameters: {
                            'order': serializeParam(
                              _model.createOrder?.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );

                        setState(() {});
                      },
                      text: 'Place Order',
                      options: FFButtonOptions(
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
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.85,
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  decoration: BoxDecoration(
                    color: Color(0xFF0029A0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Text(
                            'Order Summary',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Quantity',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0xFFE3E9FC),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Item',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0xFFE3E9FC),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Price',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0xFFE3E9FC),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.09),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.75,
                          height: 100.0,
                          decoration: BoxDecoration(),
                          child: StreamBuilder<CartRecord>(
                            stream: CartRecord.getDocument(widget.docRef!),
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
                              final listViewCartRecord = snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final items = listViewCartRecord.items
                                      .where((e) => !((e.quantity == 0) &&
                                          (e.price == 0.0)))
                                      .toList();
                                  if (items.isEmpty) {
                                    return Center(
                                      child: Image.asset(
                                        'https://aaah0mnbncqtinas.public.blob.vercel-storage.com/QblS47dx6S-no-background-nqUpKkkYzM5MBhu1tMnHxURfXyfgJC.png',
                                      ),
                                    );
                                  }
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount: items.length,
                                    itemBuilder: (context, itemsIndex) {
                                      final itemsItem = items[itemsIndex];
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  itemsItem.quantity.toString(),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  itemsItem.product,
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    formatNumber(
                                                      itemsItem.price *
                                                          itemsItem.quantity,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .periodDecimal,
                                                      currency: '₱',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_page_model.dart';
export 'product_page_model.dart';

class ProductPageWidget extends StatefulWidget {
  const ProductPageWidget({
    super.key,
    this.products,
  });

  final DocumentReference? products;

  @override
  State<ProductPageWidget> createState() => _ProductPageWidgetState();
}

class _ProductPageWidgetState extends State<ProductPageWidget> {
  late ProductPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ProductsRecord>(
      stream: ProductsRecord.getDocument(widget.products!),
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
        final productPageProductsRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: Color(0xFF28347C),
              automaticallyImplyLeading: true,
              title: Text(
                'MEDI-GO',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      fontSize: 40.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              actions: [
                StreamBuilder<List<CartRecord>>(
                  stream: queryCartRecord(
                    parent: currentUserReference,
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
                    List<CartRecord> iconButtonCartRecordList = snapshot.data!;
                    return FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.shopping_cart_sharp,
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.pushNamed('cart');
                      },
                    );
                  },
                ),
              ],
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
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 50.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.01, -0.81),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      productPageProductsRecord.image,
                                      width: 300.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                      alignment: Alignment(0.0, 0.0),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.1),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            productPageProductsRecord.brandName,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: Color(0xFF001EBA),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            productPageProductsRecord.name,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: Color(0xFF001EBA),
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            productPageProductsRecord
                                                .genericName,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: Color(0xFF001EBA),
                                                  letterSpacing: 0.0,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            formatNumber(
                                              productPageProductsRecord.price,
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.periodDecimal,
                                              currency: '₱',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: Color(0xFF272E57),
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'In Stock:    ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            Color(0xFF163EB9),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  productPageProductsRecord
                                                      .stock
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            Color(0xFF163EB9),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Quantity   ',
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
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -0.64, -0.14),
                                              child: Container(
                                                width: 80.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ),
                                                child:
                                                    FlutterFlowCountController(
                                                  decrementIconBuilder:
                                                      (enabled) => FaIcon(
                                                    FontAwesomeIcons.minus,
                                                    color: enabled
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    size: 10.0,
                                                  ),
                                                  incrementIconBuilder:
                                                      (enabled) => FaIcon(
                                                    FontAwesomeIcons.plus,
                                                    color: enabled
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    size: 10.0,
                                                  ),
                                                  countBuilder: (count) => Text(
                                                    count.toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  count: _model
                                                      .countControllerValue ??= 1,
                                                  updateCount: (count) =>
                                                      setState(() => _model
                                                              .countControllerValue =
                                                          count),
                                                  stepSize: 1,
                                                  contentPadding:
                                                      EdgeInsets.all(5.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ].divide(SizedBox(height: 10.0)),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.45),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 10.0,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.02,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF272E57),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'Description',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.7),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      productPageProductsRecord.description,
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFF001EBA),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.local_pharmacy,
                                      color: Color(0xFFCA102D),
                                      size: 24.0,
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, -1.0),
                                        child: StreamBuilder<UserRecord>(
                                          stream: UserRecord.getDocument(
                                              productPageProductsRecord.from!),
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
                                                    color: Color(0xFF001EBA),
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            );
                                          },
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
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(1.47, 0.78),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.69, -0.03),
                              child: StreamBuilder<List<CartRecord>>(
                                stream: queryCartRecord(
                                  parent: currentUserReference,
                                  queryBuilder: (cartRecord) =>
                                      cartRecord.where(
                                    'pharmacy',
                                    isEqualTo: productPageProductsRecord.from,
                                  ),
                                ),
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
                                  List<CartRecord> buttonCartRecordList =
                                      snapshot.data!;
                                  return FFButtonWidget(
                                    onPressed: () async {
                                      if (buttonCartRecordList.length > 0) {
                                        await buttonCartRecordList
                                            .first.reference
                                            .update({
                                          ...createCartRecordData(
                                            pharmacy:
                                                productPageProductsRecord.from,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'items': FieldValue.arrayUnion([
                                                getItemsFirestoreData(
                                                  createItemsStruct(
                                                    quantity: _model
                                                        .countControllerValue,
                                                    product:
                                                        productPageProductsRecord
                                                            .name,
                                                    price:
                                                        productPageProductsRecord
                                                            .price,
                                                    image:
                                                        productPageProductsRecord
                                                            .image,
                                                    productRef:
                                                        productPageProductsRecord
                                                            .reference,
                                                    clearUnsetFields: false,
                                                  ),
                                                  true,
                                                )
                                              ]),
                                              'sum': FieldValue.increment((_model
                                                      .countControllerValue!) *
                                                  productPageProductsRecord
                                                      .price),
                                            },
                                          ),
                                        });
                                      } else {
                                        await CartRecord.createDoc(
                                                currentUserReference!)
                                            .set({
                                          ...createCartRecordData(
                                            sum: functions.itemPrice(
                                                productPageProductsRecord.price,
                                                _model.countControllerValue!),
                                            pharmacy:
                                                productPageProductsRecord.from,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'items': [
                                                getItemsFirestoreData(
                                                  updateItemsStruct(
                                                    ItemsStruct(
                                                      quantity: _model
                                                          .countControllerValue,
                                                      product:
                                                          productPageProductsRecord
                                                              .name,
                                                      price:
                                                          productPageProductsRecord
                                                              .price,
                                                      image:
                                                          productPageProductsRecord
                                                              .image,
                                                      productRef:
                                                          productPageProductsRecord
                                                              .reference,
                                                    ),
                                                    clearUnsetFields: false,
                                                    create: true,
                                                  ),
                                                  true,
                                                )
                                              ],
                                            },
                                          ),
                                        });
                                      }

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Added Successfully.',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                    },
                                    text: 'Add to Cart',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFF001EBA),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
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
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.67, 0.0),
                              child: Text(
                                formatNumber(
                                  functions.itemPrice(
                                      productPageProductsRecord.price,
                                      _model.countControllerValue!),
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.periodDecimal,
                                  currency: '₱',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
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

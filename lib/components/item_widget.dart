import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'item_model.dart';
export 'item_model.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    this.parameter5,
    this.parameter6,
    this.parameter7,
  });

  final String? parameter1;
  final String? parameter2;
  final int? parameter3;
  final double? parameter4;
  final DocumentReference? parameter5;
  final double? parameter6;
  final ItemsStruct? parameter7;

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  late ItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
        child: StreamBuilder<List<CartRecord>>(
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
            List<CartRecord> containerCartRecordList = snapshot.data!;
            return Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          widget.parameter1!,
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: AutoSizeText(
                                  widget.parameter2!,
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  minFontSize: 10.0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 80.0,
                                height: 25.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                ),
                                child: FlutterFlowCountController(
                                  decrementIconBuilder: (enabled) => FaIcon(
                                    FontAwesomeIcons.minus,
                                    color: enabled
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryText
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    size: 10.0,
                                  ),
                                  incrementIconBuilder: (enabled) => FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: enabled
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    size: 10.0,
                                  ),
                                  countBuilder: (count) => Text(
                                    count.toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Outfit',
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  count: _model.countControllerValue ??=
                                      widget.parameter3!,
                                  updateCount: (count) async {
                                    setState(() =>
                                        _model.countControllerValue = count);
                                    setState(() {
                                      FFAppState().updateItemStruct(
                                        (e) => e
                                          ..quantity =
                                              _model.countControllerValue
                                          ..product = widget.parameter2
                                          ..price = widget.parameter4
                                          ..image = widget.parameter1
                                          ..productRef =
                                              widget.parameter7?.productRef,
                                      );
                                    });

                                    await widget.parameter5!.update({
                                      ...mapToFirestore(
                                        {
                                          'items': FieldValue.arrayRemove([
                                            getItemsFirestoreData(
                                              updateItemsStruct(
                                                widget.parameter7,
                                                clearUnsetFields: false,
                                              ),
                                              true,
                                            )
                                          ]),
                                          'sum': FieldValue.increment(
                                              -((widget.parameter3!) *
                                                  (widget.parameter4!))),
                                        },
                                      ),
                                    });

                                    await widget.parameter5!.update({
                                      ...mapToFirestore(
                                        {
                                          'items': FieldValue.arrayUnion([
                                            getItemsFirestoreData(
                                              createItemsStruct(
                                                quantity:
                                                    FFAppState().item.quantity,
                                                product:
                                                    FFAppState().item.product,
                                                price: FFAppState().item.price,
                                                image: FFAppState().item.image,
                                                productRef: FFAppState()
                                                    .item
                                                    .productRef,
                                                clearUnsetFields: false,
                                              ),
                                              true,
                                            )
                                          ]),
                                          'sum': FieldValue.increment(
                                              FFAppState().item.quantity *
                                                  FFAppState().item.price),
                                        },
                                      ),
                                    });
                                    setState(() {
                                      FFAppState().item =
                                          ItemsStruct.fromSerializableMap(
                                              jsonDecode('{}'));
                                    });
                                  },
                                  stepSize: 1,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                ),
                              ),
                            ],
                          ),
                        ]
                            .divide(SizedBox(height: 7.0))
                            .addToStart(SizedBox(height: 10.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              formatNumber(
                                (_model.countControllerValue!) *
                                    (widget.parameter4!),
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.periodDecimal,
                                currency: '₱',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, -1.05),
                            child: FlutterFlowIconButton(
                              borderRadius: 20.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.delete,
                                color: FlutterFlowTheme.of(context).error,
                                size: 25.0,
                              ),
                              onPressed: () async {
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Remove Item'),
                                              content: Text(
                                                  'Do you want to remove the item from your cart?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('No'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('Yes'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  await widget.parameter5!.update({
                                    ...mapToFirestore(
                                      {
                                        'items': FieldValue.arrayRemove([
                                          getItemsFirestoreData(
                                            updateItemsStruct(
                                              widget.parameter7,
                                              clearUnsetFields: false,
                                            ),
                                            true,
                                          )
                                        ]),
                                        'sum': FieldValue.increment(
                                            -(functions.itemPrice(
                                                widget.parameter4!,
                                                widget.parameter3!))),
                                      },
                                    ),
                                  });
                                  if (widget.parameter6 == 0.0) {
                                    await widget.parameter5!.delete();
                                  }

                                  context.pushNamed('cart');
                                } else {
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

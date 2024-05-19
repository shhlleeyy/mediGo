import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/lat_lng.dart';
import 'package:mapbox_search/mapbox_search.dart' as mapbox;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_copy2_copy_model.dart';
export 'home_page_copy2_copy_model.dart';

class HomePageCopy2CopyWidget extends StatefulWidget {
  const HomePageCopy2CopyWidget({super.key});

  @override
  State<HomePageCopy2CopyWidget> createState() =>
      _HomePageCopy2CopyWidgetState();
}

class _HomePageCopy2CopyWidgetState extends State<HomePageCopy2CopyWidget> {
  late HomePageCopy2CopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageCopy2CopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().searchActive = false;
      });
    });

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
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.sizeOf(context).height * 0.05),
          child: AppBar(
            backgroundColor: Color(0xFF28347C),
            automaticallyImplyLeading: true,
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
              child: Text(
                'MEDI-GO',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      fontSize: 35.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).noColor,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).noColor,
                  icon: Icon(
                    Icons.shopping_cart,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.pushNamed('cart');
                  },
                ),
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
            toolbarHeight: MediaQuery.sizeOf(context).height * 0.1,
            elevation: 4.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowStaticMap(
                location: LatLng(9.341465, -79.891704),
                apiKey: 'ENTER_YOUR_MAPBOX_API_KEY_HERE',
                style: mapbox.MapBoxStyle.Light,
                width: 300.0,
                height: 300.0,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
                zoom: 12,
                tilt: 0,
                rotation: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

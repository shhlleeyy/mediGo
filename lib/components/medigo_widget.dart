import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'medigo_model.dart';
export 'medigo_model.dart';

class MedigoWidget extends StatefulWidget {
  const MedigoWidget({super.key});

  @override
  State<MedigoWidget> createState() => _MedigoWidgetState();
}

class _MedigoWidgetState extends State<MedigoWidget> {
  late MedigoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedigoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
            child: FlutterFlowIconButton(
              borderColor: Color(0xFF0E153D),
              borderRadius: 0.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              fillColor: Color(0xFF0E153D),
              icon: FaIcon(
                FontAwesomeIcons.bars,
                color: FlutterFlowTheme.of(context).primaryBackground,
                size: 24.0,
              ),
              onPressed: () {
                print('IconButton pressed ...');
              },
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
            child: Text(
              'MEDI-GO',
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Nunito',
                    color: Color(0xFFF51515),
                    fontSize: 30.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

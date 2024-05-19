import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'searchbar_model.dart';
export 'searchbar_model.dart';

class SearchbarWidget extends StatefulWidget {
  const SearchbarWidget({super.key});

  @override
  State<SearchbarWidget> createState() => _SearchbarWidgetState();
}

class _SearchbarWidgetState extends State<SearchbarWidget> {
  late SearchbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchbarModel());

    _model.textController ??= TextEditingController(text: 'Search');
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 3.0, 12.0, 3.0),
      child: TextFormField(
        controller: _model.textController,
        focusNode: _model.textFieldFocusNode,
        autofocus: true,
        obscureText: false,
        decoration: InputDecoration(
          isDense: false,
          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Readex Pro',
                color: Color(0xFF222B68),
                letterSpacing: 0.0,
              ),
          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Readex Pro',
                color: Color(0xFF222B68),
                fontSize: 16.0,
                letterSpacing: 0.0,
                lineHeight: 2.5,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF163EB9),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF163EB9),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFF51515),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFF51515),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xFF163EB9),
            size: 24.0,
          ),
        ),
        style: FlutterFlowTheme.of(context).labelMedium.override(
              fontFamily: 'Readex Pro',
              letterSpacing: 0.0,
            ),
        textAlign: TextAlign.start,
        validator: _model.textControllerValidator.asValidator(context),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))
        ],
      ),
    );
  }
}

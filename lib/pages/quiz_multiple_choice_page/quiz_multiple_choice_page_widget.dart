import '../../gsl_flow/gsl_flow_checkbox_group.dart';
import '../../gsl_flow/gsl_flow_icon_button.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../gsl_flow/gsl_flow_util.dart';
import '../../gsl_flow/gsl_flow_widgets.dart';
import '../../gsl_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizMultipleChoicePage extends StatefulWidget {
  const QuizMultipleChoicePage({Key? key}) : super(key: key);

  @override
  _QuizMultipleChoicePageState createState() =>
      _QuizMultipleChoicePageState();
}

class _QuizMultipleChoicePageState
    extends State<QuizMultipleChoicePage> {
  List<String>? checkboxGroupValues;
  FormFieldController<List<String>>? checkboxGroupValueController;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<GSLAppState>();

    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF1F4F8),
        appBar: AppBar(
          backgroundColor: Color(0xFF4B39EF),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Test your knowledge of the',
                style: TextStyle(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              Text(
                GSLAppState().categoryName,
                style: GoogleFonts.getFont(
         'Readex Pro',
         color: Color(0xFFFFFFFF),
         fontWeight: FontWeight.normal,
         fontSize: 18.0,),
              ),
            ],
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 100.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Text(
                          'What is this word?',
                          style: GoogleFonts.getFont(
        'Outfit',
         color: Color(0xFF14181B),
         fontWeight: FontWeight.w600,
        fontSize: 32.0,
       ),
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFFFFFFF),
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://picsum.photos/seed/804/600',
                            width: 300.0,
                            height: 283.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFFFFFFFF),
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: FlutterFlowCheckboxGroup(
                              options: [
                                'Option 1',
                                'Option 2',
                                'Option 3',
                                'Option 4'
                              ],
                              onChanged: (val) => setState(
                                  () => checkboxGroupValues = val),
                              controller:
                                  checkboxGroupValueController ??=
                                      FormFieldController<List<String>>(
                                [],
                              ),
                              activeColor: Color(0xFF4B39EF),
                              checkColor: Color(0xFFFFFFFF),
                              checkboxBorderColor:
                                  Color(0xFF57636C),
                              textStyle:
                                  GoogleFonts.getFont(
        'Readex Pro',
         color: Color(0xFF14181B),
         fontWeight: FontWeight.normal,
         fontSize: 14.0,
       ),
                              checkboxBorderRadius: BorderRadius.circular(4.0),
                              initialized: checkboxGroupValues != null,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GSLButton(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: 'Next Word',
                options: GSLButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFF4B39EF),
                  textStyle: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

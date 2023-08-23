import '../../gsl_flow/gsl_flow_icon_button.dart';
import '../../gsl_flow/gsl_flow_theme.dart';
import '../../gsl_flow/gsl_flow_util.dart';
import '../../gsl_flow/gsl_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'quiz_write_page_model.dart';
// export 'quiz_write_page_model.dart';

class QuizWritePage extends StatefulWidget {
  const QuizWritePage({Key? key}) : super(key: key);

  @override
  _QuizWritePageState createState() => _QuizWritePageState();
}

class _QuizWritePageState extends State<QuizWritePage> {
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    

  }

  @override
  void dispose() {;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<GSLAppState>();

    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: GSLAppTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: GSLAppTheme.of(context).primary,
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
          title: Text(
            'Learn the [      ]',
            style: GSLAppTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
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
                          'Write down the corresponding word in the box below',
                          style: GSLAppTheme.of(context).headlineLarge,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://picsum.photos/seed/804/600',
                          width: 300.0,
                          height: 283.0,
                          fit: BoxFit.cover,
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
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: TextFormField(
                                controller: textController,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Write your answer here',
                                  labelStyle:
                                      GSLAppTheme.of(context).labelMedium,
                                  hintStyle:
                                      GSLAppTheme.of(context).labelMedium,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: GSLAppTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          GSLAppTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: GSLAppTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: GSLAppTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                style: GSLAppTheme.of(context).bodyMedium,
                                validator: textControllerValidator
                                    .asValidator(context),
                              ),
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
                text: 'Check Answer',
                options: GSLButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: GSLAppTheme.of(context).primary,
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

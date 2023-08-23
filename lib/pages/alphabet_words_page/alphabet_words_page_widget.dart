import '/backend/backend.dart';
import '../../gsl_flow/gsl_flow_animations.dart';
import '../../gsl_flow/gsl_flow_theme.dart';
import '../../gsl_flow/gsl_flow_util.dart';
import '../../gsl_flow/gsl_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class AlphabetWordsPage extends StatefulWidget {
  const AlphabetWordsPage({Key? key}) : super(key: key);

  @override
  _AlphabetWordsPageState createState() =>
      _AlphabetWordsPageState();
}

class _AlphabetWordsPageState extends State<AlphabetWordsPage>
    with TickerProviderStateMixin {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(50.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<GSLAppState>();

    return StreamBuilder<List<AlphabetsRecord>>(
      stream: queryAlphabetsRecord(
        queryBuilder: (alphabetsRecord) => alphabetsRecord.orderBy('signName'),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: GSLAppTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    GSLAppTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
   
        return GestureDetector(
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: GSLAppTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: GSLAppTheme.of(context).primary,
              automaticallyImplyLeading: true,
              title: Text(
                GSLAppState().categoryName,
                style: GSLAppTheme.of(context).titleMedium,
              ),
              actions: [],
              centerTitle: true,
              elevation: 4.0,
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 0.0, 0.0),
                        child: Text(
                          'Scroll to see a list of new words',
                          style: TextStyle(
                                fontFamily: 'Outfit',
                                fontSize: 18.0,
                              ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 496.0,
                        decoration: BoxDecoration(
                          color: GSLAppTheme.of(context).primaryBackground,
                        ),
                        child: StreamBuilder<List<AlphabetsRecord>>(
                          stream: queryAlphabetsRecord(
                            queryBuilder: (alphabetsRecord) =>
                                alphabetsRecord.orderBy('signName'),
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
                                      GSLAppTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<AlphabetsRecord> listViewAlphabetsRecordList =
                                snapshot.data!;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: listViewAlphabetsRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewAlphabetsRecord =
                                    listViewAlphabetsRecordList[listViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 12.0, 12.0),
                                  child: Container(
                                    width: 350.0,
                                    height: 613.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFFFF),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x34090F13),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 302.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x1F050505),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(12.0),
                                              topRight: Radius.circular(12.0),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              listViewAlphabetsRecord.signImage,
                                              width: 300.0,
                                              height: 200.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 12.0, 12.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'Word:',
                                                style:
                                                    TextStyle(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 39.0,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
                                                child: Text(
                                                  listViewAlphabetsRecord
                                                      .signName,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 30.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation1']!),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                 GSLButton(
                  onPressed: () async {
                    context.pushNamed('successNewWords');
                  },
                  text: 'Finished Learning',
                  options: GSLButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
        );
      },
    );
  }
}

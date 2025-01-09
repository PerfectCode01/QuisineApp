import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'test_model.dart';
export 'test_model.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  late TestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: GridView(
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 1.0,
          ),
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 180.0,
              decoration: BoxDecoration(
                color: const Color(0xFFE0E3E7),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            Container(
              height: 180.0,
              decoration: BoxDecoration(
                color: const Color(0xFFE0E3E7),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            Container(
              height: 180.0,
              decoration: BoxDecoration(
                color: const Color(0xFFE0E3E7),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            Container(
              height: 180.0,
              decoration: BoxDecoration(
                color: const Color(0xFFE0E3E7),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            Container(
              height: 180.0,
              decoration: BoxDecoration(
                color: const Color(0xFFE0E3E7),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            Container(
              height: 180.0,
              decoration: BoxDecoration(
                color: const Color(0xFFE0E3E7),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

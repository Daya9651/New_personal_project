import 'package:flutter/material.dart';
import 'package:likhit/style/color.dart';

class PromiseContract extends StatelessWidget {
  const PromiseContract({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 5000,
            child: Stepper(
                physics: const ClampingScrollPhysics(),
                type: StepperType.horizontal,
                steps: <Step>[
                  Step(
                      title: Text('Promise'),
                      content: Container(
                        child: Text('Step 1'),
                      )),
                  Step(
                      title: Text('Timeline'),
                      content: Container(
                        child: Text('Step 2'),
                      )),
                  Step(
                      title: Text('Timeline'),
                      content: Container(
                        child: Text('Step 2'),
                      )),
                  Step(
                      title: Text('Timeline'),
                      content: Container(
                        child: Text('Step 3'),
                      )),
                  Step(
                      title: Text('Timeline'),
                      content: Container(
                        child: Text('Step 4'),
                      )),
                  Step(
                      title: Text('Timeline'),
                      content: Container(
                        child: Text('Step 4'),
                      )),
                  Step(
                      title: Text('Timeline'),
                      content: Container(
                        child: Text('Step 4'),
                      )),
                  Step(
                      title: Text('Timeline'),
                      content: Container(
                        child: Text('Step 4'),
                      )),
                  Step(
                      title: Text('Timeline'),
                      content: Container(
                        child: Text('Step 4'),
                      )),
                  Step(
                      title: Text('Timeline'),
                      content: Container(
                        child: Text('Step 4'),
                      )),
                  Step(
                      title: Text('Timeline'),
                      content: Container(
                        child: Text('Step 4'),
                      )),
                  Step(
                      title: Text('Timeline'),
                      content: Container(
                        child: Text('Step 4'),
                      )),
                  Step(
                      title: Text('Timeline'),
                      content: Container(
                        child: Text('Step 4'),
                      )),
                  Step(
                      title: Text('Timeline'),
                      content: Container(
                        child: Text('Step 4'),
                      )),
                  Step(
                      title: Text('Agent'),
                      content: Container(
                        height: 500,
                        width: 500,
                        color: AppColors.info80,
                        child: Text('Step 4'),
                      )),
                ]),
          ),
        ),
      ),
    );
  }
}

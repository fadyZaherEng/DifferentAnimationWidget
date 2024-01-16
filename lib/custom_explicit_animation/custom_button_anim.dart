import 'package:flutter/material.dart';

class CustomBtnAnim extends StatefulWidget {
  const CustomBtnAnim({super.key});

  @override
  State<CustomBtnAnim> createState() => _CustomBtnAnimState();
}

class ContainerDetails {
  double width;
  double height;
  double borderWidth;

  ContainerDetails(this.width, this.height, this.borderWidth);
}

AnimationController? animationController;

class _CustomBtnAnimState extends State<CustomBtnAnim>
    with SingleTickerProviderStateMixin {
  double width = 200;
  double height = 60;
  Color color = Colors.red;
  bool opacity = false;
  Animation<double>? animation;
  Animation<ContainerDetails>? _animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    // animation = Tween<double>(
    //   begin: 0,
    //   end: 1,
    // ).animate(CurvedAnimation(
    //   parent: animationController!,
    //   curve: Curves.linear,
    // ));
    _animation = Tween<ContainerDetails>(
      begin: ContainerDetails(0, 0, 0),
      end: ContainerDetails(200, 50, 2),
    ).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Curves.linear,
        reverseCurve: Curves.elasticOut.flipped,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customBtnWidgetAnim(),
            const SizedBox(
              height: 100,
            ),
            OutlineButtonTransition(
              borderWidth: _animation!,
            ),
          ],
        ),
      ),
    );
  }

  customBtnWidgetAnim() => InkWell(
        onTap: () {
          setState(() {
            opacity = !opacity;
            Future.delayed(const Duration(
              seconds: 1,
            )).then((value) => {
                  setState(() {
                    opacity = !opacity;
                    animationController!.forward();
                  })
                });
          });
        },
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedOpacity(
                duration: const Duration(
                  milliseconds: 500,
                ),
                opacity: !opacity ? 1 : 0,
                child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    border: Border.all(
                      color: Colors.cyan,
                      width: 2,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'AnimatedContainer',
                    ),
                  ),
                ),
              ),
              // if (opacity)
              AnimatedOpacity(
                duration: const Duration(
                  milliseconds: 500,
                ),
                opacity: opacity ? 1 : 0,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: height - 2,
                    width: width,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: const Center(
                      child: Text(
                        'AnimatedContainer',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //if (opacity)
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: opacity ? 1 : 0,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 56,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 25,
                          offset: const Offset(0, 0),
                          spreadRadius: 15,
                        ),
                      ],
                    ),
                    height: 3,
                    width: width,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class OutlineButtonTransition extends AnimatedWidget {
  Animation<ContainerDetails> get borderWidth =>
      listenable as Animation<ContainerDetails>;

  const OutlineButtonTransition({super.key, borderWidth})
      : super(listenable: borderWidth);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(
              milliseconds: 500,
            ),
            height: borderWidth.value.height,
            width: borderWidth.value.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: borderWidth.value.borderWidth,
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              animationController!.forward();
              Future.delayed(const Duration(
                seconds: 1,
              )).then(
                (value) => animationController!.reverse(),
              );
            },
            child: const Text('Outlined Button'),
          ),
        ],
      ),
    );
  }
}

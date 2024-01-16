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
  Color color = const Color(0xFF7bdcb5);
  Color border = const Color(0xFF00d084);
  bool opacity = false;
  Animation<double>? animation;
  Animation<ContainerDetails>? _animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );
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
            customBtnAnother(),
            const SizedBox(
              height: 100,
            ),
            customBtnWidgetAnim(),
            const SizedBox(
              height: 100,
            ),
            customAnotherBtn3(),
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

  customBtnAnother() {
    return InkWell(
      onTap: () {
        setState(() {
          opacity = !opacity;
          Future.delayed(const Duration(
            seconds: 2,
          )).then((value) {
            setState(() {
              opacity = !opacity;
            });
          });
        });
      },
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(
                seconds: 1,
              ),
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: color,
                border: Border.all(
                  width: 4,
                  color: border,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 25,
                    offset: const Offset(-1, 0),
                    spreadRadius: 15,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "Click Me",
                  style: TextStyle(
                    color: opacity ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(
                seconds: 1,
              ),
              opacity: opacity ? 1 : 0,
              child: Align(
                alignment: const Alignment(1, -1),
                child: AnimatedScale(
                  duration: const Duration(
                    seconds: 1,
                  ),
                  scale: opacity ? 1 : 0,
                  alignment: const Alignment(1, -1),
                  child: AnimatedContainer(
                    duration: const Duration(
                      seconds: 1,
                    ),
                    width: width,
                    height: 4,
                    decoration: BoxDecoration(
                      color: color,
                      border: const Border(
                        top: BorderSide(
                          width: 4,
                          color: Colors.white,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 25,
                          offset: const Offset(1, -1),
                          spreadRadius: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(
                seconds: 1,
              ),
              opacity: opacity ? 1 : 0,
              child: Align(
                alignment: const Alignment(1, -1),
                child: AnimatedScale(
                  duration: const Duration(
                    seconds: 1,
                  ),
                  scale: opacity ? 1 : 0,
                  alignment: const Alignment(1, -1),
                  child: AnimatedContainer(
                    duration: const Duration(
                      seconds: 1,
                    ),
                    width: 4,
                    height: height,
                    decoration: BoxDecoration(
                      color: color,
                      border: const Border(
                        left: BorderSide(
                          width: 4,
                          color: Colors.white,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 25,
                          offset: const Offset(1, -1),
                          spreadRadius: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(
                seconds: 1,
              ),
              opacity: opacity ? 1 : 0,
              child: Align(
                alignment: const Alignment(-1, 1),
                child: AnimatedScale(
                  duration: const Duration(
                    seconds: 1,
                  ),
                  scale: opacity ? 1 : 0,
                  alignment: const Alignment(-1, 1),
                  child: AnimatedContainer(
                    duration: const Duration(
                      seconds: 1,
                    ),
                    width: width,
                    height: 4,
                    decoration: BoxDecoration(
                      color: color,
                      border: const Border(
                        bottom: BorderSide(
                          width: 4,
                          color: Colors.white,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 25,
                          offset: const Offset(-1, 1),
                          spreadRadius: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(
                seconds: 1,
              ),
              opacity: opacity ? 1 : 0,
              child: Align(
                alignment: const Alignment(-1, 1),
                child: AnimatedScale(
                  duration: const Duration(
                    seconds: 1,
                  ),
                  scale: opacity ? 1 : 0,
                  alignment: const Alignment(-1, 1),
                  child: AnimatedContainer(
                    duration: const Duration(
                      seconds: 1,
                    ),
                    width: 4,
                    height: height,
                    decoration: BoxDecoration(
                      color: color,
                      border: const Border(
                        right: BorderSide(
                          width: 4,
                          color: Colors.white,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 25,
                          offset: const Offset(-1, 1),
                          spreadRadius: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  customBtnWidgetAnim() => InkWell(
        onTap: () {
          opacity = !opacity;
          setState(() {});
          Future.delayed(const Duration(
            seconds: 1,
          )).then((value) => {
                setState(() {
                  opacity = !opacity;
                  animationController!.forward();
                })
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
                  seconds: 1,
                ),
                opacity: !opacity ? 1 : 0,
                child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: color,
                    border: Border.all(
                      color: border,
                      width: 4,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Click Me',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              // if (opacity)
              AnimatedOpacity(
                duration: const Duration(
                  seconds: 1,
                ),
                opacity: opacity ? 1 : 0,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: height - 2,
                    width: width,
                    decoration: BoxDecoration(
                      color: color,
                    ),
                    child: const Center(
                      child: Text(
                        'Click Me',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
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
                  child: AnimatedScale(
                    duration: const Duration(
                      seconds: 1,
                    ),
                    scale: opacity ? 1 : 0,
                    alignment: const Alignment(-1, -1),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 25,
                            offset: const Offset(-1, 0),
                            spreadRadius: 15,
                          ),
                        ],
                      ),
                      height: 4,
                      width: width,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  customAnotherBtn3() {
    return InkWell(
      onTap: () {
        opacity = !opacity;
        setState(() {
          Future.delayed(const Duration(
            seconds: 2,
          )).then((value) {
            opacity = !opacity;
          });
        });
      },
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: color,
                border: Border.all(
                  color: border,
                  width: 4,
                ),
              ),
              child: const Center(
                child: Text(
                  'Click Me',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(
                milliseconds: 600,
              ),
              opacity: opacity ? 1 : 0,
              child: Align(
                alignment: const Alignment(0, 0),
                child: AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 600,
                  ),
                  height: opacity ? 0 : height,
                  width: opacity ? 0 : width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: color,
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Click Me',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
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
              seconds: 1,
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
            child: const Text('Click Me',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ],
      ),
    );
  }
}

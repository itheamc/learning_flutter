import 'package:flutter/material.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({Key? key}) : super(key: key);

  @override
  _TimelineScreenState createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                elevation: 20.0,
                borderRadius: BorderRadius.circular(18.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      10,
                      (index) => _TimelineTile(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "XYZ Shop",
                              style: index % 3 == 0 ? _theme.textTheme.headline3 : _theme.textTheme.headline6,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "3/4 18th Colony, ABC Complex",
                              style: _theme.textTheme.caption,
                            )
                          ],
                        ),
                        first: index == 0,
                        thickness: 3.5,
                        leading: Icons.account_circle_rounded,
                        leadingSize: 36.0,
                        color: Colors.primaries[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineTile extends StatelessWidget {
  final Widget child;
  final double thickness;
  final IconData? leading;
  final double leadingSize;
  final Color? color;
  final bool first;

  const _TimelineTile(
      {Key? key,
      required this.child,
      this.leading,
      this.color,
      this.thickness = 5.0,
      this.leadingSize = 30.0,
      this.first = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return IntrinsicHeight(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 1,
                  child: first
                      ? const SizedBox()
                      : Container(
                          width: thickness,
                          color: color ?? _theme.hintColor,
                        ),
                ),
                if (leading != null)
                  Icon(
                    leading,
                    size: leadingSize,
                    color: color ?? _theme.hintColor,
                  )
                else
                  Container(
                    width: leadingSize,
                    height: leadingSize,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(leadingSize/2),
                        color: _theme.hintColor),
                  ),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: thickness,
                    color: color ?? _theme.hintColor,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 7.5, bottom: 20.0),
              child: child,
            ),
          )
        ],
      ),
    );
  }
}

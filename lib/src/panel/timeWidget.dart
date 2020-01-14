import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TimeWidget extends StatefulWidget {
  final IconData icon;
  final String timeZoneIndentifier;
  final String timeString;
  final bool isPM;
  final String dayString;
  final Function onRemoved;
  final Function onEdited;
  final Function onTapped;

  TimeWidget({
    @required this.icon,
    @required this.timeZoneIndentifier,
    @required this.timeString,
    @required this.isPM,
    @required this.dayString,
    this.onEdited,
    this.onRemoved,
    this.onTapped,
  });

  @override
  _TimeWidgetState createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  Function onEdited;
  Function onRemoved;
  Function onTapped;

  @override
  void initState() {
    super.initState();

    onEdited = (onEdited == widget.onEdited) ? () {} : widget.onEdited;
    onRemoved = (onRemoved == widget.onRemoved) ? () {} : widget.onRemoved;
    onTapped = (onTapped == widget.onTapped) ? () {} : widget.onTapped;
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key("TimeWidget_Slidable_Key"),
      actionPane: SlidableScrollActionPane(),
      actionExtentRatio: 0.25,
      child: _main(context),
      actions: <Widget>[
        IconSlideAction(
          iconWidget: Icon(
            Icons.delete,
            color: Colors.red,
            size: 40,
          ),
          onTap: () => onRemoved(),
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          iconWidget: Icon(
            Icons.edit,
            color: Colors.green,
            size: 40,
          ),
          onTap: () => onEdited(),
        ),
      ],
      dismissal: SlidableDismissal(
        dismissThresholds: <SlideActionType, double>{
          SlideActionType.secondary: 1.0
        },
        child: SlidableDrawerDismissal(),
        onDismissed: (actionType) {
          if (actionType == SlideActionType.primary) {
            onRemoved();
          }
        },
      ),
    );
  }

  Widget _main(BuildContext context) {
    final double borderRadius = 20.0;

    return Material(
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        onTap: () => onTapped(),
        child: Ink(
          height: 0.0 + 20 + 20 + 60,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Theme.of(context).primaryColor,
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 0,
                top: 2,
                child: Icon(
                  widget.icon,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              Positioned(
                top: 43,
                left: 0,
                child: Text(
                  widget.timeZoneIndentifier.toUpperCase(),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: RichText(
                  textAlign: TextAlign.right,
                  text: TextSpan(
                    text: widget.timeString,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: (widget.isPM ? "PM" : "AM"),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 41,
                right: 0,
                child: Text(
                  widget.dayString.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

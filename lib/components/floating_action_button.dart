import 'package:flutter/material.dart';

import '../styles/styles.dart';

class FloatingActionComponent extends StatelessWidget {
  final Function()? onTapZoomIn;
  final Function()? onTapZoomOut;
  final Function()? onPressed;

  const FloatingActionComponent({
    Key? key,
    this.onPressed,
    this.onTapZoomIn,
    this.onTapZoomOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40, bottom: 10, right: 40),

          child: FloatingActionButton(
            heroTag: 'key1',
            onPressed: onPressed,
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(
              Icons.my_location_outlined,
              color: AppTheme.white,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppTheme.white,
              ),
              height: 85,
              width: 40,
              child: Column(
                children: [
                  InkWell(
                    onTap: onTapZoomIn,
                    child: SizedBox(
                      height: 40,
                      child: Icon(
                        Icons.add,
                        color: AppTheme.black,
                        size: 26,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 2,
                  ),
                  InkWell(
                    onTap: onTapZoomOut,
                    child: SizedBox(
                      height: 40,
                      child: Icon(
                        Icons.remove,
                        color: AppTheme.black,
                        size: 26,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

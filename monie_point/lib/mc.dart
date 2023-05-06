import 'package:flutter/material.dart';

class MC {
  static bh(res) {
    double a1 = res.toDouble();
    return SizedBox(height: a1);
  }

  static bw(res) {
    double a1 = res.toDouble();
    return SizedBox(width: a1);
  }

  static sh(res, ctx) {
    double a1 = res.toDouble();
    return MediaQuery.of(ctx).size.height / a1;
  }

  static sw(res, ctx) {
    double a1 = res.toDouble();
    return MediaQuery.of(ctx).size.width / a1;
  }

  static txt(txt, col, sz) {
    double a1 = sz.toDouble();
    return Text(txt, softWrap: true, style: TextStyle(fontSize: a1, color: col));
  }

  static txtB(txt, col, sz) {
    double a1 = sz.toDouble();
    return Text(txt, style: TextStyle(fontSize: a1, fontWeight: FontWeight.bold, color: col));
  }

  static icTxt(ico, label, ctx){
    return Expanded(
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.1),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(
                  ico, size: MediaQuery.of(ctx).size.width / 16,
                ),
              )
          ),
          bh(8),
          txt(label, Colors.grey, 14),
        ],
      ),
    );
  }

  static ss(ctx, sms) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: ctx,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0))),
            child: Text(sms,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'fonts/Roboto',
                    fontSize: 16)),
          );
        });
  }

  static dot(){
    return Container(
      height: 6,
      width: 6,
      decoration: const BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle
      ),
    );
  }

  static line(ctx){
    return Container(
      color: Colors.grey.withOpacity(0.3),
      height: 1.5,
      width: MediaQuery.of(ctx).size.width,
    );
  }
}

import 'package:flutter/material.dart';


Text customText (text,weight,size,color){

  return Text(
    text,
    style: TextStyle(
      fontWeight: weight,
      fontSize: size,
      color: color,
    ),
    textAlign: TextAlign.left,
    softWrap: true,
    overflow: TextOverflow.ellipsis,
    maxLines: 3,
  );
}
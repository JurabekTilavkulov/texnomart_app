import 'package:flutter/cupertino.dart';

import '../../../data/models/model_detail.dart';

Widget detailimageItem(BuildContext context, int index,DetailModel? detailModel){
  return Container(
    child: Image.network(detailModel!.data!.dataInner!.largeImages![index]),
  );
}
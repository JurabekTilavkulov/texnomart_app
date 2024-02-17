import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texnomart_app/data/models/model_good_by_id.dart';
import 'package:texnomart_app/data/utils/local_keys.dart';
import '../../../data/cubit/cubit_helper/cubit_helper.dart';
import '../../widgets/item_builder_for_detail.dart';

class CardPage extends StatelessWidget {
   CardPage({Key? key}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
     List<ModelProductsById> list=[];
     
    return BlocBuilder<CubitHelper, CubitHelperState>(
  builder: (context, state) {
    context.read<CubitHelper>().getAllProducts();
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalKeys.card.tr(),style: const TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10,right: 7),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.84,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {
                  
                }, child: Text(LocalKeys.deleteAll.tr(),style: const TextStyle(color: Colors.black),)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(LocalKeys.choseAll.tr()),
                  Checkbox(
                    value: false,
                    onChanged: (value) {

                  },)
                ],)
              ],
            ),
            const Divider(color: Color(0xFFC2C2C1)),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.51,
                    child:ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: state.products?.length??0,
                      itemBuilder: (context, index) {
                        return itemBuilderForDetail(context,index,state.products!);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(color: Color(0xFFC2C2C1));
                      },) ,
                  ),
                  const Divider(color: Color(0xFFC2C2C1),),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.19,
                    child: Column(
                      children: [
                        Text(LocalKeys.total.tr(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text("3 ${LocalKeys.product.tr()}"),
                          Text("jami summa so'm")
                        ],),
                        const SizedBox(height: 8,),
                        Container(
                          width: MediaQuery.of(context).size.width*0.7,
                          height: MediaQuery.of(context).size.height*0.05,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            color: Colors.black87
                          ),
                          child: Center(child: Text(LocalKeys.termPayment.tr(),style: const TextStyle(color: Colors.white),)),
                        ),
                        const SizedBox(height: 8,),
                        Container(
                          width: MediaQuery.of(context).size.width*0.7,
                          height: MediaQuery.of(context).size.height*0.05,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            color: Colors.amber
                          ),
                          child: Center(child: Text(LocalKeys.order.tr(),style: const TextStyle(color: Colors.black),)),
                        ),
                      ],
                    ),

                  )
                ],
              )

            )

          ],
        ),
      ),
    );
  },
);

  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:texnomart_app/data/utils/local_keys.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(LocalKeys.Enter.tr(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10,right: 10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width*0.9,
              height: MediaQuery.of(context).size.height*0.1,
              decoration: BoxDecoration(
                color: const Color(0x6BD2CECE),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text(LocalKeys.enterToSystem.tr())),
            ),
            const SizedBox(height: 10,),
            Text(LocalKeys.tell_number.tr(),style: const TextStyle(color: Colors.grey),),
            const TextField(
              keyboardType:TextInputType.phone,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                prefixText: "+998(",
                fillColor: Colors.amber,
              ),
            ),
            SizedBox(height: 10,),
            Text("<<Kirish>> tugmasini bosish orqali Ommaviy oferta shartlariga rozilik bildirasi"),
            SizedBox(height: 10,),
            GestureDetector(onTap: () {

            },
            child: Container(
              width: MediaQuery.of(context).size.width*0.9,
              height: MediaQuery.of(context).size.height*0.05,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text(LocalKeys.Enter.tr()),),
            ),
            )
          ],
        ),
      ),
    );
  }
}

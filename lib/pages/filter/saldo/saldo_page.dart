import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ventory/constaints.dart';
import 'package:ventory/pages/filter/saldo/saldo_controller.dart';
import 'package:ventory/pages/filter/saldo/saldo_filter_page.dart';
import 'package:ventory/shared/components/drawer.dart';

class SaldoPage extends StatelessWidget {
  const SaldoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: primaryTextColor,
        centerTitle: true,
        title: const Text("Filtrar Saldo"),
        automaticallyImplyLeading: true,
        elevation: 1,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const SaldoFilterPage());
              },
              icon: const Icon(Icons.filter_list)),
        ],
      ),
      body: GetBuilder<SaldoController>(
          autoRemove: false,
          id: 'SaldoListBuilder',
          init: SaldoController(),
          builder: (value) {
            if (value.loading.value) {
              return Container();
            }

            if (value.saldoFilterResult.value.items == null) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                          text: const TextSpan(
                              text: 'Filtro de Saldo',
                              style: TextStyle(
                                fontSize: 26.0,
                                color: Colors.black54,
                              ))),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: const TextSpan(
                          text: 'Para filtrar clique no icone  ',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black54,
                          ),
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.filter_list,
                                color: Colors.black54,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '   que está localizado no topo desta página',
                            ),
                          ],
                        ),
                      )
                    ],
                  ));
            }

            if (value.saldoFilterResult.value.items!.isEmpty) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.error_outline,
                        size: 64,
                        color: Colors.black54,
                      ),
                      SizedBox(height: 20),
                      Text('Nenhum item encontrado',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.black54,
                          )),
                    ],
                  )));
            }

            return SingleChildScrollView(
                primary: false,
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: value.saldoFilterResult.value.items!.length,
                      itemBuilder: (context, index) {
                        var item = value.saldoFilterResult.value.items![index];

                        return ListTile(
                            trailing: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: const BorderRadius.horizontal(
                                      left: Radius.circular(10),
                                      right: Radius.circular(10)),
                                  border: Border.all(color: Colors.blue)),
                              child: Text(
                                item.balance.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            title: Text(
                              item.name.toString(),
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'Código/SKU: ',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(text: item.code.toString())
                                    ],
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'Armazenamento: ',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(text: item.storage.toString())
                                    ],
                                  ),
                                )
                              ],
                            ));
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    )));
          }),
    );
  }
}

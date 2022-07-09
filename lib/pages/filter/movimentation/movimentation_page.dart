import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ventory/constaints.dart';
import 'package:ventory/pages/filter/movimentation/models/movimentation_filter_result.dart';
import 'package:ventory/pages/filter/movimentation/movimentation_controller.dart';
import 'package:intl/intl.dart';
import 'movimentation_filter_page.dart';

class MovimentationPage extends StatelessWidget {
  MovimentationPage({Key? key}) : super(key: key);

  final DateFormat dateFormat = DateFormat("dd-MM-yyyy HH:mm:ss");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: primaryTextColor,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text("Filtro de movimentação"),
        elevation: 1,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const MovimentationFilterPage());
              },
              icon: const Icon(Icons.filter_list)),
        ],
      ),
      body: GetBuilder<MovimentionController>(
          autoRemove: false,
          id: 'MovimentationListBuilder',
          init: MovimentionController(),
          builder: (value) {
            if (value.loading.value) {
              return Container();
            }

            if (value.movimentationFilterResult.value.items == null) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                          text: const TextSpan(
                              text: 'Filtro de Movimentações',
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

            if (value.movimentationFilterResult.value.items!.isEmpty) {
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
                child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount:
                        value.movimentationFilterResult.value.items!.length,
                    itemBuilder: (context, index) {
                      var item =
                          value.movimentationFilterResult.value.items![index];
                      return buildMovimentationListItem(item);
                    }));
          }),
    );
  }

  ListTile buildMovimentationListItem(Items item) {
    var text = item.negative! ? "-" : "+";

    return ListTile(
        trailing: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 3,
          ),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(10), right: Radius.circular(10)),
              border: Border.all(
                  color: item.negative! ? Colors.red : Colors.green)),
          child: Text(
            "$text${item.amount.toString()}",
            style: TextStyle(
              fontSize: 15,
              color: item.negative! ? Colors.red : Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: item.negative!
            ? const RotatedBox(
                quarterTurns: 3,
                child: Icon(
                  Icons.logout,
                  color: Colors.red,
                ))
            : const RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.login,
                  color: Colors.green,
                )),
        minLeadingWidth: 5,
        title: Text(
          item.name.toString(),
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87),
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
                    text: 'Saldo Anterior: ',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: item.currentBalance.toString())
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Saldao Anterior: ',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: item.previousBalance.toString())
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
            ),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Data de movimentação: ',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: item.createdAt.toString())
                ],
              ),
            )
          ],
        ));
  }
}

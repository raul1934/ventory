import 'package:flutter/material.dart';
import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:get/get.dart';
import 'package:ventury/constaints.dart';
import 'package:ventury/shared/components/armazenamento/armazenamento_model.dart';
import 'package:ventury/shared/components/primary_button.dart';

import 'armazenamento_controller.dart';

class ArmazenamentoComponent extends StatefulWidget {
  bool selectable;
  ArmazenamentoComponent({Key? key, required this.selectable})
      : super(key: key);

  @override
  State<ArmazenamentoComponent> createState() => _ArmazenamentoComponentState();
}

class _ArmazenamentoComponentState extends State<ArmazenamentoComponent> {
  ArmazenamentoController armazenamentoController =
      Get.put(ArmazenamentoController());

  late IndexedTreeViewController<ArmazenamentoIndexedNode> controller;
  late ArmazenamentoIndexedNode initialNode;

  @override
  initState() {
    super.initState();
    loadNodes();
  }

  loadNodes() async {
    controller = IndexedTreeViewController<ArmazenamentoIndexedNode>();
    initialNode = ArmazenamentoIndexedNode(
        key: "Estrutura de Armazenamento",
        armazenamentoModel: ArmazenamentoModel());
    await armazenamentoController.loadArmazenamentos();
    for (ArmazenamentoModel item
        in armazenamentoController.armazenamentoModel) {
      initialNode.addAll(createNode(item));
    }
  }

  createNode(ArmazenamentoModel item) {
    List<ArmazenamentoIndexedNode> items = [];
    if (item.children != null) {
      for (ArmazenamentoModel subitem in item.children!) {
        ArmazenamentoIndexedNode i = ArmazenamentoIndexedNode(
            armazenamentoModel: subitem, key: subitem.label.toString());
        i.addAll(createNode(subitem));
        items.add(i);
      }
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Estrutura de Armazenamento"),
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          //FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          height: double.infinity,
          child: Column(
            children: <Widget>[
              Obx(() => !armazenamentoController.loading.value
                  ? Expanded(
                      child: IndexedTreeView<ArmazenamentoIndexedNode>(
                        initialItem: initialNode,
                        indentPadding: 15,
                        controller: controller,
                        showRootNode: true,
                        padding: const EdgeInsets.all(0),
                        //expansionIndicator: null,
                        expansionBehavior:
                            ExpansionBehavior.collapseOthersAndSnapToTop,
                        shrinkWrap: true,
                        builder: (context, level, item) =>
                            buildListItem(level, item),
                      ),
                    )
                  : const Expanded(
                      child: Center(child: CircularProgressIndicator())))
            ],
          ),
        ),
      ),
      bottomSheet:
          PrimaryButton(onPressed: () {}, child: const Text("Selecionar")),
    );
  }

  Widget buildRootItem(int level, ArmazenamentoIndexedNode item) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(item.key),
                buildAddItemChildButton(item),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListItem(int level, ArmazenamentoIndexedNode item) {
    return Card(
      color: Colors.white,
      child: ListTile(
        title: Text(
          item.key,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
        ),
        subtitle: Text('Nível $level'),
        dense: true,
        leading: widget.selectable
            ? Transform.scale(
                scale: 1.3,
                child: Radio(
                  focusColor: primaryColor,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  value: item.armazenamentoModel.id,
                  groupValue: 2,
                  onChanged: (dynamic value) {},
                  activeColor: Colors.green,
                ))
            : null,
        trailing: !widget.selectable
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildAddItemButton(item),
                  buildRemoveItemButton(item),
                ],
              )
            : null,
        minLeadingWidth: 1,
      ),
    );
  }

  Widget buildAddItemButton(ArmazenamentoIndexedNode item) {
    TextEditingController _textFieldController = TextEditingController();

    return GestureDetector(
        onTap: () {
          Get.defaultDialog(
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              titlePadding: const EdgeInsets.symmetric(vertical: 15),
              title: "Adicionar Armazenamento",
              radius: 8,
              content: TextField(
                onChanged: (value) {},
                controller: _textFieldController,
                decoration: const InputDecoration(
                    hintText: "Informe o nome da estrutura de armazenamento"),
              ),
              backgroundColor: Colors.white,
              barrierDismissible: false,
              confirm: TextButton(
                  onPressed: () async {
                    if (item.armazenamentoModel.parentId != null) {
                      Get.close(1);
                      await armazenamentoController.addArmazenamento(
                          _textFieldController.value.text,
                          item.armazenamentoModel.companyDoc!,
                          item.armazenamentoModel.id!);
                      loadNodes();
                    }
                  },
                  child: const Text("Salvar")),
              cancel: TextButton(
                  onPressed: () {
                    Get.close(1);
                  },
                  child: const Text("Cancelar")));
        },
        child: const Icon(Icons.add_circle, color: Colors.green));
  }

  Widget buildRemoveItemButton(ArmazenamentoIndexedNode item) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Get.defaultDialog(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            titlePadding: const EdgeInsets.symmetric(vertical: 15),
            title: "Remover Armazenamento",
            radius: 8,
            content: RichText(
                text: const TextSpan(
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                    text:
                        'Têm certeza que deseja remover a estrutura de armazenamento?\n\nTodos os níveis abaixo da estrutura serão excluídos.'),
              ],
            )),
            backgroundColor: Colors.white,
            barrierDismissible: false,
            confirm: TextButton(
                onPressed: () async {
                  Get.close(1);
                  await armazenamentoController
                      .deleteArmazenamento(item.armazenamentoModel.id!);
                  loadNodes();
                },
                child: const Text("Salvar")),
            cancel: TextButton(
                onPressed: () {
                  Get.close(1);
                },
                child: const Text("Cancelar")));
      },
      child: const Icon(Icons.remove_circle, color: Colors.red),
    );
  }

  Widget buildAddItemChildButton(ArmazenamentoIndexedNode item) {
    return Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: IconButton(
            icon: const Icon(Icons.add_circle, color: Colors.green),
            onPressed: () => item.add(ArmazenamentoIndexedNode(
                armazenamentoModel: ArmazenamentoModel(), key: ''))));
  }

  Widget buildClearAllItemButton(ArmazenamentoIndexedNode item) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: FlatButton.icon(
          color: Colors.red[800],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          icon: const Icon(Icons.delete, color: Colors.white),
          label: const Text("Clear All", style: TextStyle(color: Colors.white)),
          onPressed: () => item.clear()),
    );
  }
}

class ArmazenamentoIndexedNode
    extends ListenableIndexedNode<ArmazenamentoIndexedNode> {
  ArmazenamentoModel armazenamentoModel;
  ArmazenamentoIndexedNode(
      {required String key, required this.armazenamentoModel})
      : super(key: key);
}

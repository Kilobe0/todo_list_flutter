import 'package:flutter/material.dart';

class AddTaskAlertDialog extends StatefulWidget {
  const AddTaskAlertDialog({super.key});

  @override
  State<AddTaskAlertDialog> createState() => _AddTaskAlertDialogState();
}

class _AddTaskAlertDialogState extends State<AddTaskAlertDialog> {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  TextEditingController taskDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Align(
        alignment: Alignment.topLeft,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.arrow_back_rounded),
            ),
            const Text('Adicionar Tarefa'),
            Container(),
          ],
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
              child: Text('Nova Tarefa'),
            ),
            TextField(
              controller: taskNameController,
              decoration: const InputDecoration(
                constraints: BoxConstraints(
                  minWidth: 300,
                ),
                hintText: 'Nome da sua tarefa',
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
              child: Text('Descrição'),
            ),
            TextField(
              controller: taskDescriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                constraints: BoxConstraints(
                  minWidth: 300,
                ),
                hintText: 'Descreva sua tarefa',
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
              child: Text('Data de entrega'),
            ),
            TextField(
              onTap: () async {
                DateTime? datePicked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (datePicked != null) {
                  setState(() {
                    taskDateController.text =
                        '${datePicked.day}/${datePicked.month}/${datePicked.year}';
                  });
                }
              },
              controller: taskDateController,
              readOnly: true,
              decoration: const InputDecoration(
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Icon(Icons.calendar_today),
                ),
                constraints: BoxConstraints(
                  minWidth: 300,
                ),
                hintText: 'Selecione uma data',
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
                ),
              ),
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Adicionar'),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/controllers/user_tasks_controller.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';
import 'package:todo_list_flutter/app/widgets/snackbar_message.dart';

class AddTaskAlertDialog extends StatefulWidget {
  AddTaskAlertDialog({super.key, this.task});
  TaskModel? task;
  @override
  State<AddTaskAlertDialog> createState() => _AddTaskAlertDialogState();
}

class _AddTaskAlertDialogState extends State<AddTaskAlertDialog> {
  @override
  void initState() {
    // TODO: implement initState
    if (widget.task != null) {
      UserTasksController.instance.taskNameController.text = widget.task!.title;
      UserTasksController.instance.taskDescriptionController.text =
          widget.task!.description;
      UserTasksController.instance.dateTime = widget.task!.date;
    }
    super.initState();
  }

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
            widget.task == null
                ? const Text('Adicionar Tarefa')
                : const Text('Editar Tarefa'),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
              child: widget.task == null
                  ? const Text('Nova Tarefa')
                  : const Text('Editar Tarefa'),
            ),
            TextField(
              controller: UserTasksController.instance.taskNameController,
              maxLength: 40,
              decoration: const InputDecoration(
                constraints: BoxConstraints(
                  minWidth: 300,
                  maxWidth: 300,
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
              controller:
                  UserTasksController.instance.taskDescriptionController,
              maxLines: 3,
              maxLength: 500,
              decoration: const InputDecoration(
                constraints: BoxConstraints(
                  minWidth: 300,
                  maxWidth: 300,
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
                    UserTasksController.instance.dateTime = datePicked;
                  });
                }
              },
              controller: TextEditingController(
                  text:
                      '${UserTasksController.instance.dateTime.day}/${UserTasksController.instance.dateTime.month}/${UserTasksController.instance.dateTime.year}'),
              readOnly: true,
              decoration: const InputDecoration(
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Icon(Icons.calendar_today),
                ),
                constraints: BoxConstraints(
                  minWidth: 300,
                  maxWidth: 300,
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
          onPressed: () async {
            if (widget.task == null) {
              await UserTasksController.instance.addTask(context);
            } else {
              widget.task!.title =
                  UserTasksController.instance.taskNameController.text;
              widget.task!.description =
                  UserTasksController.instance.taskDescriptionController.text;
              widget.task!.date = UserTasksController.instance.dateTime;
              if (widget.task!.title.isEmpty) {
                showSnackBarError(context, 'Nome da tarefa está vazio');
                return;
              }

              await UserTasksController.instance
                  .updateTask(context, widget.task!);
            }
            context.mounted ? Navigator.of(context).pop() : null;
          },
          child: widget.task == null
              ? const Text('Adicionar')
              : const Text('Salvar'),
        ),
      ],
    );
  }
}

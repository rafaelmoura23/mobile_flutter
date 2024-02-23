import 'package:flutter/material.dart';
import 'package:to_buy_list/TarefaController.dart';
import 'package:provider/provider.dart';

class ListaTarefasScreen extends StatelessWidget {
  // Controlador para o campo de texto de nova tarefa
  final TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      // Corpo principal do aplicativo
      body: Column(
        children: [
          // Campo de texto para adicionar nova tarefa
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Adicione um Novo Produto',
                // Ícone para adicionar tarefa ao pressionar o botão
                suffixIcon: IconButton(
                  onPressed: () {
                    // Chamando o método adicionarTarefa do Provider para atualizar o estado
                    Provider.of<ListaTarefasControler>(context, listen: false)
                    .adicionarTarefa(_controller.text);
                    // Limpar o campo de texto após adicionar a tarefa
                    _controller.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          // Lista de tarefas usando um Consumer do Provider para atualização automática
          Expanded(
            child: Consumer<ListaTarefasControler>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.tarefas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // Exibição do texto da tarefa
                      title: Text(model.tarefas[index].descricao),
                      // Checkbox para marcar a tarefa como concluída
                      trailing: Checkbox(
                        value: model.tarefas[index].concluida,
                        onChanged: (value) {
                          // Chamando o método marcarComoConcluida do Provider para atualizar o estado
                          model.marcarComoConcluida(index);
                        },
                      ),
                      // Exclui a tarefa ao manter pressionado
                      onLongPress: () {
                        // Chamando o método excluirTarefa do Provider para atualizar o estado
                        model.excluirTarefa(index);
                      },
                     // Ícone de edição para atualizar a tarefa
                      leading: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          // Abre um diálogo para atualizar a tarefa
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Atualizar Tarefa'),
                                content: TextField(
                                  controller: TextEditingController(
                                      text: model.tarefas[index].descricao),
                                  onChanged: (value) {
                                    // Atualiza a descrição da tarefa conforme o usuário digita
                                    model.tarefas[index].descricao = value;
                                  },
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancelar'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // Chamando o método atualizarTarefa do Provider para atualizar o estado
                                      model.atualizarTarefa(index, model.tarefas[index].descricao);                                      
                                      Navigator.pop(context);
                                    },
                                    child: Text('Salvar'),
                                    
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
enum TodoStatus { todo, inprogress, done }

class TodoContent {
  final String title;
  final String content;
  late TodoStatus state;

  TodoContent({required this.title, required this.content, TodoStatus? state}) {
    if (state != null) {
      this.state = state;
    } else {
      this.state = TodoStatus.todo;
    }
  }

  void setTodo() {
    this.state = TodoStatus.todo;
  }

  void setInprogress() {
    this.state = TodoStatus.inprogress;
  }

  void setDone() {
    this.state = TodoStatus.done;
  }

  void setNextState() {
    switch (this.state) {
      case TodoStatus.todo:
        setInprogress();
        break;
      case TodoStatus.inprogress:
        setDone();
        break;
      case TodoStatus.done:
        break;
    }
  }

  bool isTodo() {
    return (this.state == TodoStatus.todo);
  }

  bool isInprogress() {
    return this.state == TodoStatus.inprogress;
  }

  bool isDone() {
    return this.state == TodoStatus.done;
  }

  String getStateString() {
    switch (this.state) {
      case TodoStatus.todo:
        return "ToDo";
      case TodoStatus.inprogress:
        return "In Progress";
      case TodoStatus.done:
        return "Done";
    }
  }

  @override
  String toString() {
    return "${this.title}, ${this.content},${this.state}";
  }
}

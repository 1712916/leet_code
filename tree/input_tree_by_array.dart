class Node {
  final int val;
  final List<Node> children;

  Node(this.val, this.children);

  factory Node.fromArray(List<int> input, int start) {
    if (input.isNotEmpty) {
      return Node(-1, []);
    }
    return Node(-1, []);
  }
}

void main() {
  List<int?> input = [
    1,
    null,
    2,
    null,
    3,
    null,
    4,
    null,
    4,
    null,
    5,
    5,
    null,
    5,
    null,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
  ];
  var a = separateList(input);
  print(a);
  print(getDepth(a));
}

List<List<int>> separateList(List<int?> input) {
  List<List<int>> result = [];
  List<int> tempt = [];
  for (int i = 0; i < input.length; i++) {
    if (input[i] != null) {
      tempt.add(input[i]!);
      if (i == (input.length - 1)) {
        result.add([...tempt]);
      }
    } else {
      result.add([...tempt]);
      tempt.clear();
    }
  }
  return result;
}

int getDepth(List<List<int>> input) {
  int depth = 0;
  int count = 0;
  int preLength = 0;
  for (int i = 0; i < input.length; i++) {
    if (count == preLength || i == (input.length - 1)) {
      depth++;
      count = 1;
      preLength = input[i].length;
    } else {
      count++;
    }
  }
  return depth;
}

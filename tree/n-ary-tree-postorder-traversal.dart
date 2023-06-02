/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

// extension GetNode on List<int?> {
//   Node getNode() {
//     for (int i = 0; i < this.length; i++) {
//       this.skip(count)
//     }
//     return Node(this.first!, []);
//   }
// }

void main() {
  Node node = Node(1, [
    Node(3, [
      Node(5, []),
      Node(6, []),
    ]),
    Node(2, []),
    Node(4, []),
  ]);
  print(Solution().postorder(node));
}

class Solution {
  List<int> postorder(Node root) {
    List<int> ans = [];

    traversal(root, ans);

    return ans;
  }

  void traversal(Node root, List<int> ans) {
    for (var c in root.children) {
      traversal(c, ans);
    }

    ans.add(root.val);

    return;
  }
}

class Node {
  final int val;
  final List<Node> children;

  Node(this.val, this.children);
}

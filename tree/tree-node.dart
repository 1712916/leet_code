class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

void duyetNode(TreeNode? node) {
  print(node?.val.toString());

  if (node?.left != null) {
    duyetNode(node?.left);
  }
  if (node?.right != null) {
    duyetNode(node?.right);
  }
}

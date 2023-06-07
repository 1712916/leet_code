/*
  https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/description/
*/

import 'tree-node.dart';

void main() {
  List<int> nums = [for (var i = 1; i <= 6; i += 1) i];

  // TreeNode node = TreeNode(5, TreeNode(4), TreeNode(3));

  TreeNode? node = Solution().sortedArrayToBST(nums);

  duyetNode(node);
  // print(node);
}

class Solution {
  TreeNode? sortedArrayToBST(List<int> nums) {
    if (nums.isEmpty) {
      return null;
    }
    return getNode(nums, 0, nums.length - 1);
  }

  TreeNode? getNode(List<int> nums, int start, int end) {
    if (start > end) {
      return null;
    }

    int mid = (start + end) ~/ 2;

    return TreeNode(
      nums[mid],
      getNode(nums, start, mid - 1),
      getNode(nums, mid + 1, end),
    );
  }
}

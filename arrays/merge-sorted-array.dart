/*
https://leetcode.com/problems/merge-sorted-array/
 */
void main() {
  var nums = [1, 2, 3, 0, 0, 0];
  print(nums);
  Solution().merge(nums, 3, [2, 5, 6], 3);
  print(nums);
}

class Solution {
  void merge(List<int> nums1, int m, List<int> nums2, int n) {
    int i = m - 1;
    int j = n - 1;
    int l = m + n - 1;

    while (j >= 0) {
      if (i >= 0 && nums1[i] > nums2[j]) {
        nums1[l--] = nums1[i--];
      } else {
        nums1[l--] = nums2[j--];
      }
    }
  }
}

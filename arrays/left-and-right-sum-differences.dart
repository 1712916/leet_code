import '../execute_time.dart';

/*
Given a 0-indexed integer array nums, find a 0-indexed integer array answer where:

answer.length == nums.length.
answer[i] = |leftSum[i] - rightSum[i]|.
Where:

leftSum[i] is the sum of elements to the left of the index i in the array nums. If there is no such element, leftSum[i] = 0.
rightSum[i] is the sum of elements to the right of the index i in the array nums. If there is no such element, rightSum[i] = 0.
Return the array answer.

 

Example 1:

Input: nums = [10,4,8,3]
Output: [15,1,11,22]
Explanation: The array leftSum is [0,10,14,22] and the array rightSum is [15,11,3,0].
The array answer is [|0 - 15|,|10 - 11|,|14 - 3|,|22 - 0|] = [15,1,11,22].
Example 2:

Input: nums = [1]
Output: [0]
Explanation: The array leftSum is [0] and the array rightSum is [0].
The array answer is [|0 - 0|] = [0].
 

Constraints:

1 <= nums.length <= 1000
1 <= nums[i] <= 105
 */

void main() {
  measureExecutionTime(() {
    print(Solution().leftRigthDifference([10, 4, 8, 3]));
  });
}

class Solution {
  List<int> leftRigthDifference(List<int> nums) {
    List<int> l = [];
    List<int> r = [];
    List<int> a = [];
    for (int i = 0; i < nums.length; i++) {
      if (i == 0) {
        l.add(0);
      } else {
        l.add(nums[i - 1] + l[i - 1]);
      }

      if ((nums.length - 1 - i) == nums.length - 1) {
        r.insert(0, 0);
      } else {
        r.insert(0, nums[nums.length - i] + r[nums.length - i]);
      }
    }

    for (int i = 0; i < nums.length; i++) {
      if (l[i] > r[i]) {
        a.add(l[i] - r[i]);
      } else {
        a.add(r[i] - l[i]);
      }
    }

    return a;
  }
}

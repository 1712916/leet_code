/*
Given an array of integers nums, return the number of good pairs.

A pair (i, j) is called good if nums[i] == nums[j] and i < j.

 

Example 1:

Input: nums = [1,2,3,1,1,3]
Output: 4
Explanation: There are 4 good pairs (0,3), (0,4), (3,4), (2,5) 0-indexed.
Example 2:

Input: nums = [1,1,1,1]
Output: 6
Explanation: Each pair in the array are good.
Example 3:

Input: nums = [1,2,3]
Output: 0
 

Constraints:

1 <= nums.length <= 100
1 <= nums[i] <= 100
 */
import '../execute_time.dart';

void main() {
  measureExecutionTime(() {
    print(Solution().numIdenticalPairs([1, 2, 3, 1, 1, 3]) == 4); //true
    print(Solution().numIdenticalPairs([1, 1, 1, 1]) == 6); //true
  });
}

class Solution {
  int numIdenticalPairs(List<int> nums) {
    Map<int, List<int>> temp = {};

    int sum = 0;

    for (int i = 0; i < nums.length; i++) {
      if (temp.containsKey(nums[i])) {
        sum += temp[nums[i]]!.length;
        temp[nums[i]]!.add(i);
      } else {
        temp[nums[i]] = [i];
      }
    }

    return sum;
  }
}

/*
https://leetcode.com/problems/container-with-most-water/

You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

Find two lines that together with the x-axis form a container, such that the container contains the most water.

Return the maximum amount of water a container can store.

Notice that you may not slant the container.

 

Example 1:


Input: height = [1,8,6,2,5,4,8,3,7]
Output: 49
Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
Example 2:

Input: height = [1,1]
Output: 1
 

Constraints:

n == height.length
2 <= n <= 105
0 <= height[i] <= 104
 */

import '../execute_time.dart';

void main() {
  measureExecutionTime(() {
    print(Solution().maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7]) == 49); //true
    print(Solution().maxArea([1, 1]) == 1); //true
  });
}

class Solution {
  int maxArea(List<int> height) {
    int l = 0;
    int r = height.length - 1;
    int max = 0;
    while (l < r) {
      int hl = height[l];
      int hr = height[r];

      if (hl > hr) {
        int c = hr * (r - l);
        if (c > max) {
          max = c;
        }
        r--;
      } else {
        int c = hl * (r - l);
        if (c > max) {
          max = c;
        }
        l++;
      }
    }
    return max;
  }
}


/*
  Giải thích:
  Lấy độ dài của 2 cạnh.
  => Diện tích là h(cạnh nhỏ hơn) * khoảng cách

  => Khi thu hẹp lại có nghĩa khoảng cách thu hẹp.

  Nếu giữ cạnh nhỏ hơn và thay đổi vị trí dài hơn thì diện tích chỉ có nhỏ hơn.

  => Thay đổi vị trí của cạnh nhỏ hơn.
 */
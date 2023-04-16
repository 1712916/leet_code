import '../execute_time.dart';
/*
Given an array nums, return true if the array was originally sorted in non-decreasing order, then rotated some number of positions (including zero). Otherwise, return false.

There may be duplicates in the original array.

Note: An array A rotated by x positions results in an array B of the same length such that A[i] == B[(i+x) % A.length], where % is the modulo operation.


Example 1:

Input: nums = [3,4,5,1,2]
Output: true
Explanation: [1,2,3,4,5] is the original sorted array.
You can rotate the array by x = 3 positions to begin on the the element of value 3: [3,4,5,1,2].
Example 2:

Input: nums = [2,1,3,4]
Output: false
Explanation: There is no sorted array once rotated that can make nums.
Example 3:

Input: nums = [1,2,3]
Output: true
Explanation: [1,2,3] is the original sorted array.
You can rotate the array by x = 0 positions (i.e. no rotation) to make nums.

*/

void main() {
  measureExecutionTime(() {
    print(Solution().check([3, 4, 5, 1, 2])); //true
    print(Solution().check([5, 1, 2, 3, 4])); //true
    print(Solution().check([1, 2, 3])); //true [x]
    print(Solution().check([2, 1, 4, 5])); //false [xx]
    print(Solution().check([2, 1, 5, 4, 6])); //false [xxx]
    print(Solution().check([3, 2, 1, 4, 6])); //false [xxx]
    print(Solution().check([1, 1, 1, 1])); // true [4x]
  });
}

class Solution {
  bool check(List<int> nums) {
    //x sẽ đếm số lần rotate (xoay)
    //có nghĩa nếu không xoay ở vị trí 0
    //thì sẽ có 1 lần mà vị trí phía trước có giá trị lớn hơn vị trí phía sau
    int x = 0;
    for (int i = 1; i < nums.length; i++) {
      if (nums[i - 1] > nums[i]) {
        x++;
      }
    }
    //sau vòng for
    //nếu x = 1 thì có nghĩa là xoay 1 lần (nhưng chưa biết có sắp xếp không)
    //nếu x > 1 có nghĩa mãng này chưa được sorted *[xxx]

    //[xx] trong case này x sau vòng for là 1
    //có nghĩa nó thoả điều kiện xoay 1 lần nhưng chưa đảm bảo đã sorted

    //Thêm vào đó nếu đã xoay thì giá trị đầu tiên sẽ lớn giá trị cuối cùng
    if (nums[nums.length - 1] > nums[0]) {
      x++;
    }

    //x = 1 có 2 TH là: Đã sorted và Rotated || Đã sorted và không rotated (Cũng có nghĩa là rotated ở 0)
    //x = 0 khi và chỉ khi các phần tử mãng chỉ có 1 giá trị duy nhất [4x]
    ///Vì khi cùng giá trị thì sẽ không xác định được điểm xoay và giá trị đầu cuối bằng nhau
    return x <= 1;
  }
}

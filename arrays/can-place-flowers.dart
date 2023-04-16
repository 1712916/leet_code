/*
You have a long flowerbed in which some of the plots are planted, and some are not. However, flowers cannot be planted in adjacent plots.

Given an integer array flowerbed containing 0's and 1's, where 0 means empty and 1 means not empty, and an integer n, return true if n new flowers can be planted in the flowerbed without violating the no-adjacent-flowers rule and false otherwise.

Example 1:

Input: flowerbed = [1,0,0,0,1], n = 1
Output: true
Example 2:

Input: flowerbed = [1,0,0,0,1], n = 2
Output: false
*/

/*
Các trường hợp biên
[]
[0]
[0,....]
[....,0]
 */

void main() {
  print(Solution().canPlaceFlowers2([1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 10)); //true
  print(Solution().canPlaceFlowers2([1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 100)); //false
  print(Solution().canPlaceFlowers2([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], 1)); //false
  print(Solution().canPlaceFlowers2([1, 0, 0, 0, 1], 1)); //true
  print(Solution().canPlaceFlowers2([1, 0, 0, 0, 1], 2)); //false
  print(Solution().canPlaceFlowers2([1], 2)); //false
  print(Solution().canPlaceFlowers2([0], 0)); //true
  print(Solution().canPlaceFlowers2([0], 1)); //true
  print(Solution().canPlaceFlowers2([0], 2)); //false
}

class Solution {
  bool canPlaceFlowers(List<int> flowerbed, int n) {
    if (n == 0) {
      //nếu không trồng thêm thì nó luôn đúng
      return true;
    }

    for (int i = 0; i < flowerbed.length; i++) {
      if (flowerbed[i] == 0 && ((i == 0 || flowerbed[i - 1] == 0) && (i == flowerbed.length - 1 || flowerbed[i + 1] == 0))) {
        flowerbed[i] = 1;
        n--;

        if (n == 0) {
          return true;
        }
      }
    }

    return false;
  }

  /*
      Trong thực tế hãy xét đến việc n = 0, 
      có nghĩa là không cây nào được trồng có thường xuyên xảy ra không?
      Có thể thấy là không thường xuyên.
      => Có thể đưa điều kiện này xuống dưới (tiết kiệm 1 condition) và ưu tiên các trường hợp bình thường hơn.
      
      Nhưng nếu mãng flowerbed quá dài và n = 0 thì condion trong vòng lặp cũng trở nên tốn kém hơn.
      => Việc đưa xuống dưới ở bên trên là không cần thiết.

      Tách điều kiện ra cho dễ đọc.
   */

  bool canPlaceFlowers2(List<int> flowerbed, int n) {
    if (n == 0) {
      return true;
    }

    for (int i = 0; i < flowerbed.length; i++) {
      if (flowerbed[i] == 0) {
        if (((i == 0 || flowerbed[i - 1] == 0) && (i == flowerbed.length - 1 || flowerbed[i + 1] == 0))) {
          flowerbed[i] = 1;
          n--;

          if (n == 0) {
            return true;
          }
        }
      } else {
        //nếu tại vị trí i có giá trị là 1 thì không cần xét vị trí ngay bên cạnh nó nữa
        i++;
      }
    }

    return false;
  }
}

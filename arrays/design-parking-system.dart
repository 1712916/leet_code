/*
  https://leetcode.com/problems/design-parking-system 
 */

/*
  Note:
  - This way is faster storage variables big, medium, smal and check condition
  //vi: Cách này có tốc độ cao hơn việc lưu từng giá trị big, medium, small và check if-else hay switch-case
 */

class ParkingSystem {
  List<int> _park = [];

  ParkingSystem(int big, int medium, int small) {
    _park = [0, big, medium, small];
  }

  bool addCar(int carType) {
    return --_park[carType] >= 0;
  }
}

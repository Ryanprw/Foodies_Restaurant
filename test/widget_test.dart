import 'package:flutter_test/flutter_test.dart';
import 'package:restauran_app/data/model/restaurant.dart';

var testRestauran = {
  "id": "ygewwl55ktckfw1e867",
  "name": "Istana Emas",
  "description":
      "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,",
  "pictureId": "05",
  "city": "Balikpapan",
  "rating": 4.5
};

void main() {
  test("Test JSON Parsing", () async {
    var result = Restaurant.fromJson(testRestauran).id;

    expect(result, "ygewwl55ktckfw1e867");
  });
}

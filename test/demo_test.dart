import 'package:excelledia/home/bloc/getimagelist_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  GetimagelistBloc blocClass = GetimagelistBloc();

  group("test in bloc", () {});

  test("test in sumation ", () {
    expect(blocClass.sumofNum(1, 3), 4);
  });

  test("description", () => {



  });
}


import Foundation

struct SettingModel {
//  Java의 Interface와 비슷
//  초기값이 필요하면 ""로 지정할것
    var leftImageName: String = ""
    var menuTitle: String = ""
    var subTitle: String?
    var rightImageName: String? // String이 있을수도 있고 없을수도 있다.(Optional)
}

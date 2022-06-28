
import UIKit

class ViewController: UIViewController {
    
    var settingModel = [[SettingModel]]() // String[]

    @IBOutlet weak var settingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//      처음에 호출되면 생성되도록 만듦
        func makeData() {
            settingModel.append(
            [SettingModel(leftImageName: "person.circle", menuTitle: "iphone에 로그인", subTitle: "iCloud, App Store 등 설정", rightImageName: nil)]
            )
            
            settingModel.append(
//          3개짜리 Array를 생성함
            [SettingModel(leftImageName: "gear", menuTitle: "일반", subTitle: nil, rightImageName: "chevron.right"),
            
            SettingModel(leftImageName: "person.fill", menuTitle: "손쉬운 사용", subTitle: nil, rightImageName: "chevron.right"),
            
            SettingModel(leftImageName: "hand.raised.fill", menuTitle: "개인 정보 보호", subTitle: nil, rightImageName: "chevron.right")]
            )
        }
        
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.backgroundColor = UIColor(white: 245/255, alpha: 1)
        makeData()
        
//      TableView 사용규칙
//      let nib = UINib(nibName: "ProfileCell", bundle: nil)
        
        settingTableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
//      nibName: File이름
        settingTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//      갯수를 리턴한다 ex/ return 5;
        return settingModel[section].count     // section의 갯수만큼
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            //      어떤걸 보여줄거니?
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath)
                    as! ProfileCell
            
                    cell.topTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
                    cell.profileImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
                    cell.bottomDescription.text = settingModel[indexPath.section][indexPath.row].subTitle
            
            
                    return cell
            //      무조건 이 cell만 나타내주겠다!
        }
        
//      어떤걸 보여줄거니?
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        cell.leftImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
                
        cell.leftImageView.tintColor = .systemRed
        
        cell.middleTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
                
        cell.rightImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].rightImageName ?? "")
//              값 없으면 그냥 빈 String return
        
        return cell
//      무조건 이 cell만 나타내주겠다!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
//          첫번째꺼는 내가 지정한대로 보여주고,
            return UITableView.automaticDimension
        }
//      나머지는 그냥 60정도로만 줘
        return 60
    }
    
}

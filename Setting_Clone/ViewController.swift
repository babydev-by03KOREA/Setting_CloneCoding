
import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var settingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
//      TableView 사용규칙
//      let nib = UINib(nibName: "ProfileCell", bundle: nil)
        
        settingTableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
//      nibName: File이름
        settingTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
//      갯수를 리턴한다
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            //      어떤걸 보여줄거니?
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath)
                    
                    return cell
            //      무조건 이 cell만 나타내주겠다!
        }
        
        //      어떤걸 보여줄거니?
                let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
                
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

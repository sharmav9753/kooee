import Foundation
import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var tableViewSettings: UITableView!
    private var dataSource: [SettingItem]?
    
    //MARK: LifeCycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        prepareUserData()
        self.tableViewSettings.register(
            UINib(nibName: XIBName.SettingCell.rawValue, bundle: nil), forCellReuseIdentifier: XIBIdentifier.SettingCell.rawValue)
    }
    
    private func prepareUserData() {
        self.dataSource = [
            SettingItem(title: SettingItems.profile_pic.rawValue , icon: "person.circle.fill", type: .ICON),
            SettingItem(title: SettingItems.display_name.rawValue, type: .TEXT, value: "kooee"),
            SettingItem(title: SettingItems.change_password.rawValue, type: .PASS, value: "test"),
            SettingItem(title: SettingItems.invite.rawValue, icon: "square.and.arrow.up", type: .ICON)
        ]
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension SettingsVC:  UITableViewDelegate, UITableViewDataSource {

    //MARK: TableView Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableViewSettings.dequeueReusableCell(withIdentifier: XIBIdentifier.SettingCell.rawValue, for: indexPath) as? SettingCell,
              let item = self.dataSource?[indexPath.row] else {
            return SettingCell()
        }
        
        cell.setupCell(data: item)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
}


/*
 Setting list items.
 */
fileprivate enum SettingItems : String {
    case profile_pic = "Profile Picture"
    case display_name = "Display Name"
    case change_password = "Change Password"
    case invite = "Invite friends to Kooee"
}

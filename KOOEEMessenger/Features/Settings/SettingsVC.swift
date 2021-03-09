import Foundation
import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var tableViewSettings: UITableView!
    // MARK: LifeCycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewSettings.delegate = self
        self.tableViewSettings.dataSource = self
        self.tableViewSettings.register(
            UINib(nibName: "SettingCell", bundle: nil), forCellReuseIdentifier: "SettingCell"
        )
    }
}

extension SettingsVC:  UITableViewDelegate, UITableViewDataSource {

    // MARK: TableView Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableViewSettings.dequeueReusableCell(
            withIdentifier: "SettingCell", for: indexPath
        ) as? SettingCell else {
            return SettingCell()
        }
        cell.setupCell(title: "Profile Picture")
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
}

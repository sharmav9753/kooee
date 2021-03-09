import Foundation
import UIKit

class CustomViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageSettings = UIImage(systemName: "line.horizontal.3")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: imageSettings,
            style: .plain, target: self, action: #selector(showSettings)
        )
        let imagePlus = UIImage(systemName: "plus")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: imagePlus,
            style: .plain, target: self, action: #selector(rightButtonClicked)
        )
    }

    @objc func showSettings() {
        let settingsStoryboard = UIStoryboard(name: StoryboardName.Settings.rawValue, bundle: nil)
        self.navigationController?.present(
            createSideMenu(with: settingsStoryboard.instantiateViewController(withIdentifier: StoryboardIdentifire.Settings.rawValue)),
            animated: true
        )
    }
    
    func createSideMenu(with vc: UIViewController) -> UIViewController {
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        
        let sideMenu = SideMenuNavigationController(rootViewController:vc)
        sideMenu.leftSide = true
        sideMenu.menuWidth = width
        
        return sideMenu
    }

    @objc func rightButtonClicked() {

    }
}

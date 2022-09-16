//
//  SecondController.swift
//  iOSAppArchitecture_Kritica
//
//  Created by EKbana on 15/09/2022.
//

import UIKit


//MARK: - Protocol and delegate
protocol LogoChangeDelegate: NSObject{
    func logoChange(image: UIImage)
}

//MARK: - class
class SecondController: UIViewController {
    
    weak var changeDeleate: LogoChangeDelegate?
    var closuress: ((UIImage) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    //MARK: - Protocol and delegate
    @IBAction func protocolButtonTapped(_ sender: UIButton) {
        changeDeleate?.logoChange(image: UIImage.firstLogo)
    }
    
    //MARK: - NotificationCenterAnd Observer
    @IBAction func NotificationButtonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: .changelog, object: UIImage.secondLogo)
    }
    
    //MARK: - Closures
    @IBAction func ClosuresButtonTapped(_ sender: Any) {
        guard let closuress = closuress else {
            return
        }
        closuress(.thirdLogo)
    }
    
}

//MARK: - extension
extension NSNotification.Name{
    static let changelog = NSNotification.Name.init("NOTIFICATION_FIRE")
}

extension UIImage {
    
    static let logo = UIImage(named: "logo")!
    static let secondLogo = UIImage(named: "eye")!
    static let firstLogo = UIImage(named: "cloverlogo")!
    static let thirdLogo = UIImage(named: "watch")!
}


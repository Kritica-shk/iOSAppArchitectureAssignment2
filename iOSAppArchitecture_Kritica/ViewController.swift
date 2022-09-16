//
//  ViewController.swift
//  iOSAppArchitecture_Kritica
//
//  Created by EKbana on 15/09/2022.
//

import UIKit


class ViewController: UIViewController {
    
    
    //MARK: - outlets 
    @IBOutlet weak var mainImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       obv()
    }
    
    //MARK: - NotificationCenterAnd Observer
    func obv(){
        NotificationCenter.default.addObserver(self, selector: #selector(changebg(notification:)), name: .changelog, object: nil)
    }

    @objc func changebg(notification: NSNotification){
//        mainImage.image = UIImage(named: "eye")
        if let image = notification.object as? UIImage{
                   mainImage.image = image
               }
    }
    
    @IBAction func cloudInButtonTapped(_ sender: Any) {
        let stordboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = stordboard.instantiateViewController(withIdentifier: "SecondController") as! SecondController
        //delegate
        controller.changeDeleate = self
        //closures
        controller.closuress = { [weak self] image in
            self?.mainImage.image = image
        }
        navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - Unwind Segue
    @IBAction func unwindThis(_ sender: UIStoryboardSegue) {
        
    }
}

//MARK: - Extension
extension ViewController: LogoChangeDelegate{
    func logoChange(image: UIImage) {
        mainImage.image = image
    }
}



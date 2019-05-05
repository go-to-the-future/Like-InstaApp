//
//  SNSViewController.swift
//  Like-InstaApp
//
//  Created by Kiyoto Ryuman on 2019/05/05.
//  Copyright © 2019 Kiyoto Ryuman. All rights reserved.
//

import UIKit

class SNSViewController: UIViewController {
    var endImage: UIImage = UIImage()
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var endImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        endImageView.image = endImage
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func post(_ sender: Any) {
        do{
            let acticityViewController = UIActivityViewController(activityItems: [endImage], applicationActivities: nil)
            present(acticityViewController, animated: true, completion: nil)
        }catch let error{
            print(error)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

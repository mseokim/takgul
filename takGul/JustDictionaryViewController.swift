//
//  JustDictionaryViewController.swift
//  takGul
//
//  Created by 김민서 on 2017. 8. 16..
//  Copyright © 2017년 김민서. All rights reserved.
//

import UIKit
import SWXMLHash
import Alamofire
import AVFoundation

class JustDictionaryViewController: UIViewController, UITableViewDelegate, XMLParserDelegate {

    var vocaURL:String = server!
    var voca:String = searchWhat!
    
    @IBOutlet weak var voca_E: UILabel!
    @IBOutlet weak var voca_K: UILabel!
    @IBOutlet weak var stickBottom_2: NSLayoutConstraint!
    @IBOutlet weak var lblVoca: UILabel!
    @IBOutlet weak var lblMean: UITextView!
    @IBOutlet weak var lblLink: UILabel!
    @IBOutlet weak var stickBottom: NSLayoutConstraint!
    var isOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stickBottom.constant = -230
        
        
        print(vocaURL)
        print(voca)
        voca_K.text! = voca
        let parameter = [
            "word" : "\"" + voca + "\""
        ]
        
        Alamofire.request(vocaURL + "/parse/word?=", method: .get, parameters: parameter).responseJSON {
            response in
            
            if let result = response.result.value {
                let jsonData = result as! NSDictionary
                
                if((jsonData.value(forKey: "status") as! NSNumber)) == 200 {
                    let string = jsonData.value(forKey: "word") as! NSString
                    
                    var xml = SWXMLHash.parse(String(string))
                    print(xml)
                    self.lblVoca.text! = (xml["item"]["title"].element?.text)!
                    self.lblMean.text! = (xml["item"]["description"].element?.text)!
                    self.lblLink.text! = (xml["item"]["link"].element?.text)!
                    
                } else {
                    self.myAlert("경고", message: "없는 단어입니다")
                }
            }
        } // 단어 뜻

        Alamofire.request(vocaURL + "/parse/translate?=", method: .get, parameters: parameter).responseJSON {
            response in
            
            if let result = response.result.value {
                let jsonData = result as! NSDictionary
                
                if((jsonData.value(forKey: "status") as! NSNumber)) == 200 {
                    let string = jsonData.value(forKey: "word") as! NSString
                    print(string)
                    self.voca_E.text! = String(string)
                } else {
                    self.myAlert("경고", message: "없는 단어입니다")
                }
            }
        } // 단어 번역
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBack(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "Main View") as! MainViewController
        self.present(newViewController, animated: true, completion: nil)
    }

    func myAlert(_ title : String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func push(_ sender: Any) {
        isOn = !isOn
        if isOn {
        stickBottom_2.constant = 230
        stickBottom.constant = 0
        UIView.animate(withDuration: 0.8, animations: {
            self.view.layoutIfNeeded()
        })
        } else {
            stickBottom_2.constant = 0
            stickBottom.constant = -230
            UIView.animate(withDuration: 0.8, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @IBAction func btnSound_K(_ sender: Any) {
        let synthesizer = AVSpeechSynthesizer()
        
        let utterance = AVSpeechUtterance(string: voca_K.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        utterance.rate = 0.4
        
        synthesizer.speak(utterance)
    }
    
    @IBAction func btnSound_E(_ sender: Any) {
        let synthesizer = AVSpeechSynthesizer()
        
        let utterance = AVSpeechUtterance(string: voca_E.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.4
        
        synthesizer.speak(utterance)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

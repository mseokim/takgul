//
//  MainViewController.swift
//  takGul
//
//  Created by 김민서 on 2017. 8. 7..
//  Copyright © 2017년 김민서. All rights reserved.
//

import UIKit
import Alamofire
var server:String!
var searchWhat:String!
var searchHistory = [String]()

var flag = 0

class MainViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var lblSubDic: UILabel!
    @IBOutlet weak var lblSubRank: UILabel!
    @IBOutlet weak var lblSubHis: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    
    
    
    let server_ip = "http://115.68.218.71:6974"
    
    var server_url:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblSubDic.text! = "당신이 가장 많이 번역한 단어와\n즐겨찾기를 설정한 단어를 볼 수 있습니다."
        lblSubRank.text! = "사람들이 일간, 주간 단위로 가장 많이\n검색한 단어를 볼 수 있습니다."
        lblSubHis.text! = "당신이 검색했던 단어를\n볼 수 있습니다."
        
        searchBar.returnKeyType = UIReturnKeyType.done
        self.searchBar.delegate = self
        
        btnDesign(button: btn1)
        btnDesign(button: btn2)
        btnDesign(button: btn3)
        btnDesign(button: btn4)
        btnDesign(button: btn5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    } // 검색하기 시작
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
        self.searchBar.text = ""
        self.searchBar.showsCancelButton = false
    } // 취소누를때

    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
        searchWhat = searchBar.text!
        searchHistory.append(searchWhat)
        
        server_url = server_ip
        
        server = server_url
        
        print("URL : \(server!)")
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "dictionary") as! JustDictionaryViewController
        self.present(newViewController, animated: true, completion: nil)
        
        if flag <= 4 {
            flag += 1
        } else {
            flag = 1
        }
        print(flag)
        
        if flag == 1 {
            btn1.setTitle(searchBar.text!, for: .normal)
        } else if flag == 2 {
            btn2.setTitle(searchBar.text!, for: .normal)
        } else if flag == 3 {
            btn3.setTitle(searchBar.text!, for: .normal)
        } else if flag == 4 {
            btn4.setTitle(searchBar.text!, for: .normal)
        } else if flag == 5 {
            btn5.setTitle(searchBar.text!, for: .normal)
        }
        
    } // 검색버튼 누를때
    
    func btnDesign(button : UIButton) {
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0
        button.backgroundColor = UIColor(hex: 0xFB5082, a:1.0)
        button.setTitleColor(UIColor.white, for: .normal)
        }
    
    @IBAction func testbt(_ sender: Any) {
        
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

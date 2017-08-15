//
//  MainViewController.swift
//  takGul
//
//  Created by 김민서 on 2017. 8. 7..
//  Copyright © 2017년 김민서. All rights reserved.
//

import UIKit
import Alamofire
import Kanna

class MainViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var lblSubDic: UILabel!
    @IBOutlet weak var lblSubRank: UILabel!
    @IBOutlet weak var lblSubHis: UILabel!
    
    let server_url = "http://115.68.218.71:6974/parse/word?word="
    var word = "\"두부\""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblSubDic.text! = "당신이 가장 많이 번역한 단어와\n즐겨찾기를 설정한 단어를 볼 수 있습니다."
        lblSubRank.text! = "사람들이 일간, 주간 단위로 가장 많이\n검색한 단어를 볼 수 있습니다."
        lblSubHis.text! = "당신이 검색했던 단어를\n볼 수 있습니다."
        
        searchBar.returnKeyType = UIReturnKeyType.done
        self.searchBar.delegate = self
        

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
    } // 검색버튼 누를때
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

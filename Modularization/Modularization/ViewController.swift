//
//  ViewController.swift
//  Modularization
//
//  Created by 张文博 on 2022/6/1.
//

import UIKit
import SnapKit
import Then
import HomeModule
import NetCore

class ViewController: UIViewController {
    // MARK: -
    lazy var redView: UIView = {
        let redView = UIView()
        redView.backgroundColor = .red
        return redView
    }()
    
    lazy var label = UILabel().then {
        $0.textColor = UIColor.black
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.textAlignment = .left
        $0.text = "default text"
    }
    
     lazy var searchBtn = UIButton().then {
        $0.setImage(UIImage(named: "classify_search_btn"), for: .normal)
        $0.setTitle("按钮", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        $0.titleLabel?.textAlignment = .left
        $0.backgroundColor = .green
        $0.addTarget(self, action: #selector(searchClick), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(redView)
        view.addSubview(searchBtn)

        redView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(10)
            make.top.equalTo(view).offset(10)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
        searchBtn.snp.makeConstraints { make in
            make.left.equalTo(view).offset(10)
            make.top.equalTo(redView.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 100, height: 50))
        }
        
    }
    
    @objc func searchClick(){
        print("搜索点击")
        NetCore().request()
        NetCore().openRequest()
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)

        
    }



}


//
//  ViewController.swift
//  ActivityCenter
//
//  Created by hph on 2019/4/23.
//  Copyright © 2019年 hph. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var userPwd: UITextField!
    @IBAction func login(_ sender: Any) {
        getUser(u:userName.text!,p:userPwd.text!)
    }
    
    @IBAction func loginButton(_ sender: Any) {
    }
    
    @IBAction func registerButton(_ sender: Any) {
    }
    @IBOutlet weak var p1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getUser( u:String,p:String) {
        let Queue = DispatchQueue(label:"queue",attributes:[])
        BmobUser.loginWithUsername(inBackground: u, password: p)
        BmobUser.loginInbackground(withAccount: u, andPassword: p) { (user, error) in
            DispatchQueue.main.async {
                if user != nil{
                    let alertController = UIAlertController(title: "系统提示", message: "登陆成功", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "确定", style: .default, handler:{action in })
                    alertController.addAction(okAction)
                    self.present(alertController,animated: true, completion: nil)
                }
                else {
                    let alertController = UIAlertController(title: "系统提示", message: "登陆失败,用户名或者密码错误", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "确定", style: .default, handler:{action in })
                    alertController.addAction(okAction)
                    self.present(alertController,animated: true, completion: nil)
                }
            }
        }
        Queue.async {
            
        }
    }

}


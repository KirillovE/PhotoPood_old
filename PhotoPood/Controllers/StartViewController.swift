//
//  StartViewController.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 15.09.2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    var isAuthorized = false
    
    // MARK: - Жизненный цикл View controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isAuthorized = UserDefaults.standard.bool(forKey: "isAuthorized")
        setAppearance()
        showWithAnimation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        isAuthorized = UserDefaults.standard.bool(forKey: "isAuthorized")
        if isAuthorized {
            loginButton.isHidden = true
        }
    }
    
    // MARK: - Настройка внешнего вида экрана
    
    /// Настраивает внешний вид элементов представления
    fileprivate func setAppearance() {
        loginButton.layer.cornerRadius = loginButton.frame.height / 4
        titleLabel.alpha = 0
        loginButton.alpha = 0
    }
    
    /// Показывает название приложения и кнопку входа с анимацией
    private func showWithAnimation() {
        let animationsHelper = AnimationsHelper()
        
        animationsHelper.pullView(titleLabel, fromOutsideOf: view, withDirection: .down)
        
        if !isAuthorized {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                animationsHelper.pullView(self.loginButton, fromOutsideOf: self.view, withDirection: .up)
            }
        }
    }
    
}
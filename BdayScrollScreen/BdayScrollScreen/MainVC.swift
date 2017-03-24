//
//  MainVC.swift
//  BdayScrollScreen
//
//  Created by Appinventiv on 22/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var phoneContactsButton: UIButton!
    @IBOutlet weak var overButtonView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    var facebookVC : FacebookVC!
    var phoneContactsVC : PhoneContactsVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadViewControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func loadViewControllers(){
        
        self.facebookButton.isSelected = true

        scrollView.delegate = self
        scrollView.isPagingEnabled = true

        let storyBoardScene = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        //register FacebookVC
        
        facebookVC = (storyBoardScene.instantiateViewController(withIdentifier : "FacebookVCID") as? FacebookVC)!
        scrollView.addSubview(facebookVC.view)
        addChildViewController(facebookVC)
        facebookVC.didMove(toParentViewController: self)
        
        //register PhoneContactsVC
        
        phoneContactsVC = (storyBoardScene.instantiateViewController(withIdentifier : "PhoneContactsVCID") as? PhoneContactsVC)!
        scrollView.addSubview(phoneContactsVC.view)
        addChildViewController(phoneContactsVC)
        phoneContactsVC.didMove(toParentViewController: self)
        
        //MARK: All Buttons Targets
        
        facebookButton.addTarget(self, action: #selector(facebookButtonTapped(_ : ) ), for: .touchUpInside)
        
        phoneContactsButton.addTarget(self, action: #selector(phoneContactsButtonTapped(_ : ) ), for: .touchUpInside)
        
    }
    
    override func viewWillLayoutSubviews() {
        
        //change origin x
        
        scrollView.contentSize = CGSize(width: self.view.bounds.width * CGFloat(2), height : scrollView.frame.height )
        
        scrollView.frame.size.width =  self.view.frame.width
        
        phoneContactsVC.view.frame = CGRect(x: self.view.frame.width,
                                            y: 0,
                                            width: self.view.frame.width,
                                            height: self.scrollView.frame.size.height)
        
        facebookVC.view.frame.size.width = scrollView.frame.size.width
        
    }
    
}

extension MainVC : UIScrollViewDelegate	{
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView)	{
        
        let scrollViewOffset = scrollView.contentOffset.x
        
        let divider =  scrollView.frame.size.width / overButtonView.frame.size.width
        
        self.overButtonView.transform = CGAffineTransform(translationX: scrollViewOffset / divider, y: 0)
        
        if scrollViewOffset < 10 {

            self.phoneContactsButton.isSelected = false
            self.facebookButton.isSelected = true

        } else if scrollViewOffset > 324{

            self.facebookButton.isSelected = false
            self.phoneContactsButton.isSelected = true

        }
        
    }
    
}

//MARK: Button Actions
//================

extension MainVC {
    
    public func facebookButtonTapped(_ sender : UIButton)	{
        
        UIView.animate(withDuration: 0.35, delay: 0, animations: {() -> Void in

            self.scrollView.contentOffset.x = 0
            
            self.facebookButton.isSelected = true
            self.phoneContactsButton.isSelected = false

            
      }, completion: nil)
    }
    
    public func phoneContactsButtonTapped(_ sender : UIButton)	{
        
        UIView.animate(withDuration: 0.35, delay: 0, animations: {() -> Void in
            
            self.scrollView.contentOffset.x = self.scrollView.frame.width
            
            self.phoneContactsButton.isSelected = true
            self.facebookButton.isSelected = false
            
        }, completion: nil)
        
    }
    
}

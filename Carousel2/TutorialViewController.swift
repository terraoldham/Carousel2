//
//  TutorialViewController.swift
//  Carousel2
//
//  Created by Terra Oldham on 10/19/14.
//  Copyright (c) 2014 HearsaySocial. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var spinButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 1320, height: 586)
        //scrollView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        // Load the pages that are now on screen
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        pageControl.currentPage = page
        if page == 3 {
            UIView.animateWithDuration(0.4, animations: {
                self.spinButton.alpha = 1
            })
        }
        
    }

}

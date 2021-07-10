//
//  ViewController.swift
//  SwipeImageGallery
//
//  Created by David Yoon on 2021/07/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var pageView: UIPageControl!
    
    var imgGallery = [UIImage] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgGallery.append(UIImage(named: "01.png")!)
        imgGallery.append(UIImage(named: "02.png")!)
        imgGallery.append(UIImage(named: "03.png")!)
        imgGallery.append(UIImage(named: "04.png")!)
        imgGallery.append(UIImage(named: "05.png")!)
        imgGallery.append(UIImage(named: "06.png")!)
        
        
        pageView.numberOfPages = imgGallery.count
        pageView.currentPage = 0
        pageView.pageIndicatorTintColor = UIColor.green
        pageView.currentPageIndicatorTintColor = UIColor.red
        
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
        
        imageView.image = imgGallery[0]
        
    }

    @IBAction func pageViewController(_ sender: UIPageControl) {
        print("current page : \(pageView.currentPage)")
        imageView.image = imgGallery[pageView.currentPage]
        
    }
    
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        imageView.transform = imageView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        print(pageView.currentPage)
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch  swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                print("right")
                if (pageView.currentPage < imgGallery.count){
                    pageView.currentPage += 1
                    imageView.image = imgGallery[pageView.currentPage]
                }
            case UISwipeGestureRecognizer.Direction.right:
                print("left")
                if (pageView.currentPage > 0){
                    pageView.currentPage -= 1
                    imageView.image = imgGallery[pageView.currentPage]
                    
                }
            default:
                break
            }
        }
    }
    
}


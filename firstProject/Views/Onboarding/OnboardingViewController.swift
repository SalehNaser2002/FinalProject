//
//  OnboardingViewController.swift
//  firstProject
//
//  Created by Saleh Naser on 14/12/2022.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    var slides: [OnboardingSlide] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("دخول", for: .normal)
            } else {
                nextBtn.setTitle("التالي", for: .normal)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = [
            OnboardingSlide(title: "خدمات هندسية عامة", description: "يقدم لكم بيتي افضل الاستشارات الهندسية مع افضل الشركات", image: #imageLiteral(resourceName: "pngtree-2-5d-business-building-vector-png-image_4096413-removebg-preview")),
            OnboardingSlide(title: "مقاولات ", description: " بيتي افضل الاستشارات الهندسية مع افضل الشركات", image: #imageLiteral(resourceName: "pngtree-cartoon-wind-city-high-rise-building-city-building-property-png-image_368908-removebg-preview")),
            OnboardingSlide(title: "استشارات هندسية", description: " بيتي افضل الاستشارات الهندسية مع افضل الشركات", image: #imageLiteral(resourceName: "png-clipart-assorted-color-high-rise-buildings-animated-illustration-building-architecture-illustration-building-angle-text-removebg-preview"))
        ]
        pageControl.numberOfPages = slides.count
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "HomeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            //UserDefaults.standard.hasOnboarded = true
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    

}
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}

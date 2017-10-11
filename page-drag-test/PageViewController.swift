//
//  PageViewController.swift
//  page-drag-test
//
//  Created by Michael Ferenduros on 11/10/2017.
//  Copyright © 2017 Michael Ferenduros. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {

    var pages: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self

        pages = (0..<2).map { _ in storyboard!.instantiateViewController(withIdentifier: "ViewController") }
        setViewControllers([pages[0]], direction: .forward, animated: false, completion: nil)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = pages.index(of: viewController), index > 0 {
            return pages[index-1]
        } else {
            return nil
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = pages.index(of: viewController), index+1 < pages.count {
            return pages[index+1]
        } else {
            return nil
        }
    }
}

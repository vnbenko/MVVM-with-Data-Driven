//
//  ViewController.swift
//  MVVM
//
//  Created by Meraki on 06.07.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    private var viewModel: MainViewModelProtocol!
    private var testView: TestView!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MainViewModel()
        createView()
        updateView()
    
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        viewModel.start()
    }
    
    private func createView() {
        testView = TestView()
        testView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        testView.center = self.view.center
        self.view.addSubview(testView)
    }
    
    private func updateView() {
        viewModel.updateViewData = { [weak self] viewData in
            self?.testView.viewData = viewData
        }
    }


}


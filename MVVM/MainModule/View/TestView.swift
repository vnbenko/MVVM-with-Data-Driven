//
//  TestView.swift
//  MVVM
//
//  Created by Meraki on 06.07.2021.
//

import UIKit

class TestView: UIView {

    var viewData: ViewData = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
    lazy var imageView = makeImageView()
    lazy var activityIndicator = makeActivityIndicatorView()
    lazy var titleLabel = makeTitleLabel()
    lazy var descriptionLabel = makeDescriptionLabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch viewData {
        case .initial:
            update(viewData: nil, isHidden: true, turnAnimation: false, isIndicatorHidden: true)
        case .loading(let loading):
            update(viewData: loading, isHidden: false, turnAnimation: true, isIndicatorHidden: false)
        case .success(let success):
            update(viewData: success, isHidden: false, turnAnimation: false, isIndicatorHidden: true)
        case .failure(let failure):
            update(viewData: failure, isHidden: false, turnAnimation: false, isIndicatorHidden: true)
        }
    }
    
    private func update(viewData: ViewData.Data?, isHidden: Bool, turnAnimation: Bool, isIndicatorHidden: Bool) {
        imageView.image = UIImage(named: viewData?.icon ?? "")
        titleLabel.text = viewData?.title
        descriptionLabel.text = viewData?.description
        
        imageView.isHidden = isHidden
        titleLabel.isHidden = isHidden
        descriptionLabel.isHidden = isHidden
        
        activityIndicator.isHidden = isIndicatorHidden
        turnAnimation ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
    
}

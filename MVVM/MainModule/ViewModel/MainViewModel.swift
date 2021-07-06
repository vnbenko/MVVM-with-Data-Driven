import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData) -> ())? { get set }
    func start()
}

final class MainViewModel: MainViewModelProtocol {
    public var updateViewData: ((ViewData) -> ())?
    
    
    init() {
        updateViewData?(.initial)
    }
    
    public func start() {
        //start loading
        updateViewData?(.loading(ViewData.Data(icon: nil,
                                               title: nil,
                                               description: nil)))
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.updateViewData?(.loading(ViewData.Data(icon: "success",
                                                         title: "Hello",
                                                         description: "Loading complete")))
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) { [weak self] in
            self?.updateViewData?(.failure(ViewData.Data(icon: "failure",
                                                         title: "Bad connection",
                                                         description: "Error loading")))
        }

    }
    
    
    
}

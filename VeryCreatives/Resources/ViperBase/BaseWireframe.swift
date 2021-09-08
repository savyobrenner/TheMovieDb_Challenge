//
//  BaseWireframe.swift

import UIKit

protocol WireframeInterface: AnyObject {
    func push(_ viewController: UIViewController, animated: Bool)
    func present(_ viewController: UIViewController, animated: Bool)
    func presentOnNavigation(_ viewController: UIViewController, animated: Bool)
    func presentOverContext(_ viewController: UIViewController, animated: Bool, modalPresentation: Bool)
    func pop(animated: Bool)
    func popToRoot(animated: Bool)
    func dismiss(animated: Bool)
}

class BaseWireframe {
    
    weak var viewController: UIViewController?
    
    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    class func setupTabBarAppearenceFor(_ viewController: UIViewController,
                                        title: String,
                                        selectedImage: UIImage!,
                                        unselectedImage: UIImage!) {
        viewController.tabBarItem.image = unselectedImage.withRenderingMode(.automatic)
        viewController.tabBarItem.selectedImage = selectedImage.withRenderingMode(.automatic)
        viewController.tabBarItem.title = title
        viewController.tabBarItem.accessibilityLabel = title
    }
}

extension BaseWireframe: WireframeInterface {
    
    func push(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = true
        self.viewController?.navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func present(_ viewController: UIViewController, animated: Bool) {
        viewController.modalPresentationStyle = .fullScreen
        self.viewController?.present(viewController, animated: animated, completion: nil)
    }
    
    func presentOnNavigation(_ viewController: UIViewController, animated: Bool) {
        self.viewController?.navigationController?.present(viewController, animated: animated, completion: nil)
    }
    
    func presentOverContext(_ viewController: UIViewController, animated: Bool, modalPresentation: Bool) {
        
        if #available(iOS 13.0, *) {
            viewController.modalPresentationStyle = (viewController is UITabBarController) ?  .fullScreen : .pageSheet
            viewController.modalTransitionStyle = .coverVertical
            viewController.isModalInPresentation = modalPresentation
        } else {
            // Fallback on earlier versions
            viewController.modalPresentationStyle = .overCurrentContext
            viewController.modalTransitionStyle = .crossDissolve
        }
        self.viewController?.present(viewController, animated: animated, completion: nil)
    }
    
    func pop(animated: Bool) {
        self.viewController?.navigationController?.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool) {
        self.viewController?.navigationController?.popToRootViewController(animated: animated)
    }
    
    func dismiss(animated: Bool) {
        self.viewController?.dismiss(animated: animated, completion: nil)
    }
    
}

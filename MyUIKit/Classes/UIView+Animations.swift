//
//  UIView+Animations.swift
//  ARIUIKit
//
//  Created by Seraphin DESUMEUR on 28/08/2018.
//  Copyright © 2018 Seraphin DESUMEUR. All rights reserved.
//

import UIKit

extension UIView {
    
    fileprivate typealias Translations = (x: CGFloat, y: CGFloat)
    fileprivate typealias BounceOptions = (damping: CGFloat, velocity: CGFloat)
    
    public enum AnimationDirection {
        
        case left, right, top, bottom
        
        fileprivate func getTranslations() -> Translations {
            var translationX: CGFloat = 0.0
            var translationY: CGFloat = 0.0
            switch self {
            case .top: translationY = -150.0
            case .bottom: translationY = 150.0
            case .left: translationX = -150.0
            case .right: translationX = 150.0
            }
            return (translationX, translationY)
        }
    }
    
    public enum AnimationBounce {
        
        case none, low, high
        
        fileprivate func getBounceOptions() -> BounceOptions {
            switch self {
            case .none:
                return (1, 1)
            case .low:
                return (0.7, 1)
            case .high:
                return (0.5, 1)
            }
        }
    }
    
    public enum AnimationDuration {
        
        case `default`, fast, slow, immediate
        
        fileprivate func getTimeInterval() -> TimeInterval {
            switch self {
            case .default: return 0.5
            case .fast: return 0.3
            case .slow: return 1
            case .immediate: return 0
            }
        }
    }
    
    /// Show animation with a discrete fade-in effect.
    public func show(from direction: AnimationDirection = .bottom,
                     duration: AnimationDuration = .default,
                     with bounce: AnimationBounce = .low,
                     delay: AnimationDuration = .immediate,
                     completion: ((Bool) -> Void)? = nil) {
        let translation = direction.getTranslations()
        let bounceOptions = bounce.getBounceOptions()
        isHidden = false
        alpha = 0.6
        transform = transform.translatedBy(x: translation.x, y: translation.y)
        UIView.animate(withDuration: duration.getTimeInterval(),
                       delay: delay.getTimeInterval(),
                       usingSpringWithDamping: bounceOptions.damping,
                       initialSpringVelocity: bounceOptions.velocity,
                       options: .curveEaseInOut,
                       animations: { [weak self] in
                        
                        guard let strongSelf = self else { return }
                        
                        strongSelf.alpha = 1
                        strongSelf.transform = .identity
            }, completion: completion)
    }
    
    /// Bounce animation with a discrete fade-out effect.
    public func hide(to direction: AnimationDirection = .top,
                     duration: AnimationDuration = .default,
                     with bounce: AnimationBounce = .low,
                     delay: AnimationDuration = .immediate,
                     completion: ((Bool) -> Void)? = nil) {
        let translations = direction.getTranslations()
        let bounceOptions = bounce.getBounceOptions()
        alpha = 1
        UIView.animate(withDuration: duration.getTimeInterval(),
                       delay: delay.getTimeInterval(),
                       usingSpringWithDamping: bounceOptions.damping,
                       initialSpringVelocity: bounceOptions.velocity,
                       options: .curveEaseInOut,
                       animations: { [weak self] in
                        guard let strongSelf = self else { return }
                        strongSelf.alpha = 0
                        strongSelf.transform =
                            strongSelf
                                .transform
                                .translatedBy(x: translations.x, y: translations.y)
            }, completion: { [weak self] finished in
                guard let strongSelf = self else { return }
                completion?(finished)
                strongSelf.isHidden = true
        })
    }
    
    /// Fade in animation.
    public func fadeIn(duration: AnimationDuration = .default,
                       delay: AnimationDuration = .immediate,
                       completion: ((Bool) -> Void)? = nil) {
        isHidden = false
        alpha = 0
        UIView.animate(withDuration: duration.getTimeInterval(),
                       delay: delay.getTimeInterval(),
                       options: .curveEaseIn,
                       animations: { [weak self] in
                        self?.alpha = 1.0
            }, completion: completion)
    }
    
    /// Fade out animation.
    public func fadeOut(duration: AnimationDuration = .default,
                        delay: AnimationDuration = .immediate,
                        completion: ((Bool) -> Void)? = nil) {
        isHidden = false
        UIView.animate(withDuration: duration.getTimeInterval(),
                       delay: delay.getTimeInterval(),
                       options: .curveEaseIn,
                       animations: { [weak self] in
                        self?.alpha = 0.0
            }, completion: { [weak self] finished in
                self?.isHidden = false
                completion?(finished)
        })
    }
    
    /// Pop animation.
    public func pop(duration: AnimationDuration = .default,
                    delay: AnimationDuration = .immediate,
                    with bounce: AnimationBounce = .low,
                    completion: ((Bool) -> Void)? = nil) {
        let bounceOptions = bounce.getBounceOptions()
        isHidden = false
        transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration: duration.getTimeInterval(),
                       delay: delay.getTimeInterval(),
                       usingSpringWithDamping: bounceOptions.damping,
                       initialSpringVelocity: bounceOptions.velocity,
                       options: .curveEaseInOut,
                       animations: { [weak self] in
                        guard let strongSelf = self else { return }
                        strongSelf.transform = .identity
            }, completion: completion)
    }
    
    /// Depop animation.
    public func dePop(duration: AnimationDuration = .default,
                      delay: AnimationDuration = .immediate,
                      with bounce: AnimationBounce = .low,
                      completion: ((Bool) -> Void)? = nil)  {
        let bounceOptions = bounce.getBounceOptions()
        UIView.animate(withDuration: duration.getTimeInterval(),
                       delay: delay.getTimeInterval(),
                       usingSpringWithDamping: bounceOptions.damping,
                       initialSpringVelocity: bounceOptions.velocity,
                       options: .curveEaseInOut,
                       animations: { [weak self] in
                        guard let strongSelf = self else { return }
                        strongSelf.transform =
                            strongSelf
                                .transform
                                .scaledBy(x: 0, y: 0)
            }, completion: { [weak self] finished in
                guard let strongSelf = self else { return }
                strongSelf.isHidden = true
                completion?(finished)
        })
    }
    
    /// Shake animation, please ensure view has layout before call this animation.
    public func shake(duration: AnimationDuration = .fast,
                      with bounce: AnimationBounce = .low,
                      completion: ((Bool) -> Void)? = nil)  {
        let midX = center.x
        let midY = center.y
        
        var repeatCount: Float
        switch bounce {
        case .none: repeatCount = 0
        case .low: repeatCount = 4
        case .high: repeatCount = 8
        }
        
        var durationTimeInterval: TimeInterval
        switch duration {
        case .default: durationTimeInterval = 0.1
        case .fast: durationTimeInterval = 0.05
        case .slow: durationTimeInterval = 0.2
        case .immediate: durationTimeInterval = 0
        }
        let basicAnimationKey = "position"
        let animation = CABasicAnimation(keyPath: basicAnimationKey)
        animation.duration = durationTimeInterval
        animation.repeatCount = repeatCount
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: midX - 10, y: midY)
        animation.toValue = CGPoint(x: midX + 10, y: midY)
        layer.add(animation, forKey: basicAnimationKey)
    }
}

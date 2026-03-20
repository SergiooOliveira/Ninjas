//
//  Extensions.swift
//  Ninjas
//
//  Created by Sérgio Oliveira on 20/03/2026.
//

import Foundation

func -(left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func +(left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func *(point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

func /(point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / scalar, y: point.y / scalar)
}

extension CGPoint {
    func normalize() -> CGPoint {
        let lenght = sqrt(pow(x, 2) + pow(y, 2))
        return self / lenght
    }
}

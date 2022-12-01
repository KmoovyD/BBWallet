//
//  UIScreen.swift
//  BBWallet
//
//  Created by Leo Friskey on 24.11.2022.
//

import SwiftUI


extension UIScreen {
    static let height = UIScreen.main.bounds.height
    static let width = UIScreen.main.bounds.width
}

/// Возвращает адаптивную ширину для объекта
/// - Parameter widthObject: значение ширины из фигмы
/// - Returns: адаптивная ширина, которая работает исправно на любом девайсе (!iOS)
public func flexWidth(_ widthObject: Double) -> Double {
  let value = 393 / widthObject // iphone 14 pro
  return width / value
}
/// Возвращает адаптивную высоту для объекта
public func flexHeight(_ heightObject: Double)->Double {
  let value = 852 / heightObject // iphone 14 pro
  return height / value
}

//
//  TemperatureFormData.swift
//  TheBestConverter
//
//  Created by Brian Sipple on 10/12/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import Foundation
import Combine


final class TemperatureFormData: ObservableObject {
    var options: [TemperatureOption] = [
        .kelvin,
        .celsius,
        .fahrenheit,
    ]
    
    
    @Published var topConversionOption: TemperatureOption = .kelvin {
        didSet { topConversionValueChanged() }
    }
    
    @Published var bottomConversionOption: TemperatureOption = .celsius {
        didSet { bottomConversionValueChanged() }
    }
    
    
    @Published var topConversionText: String = "0" {
        didSet { topConversionValueChanged() }
    }
    
    @Published var bottomConversionText: String = "0" {
        didSet { bottomConversionValueChanged() }
    }
}

// MARK: - Computeds
extension TemperatureFormData {
    
    private var topConversionValue: Measurement<UnitTemperature>? {
        guard let topConversionNumber = Double(topConversionText) else { return nil }
        
        return Measurement<UnitTemperature>(
            value: topConversionNumber,
            unit: topConversionOption.unit
        )
    }
    
    private var bottomConversionValue: Measurement<UnitTemperature>? {
        guard let bottomConversionNumber = Double(bottomConversionText) else { return nil }

        return Measurement<UnitTemperature>(
            value: bottomConversionNumber,
            unit: bottomConversionOption.unit
        )
    }
}


// MARK: - Change Handling
extension TemperatureFormData {
        
    private func topConversionValueChanged() {
        let expectedBottomText = topConversionValue != nil ?
            "\(topConversionValue!.converted(to: bottomConversionOption.unit).value)"
            :
            "N/A"
        
        if bottomConversionText != expectedBottomText {
            bottomConversionText = expectedBottomText
        }
    }
    
    
    private func bottomConversionValueChanged() {
        let expectedTopText = bottomConversionValue != nil ?
            "\(bottomConversionValue!.converted(to: topConversionOption.unit).value)"
            :
            "N/A"
        
        if topConversionText != expectedTopText {
            topConversionText = expectedTopText
        }
    }
}

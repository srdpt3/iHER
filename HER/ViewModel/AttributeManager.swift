//
//  AttributeManager.swift
//  HER
//
//  Created by Dustin yang on 4/10/21.
//

import SwiftUI

class AttributeManager: ObservableObject {
    @Published var attributes = SampleData.Attributes
    @Published var selectedAttributeIndex = 0
    @Published var selectedBarIndex = -1
    
    func selectAttribute(item: Attribute) {
        if let attributeIndex = attributes.firstIndex(where: { $0.id == item.id }), selectedAttributeIndex != attributeIndex {
            attributes[selectedAttributeIndex].selected = false
            attributes[attributeIndex].selected = true
            
            if selectedBarIndex != -1 {
                attributes[selectedAttributeIndex].scoreData[selectedBarIndex].selected.toggle()
                selectedBarIndex = -1
            }
            selectedAttributeIndex = attributeIndex
        }
    }
    
    func getScoreDataForSelectedIndex() -> [ScoreData] {
        return attributes[selectedAttributeIndex].scoreData
    }
    
    func selectBar(month: String) {
        if let attributeBarIndex = getScoreDataForSelectedIndex().firstIndex(where: { $0.month == month }) {
            attributes[selectedAttributeIndex].scoreData[attributeBarIndex].selected.toggle()
            
            if selectedBarIndex != -1, selectedBarIndex != attributeBarIndex {
                attributes[selectedAttributeIndex].scoreData[selectedBarIndex].selected = false
            }
            
            selectedBarIndex = attributeBarIndex
        }
    }
    
    func getSelectedScoreMonth() -> String {
        var month = ""
        
        if selectedBarIndex != -1 {
            month = attributes[selectedAttributeIndex].scoreData[selectedBarIndex].month
        }
        return month
    }
    
    func getIsSelectedMonthSelected() -> Bool {
        var selected = false
        
        if selectedBarIndex != -1 {
            selected = attributes[selectedAttributeIndex].scoreData[selectedBarIndex].selected
        }
        return selected
    }
    
    
}

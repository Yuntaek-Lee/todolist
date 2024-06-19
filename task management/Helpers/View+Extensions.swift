//
//  View+Extensions.swift
//  task management
//
//  Created by snlcom on 6/6/24.
//

import SwiftUI

// Custom View extension
extension View{
    //Custom Spacers
    @ViewBuilder
    func hSpacing(_ alignment: Alignment) -> some View{
        self
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment: Alignment) -> some View{
        self
            .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: alignment)
    }
    
    /// Checking Two dates are same
    func isSameDate(_ date1: Date, _ date2: Date)-> Bool{
        return Calendar.current.isDate(date1, inSameDayAs: date2)
    }
    
}

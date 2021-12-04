//
//  CircleView.swift
//  FiguresHelperFreeForm
//
//  Created by Russell Gordon on 2021-12-04.
//

import SwiftUI

struct CircleView: View {
    
    // MARK: Stored properties
    @State var providedRadius = ""
    
    // MARK: Computed properties
    
    var radius: Double? {
        
        guard let radius = Double(providedRadius),
              radius > 0
        else {
            return nil
            
        }
        return radius
    }
    // attempts to calculate the area - if it cannot return nil.
    var area: Double?{
        
        // are imputs valid
        // the black radius is a local constant it only exists after the gaurded statement
        guard let radius = radius
        else {
            // imputs not valid, so we cannnot compute the area
            return nil
        }
        
        
        
        return Double.pi * radius * radius
    }
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                DiagramView(image: "circle",
                            horizontalPadding: 50)
                
                SectionLabelView(text: "Radius", variable: "r")
                
                // Input: Radius
                TextField("Radius",
                          text: $providedRadius,
                          prompt: Text("Numeric value greater than 0"))
                
                // Termary colditional operator
                // It' essentially a one line if-else statemnt
                // CONDITION ? EXPRESSION-1 : EXPRESSION-2
                // CONDITION is: radius == nil
                // EXPRESSION-1 happens when TRUE: Colour.red
                // EXPRESSION-2 happens when FALSE: Colour.primary
                    .foregroundColor(radius == nil ? Color.blue :  Color.primary)
                
                
                SectionLabelView(text: "Area", variable: "")
                
                // Output: Area
                OutputValueView(value: area, suffix: "square units")
                
            }
            
        }
        .navigationTitle("Circle")
        .padding()
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CircleView()
        }
    }
}

//
//  SwaggerScrollContentView.swift
//  
//
//  Created by Christian Hoock on 02.03.23.
//

import SwiftUI

@available(iOS 16.0, *)
struct SwaggerScrollContentView: View {
    
    var coordinateSpace: CoordinateSpace
    var frameChangeCallback: ((_ frame: CGRect) -> Void)? = nil
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

@available(iOS 16.0, *)
struct SwaggerScrollContentView_Previews: PreviewProvider {
    static var previews: some View {
        SwaggerScrollContentView(coordinateSpace: .named("SwagSpace"))
    }
}

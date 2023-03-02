//
//  SwaggerScrollContentView.swift
//  
//
//  Created by Christian Hoock on 02.03.23.
//

import SwiftUI

@available(iOS 16.0, *)
struct SwaggerScrollContentView<Content: View>: View {
  
  var coordinateSpace: CoordinateSpace
  var frameChangeCallback: ((_ frame: CGRect) -> Void)? = nil
  
  @ViewBuilder var content: () -> Content
  
  var body: some View {
    content()
      .frameChanged { rect in
        frameChangeCallback?(rect)
      }
  }
}

@available(iOS 16.0, *)
struct SwaggerScrollContentView_Previews: PreviewProvider {
  static var previews: some View {
    SwaggerScrollContentView(coordinateSpace: .named("SwagSpace")) {
      VeganIpsumView()
    }
  }
}

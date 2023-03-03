//
//  ConditionalMaskModifier.swift
//  
//
//  Created by Christian Hoock on 03.03.23.
//

import SwiftUI

@available(iOS 15.0, *)
struct ConditionalMaskModifier<MaskContent: View>: ViewModifier {
  
  let enabled: Bool
  @ViewBuilder var maskContent: () -> MaskContent
  
  func body(content: Content) -> some View {
    if enabled {
      content
        .mask(
          maskContent
        )
    } else {
      content
    }
  }
}

@available(iOS 15.0, *)
public extension View {
  
  func maskIf<MaskContent>(
    enabled: Bool = false,
    mask: @escaping () -> MaskContent
  ) -> some View where MaskContent: View {
    modifier(
      ConditionalMaskModifier(enabled: enabled, maskContent: mask)
    )
  }
}

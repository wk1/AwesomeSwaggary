//
//  GetFrameModifier.swift
//  
//
//  Created by Christian Hoock on 02.03.23.
//

import SwiftUI

@available(iOS 13.0, *)
struct GetFrameViewModifier: ViewModifier {
  
  var onChange: ((_ rect: CGRect) -> Void)
  
  func body(content: Content) -> some View {
    content
      .background(
        GeometryReader { geo in
          Color.clear.preference(
            key: FramePreferenceKey.self,
            value: geo.frame(in: .local)
          )
        }
      )
      .onPreferenceChange(FramePreferenceKey.self) { rect in
        onChange(rect)
      }
  }
}

@available(iOS 13.0, *)
private extension GetFrameViewModifier {
  struct FramePreferenceKey: SwiftUI.PreferenceKey {
    static var defaultValue: CGRect { .zero }
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
      // no need
    }
  }
}

@available(iOS 13.0, *)
public extension View {
  func frameChanged(
    onChange: @escaping ((_ rect: CGRect) -> Void)
  ) -> some View {
    modifier(
      GetFrameViewModifier(onChange: onChange)
    )
  }
}

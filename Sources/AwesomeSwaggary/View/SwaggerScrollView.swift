//
//  StupidSexyScrollView.swift
//  
//
//  Created by Christian Hoock on 02.03.23.
//

import SwiftUI

@available(iOS 16.0, *)
public struct SwaggerScrollView<Content: View>: View {
  
  var axes: Axis.Set = [.vertical]
  var showsIndicators = true
  
  @State private var currentFrame: CGRect = .zero
  @State private var currentContentFrame: CGRect = .zero
  @ViewBuilder var content: () -> Content
  
  var scrollAction: ((_ offset: CGPoint, _ maxOffset: CGPoint) -> Void)?
  
  public init(axes: Axis.Set = [.vertical], showsIndicators: Bool = true,  content: @escaping () -> Content) {
    self.content = content
  }
  
  var offset: CGPoint {
    .init(x: -currentContentFrame.origin.x, y: -currentContentFrame.origin.y)
  }
  
  var maxOffset: CGPoint {
    .init(
      x: currentContentFrame.width - currentFrame.width,
      y: currentContentFrame.height - currentFrame.height
    )
  }
  
  private let coordinateSpaceName = UUID()
  
  public var body: some View {
    ScrollView(axes, showsIndicators: showsIndicators) {
      content()
        .frameChanged(coordinateSpace: .named(coordinateSpaceName)) { rect in
          currentContentFrame = rect
          scrollAction?(offset, maxOffset)
        }
    }
    .coordinateSpace(name: coordinateSpaceName)
//    .padding([.top, .bottom], 1) // this will prevent the scrollview to extend under the safe area
    .clipped() // this will prevent the scrollview to extend under the safe area
    .frame(minHeight: 0, maxHeight: currentContentFrame.height)
    .scrollDisabled(currentContentFrame.height <= currentFrame.height )
    .frameChanged(coordinateSpace: .named(coordinateSpaceName)) { rect in
      currentFrame = rect
    }
  }
}

@available(iOS 16.0, *)
extension SwaggerScrollView {
  public func onScroll(perform action: @escaping ((_ offset: CGPoint, _ maxOffset: CGPoint) -> Void)) -> Self {
    var copy = self
    copy.scrollAction = action
    return copy
  }
}

@available(iOS 16.0, *)
struct SwaggerScrollView_Previews: PreviewProvider {
  static var previews: some View {
    SwaggerScrollView {
      VeganIpsumView.long
    }
    .onScroll { offset, maxOffset in
      print("⚙️ scroll offset: \(offset)")
      print("🔚 max scroll offset: \(maxOffset)")
    }
    
    VStack(spacing: 0) {
      SwaggerScrollView {
        VeganIpsumView.long
          .padding([.leading, .trailing])
      }
      Spacer(minLength: 700)
    }
  }
}

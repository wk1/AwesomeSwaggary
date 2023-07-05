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
  
  var verticalOverflow: Bool {
    round(currentContentFrame.height) > round(currentFrame.height)
  }
  
  private let coordinateSpaceName = UUID()
  
  var maskEnabled: Bool = false
  var maskLength: CGFloat = 100.0
  var maskTriggerLength: CGFloat = 10.0
  var maskEdges: Edge.Set = .vertical
  
  public var body: some View {
    ScrollView(axes, showsIndicators: showsIndicators) {
      content()
        .frameChanged(coordinateSpace: .named(coordinateSpaceName)) { rect in
          currentContentFrame = rect
          scrollAction?(offset, maxOffset)
        }
    }
    .coordinateSpace(name: coordinateSpaceName)
    .frame(minHeight: 0, maxHeight: currentContentFrame.height)
    .scrollDisabled(!verticalOverflow)
    .frameChanged(coordinateSpace: .named(coordinateSpaceName)) { rect in
      currentFrame = rect
    }
    .maskIf(enabled: maskEnabled && verticalOverflow) {
      VStack(spacing: 0) {
        if maskEdges.contains(.top) {
          ZStack {
            gradient
              .scaleEffect(y: -1)
            Color.black
              .frame(height: maskLength)
              .opacity(topOpacity)
          }
        }
        Color.black
          .frame(maxWidth: .infinity, maxHeight: .infinity)
        if maskEdges.contains(.bottom) {
          ZStack {
            gradient
            Color.black
              .frame(height: maskLength)
              .opacity(bottomOpacity)
          }
        }
      }
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
extension SwaggerScrollView {
  public func fade(edges: Edge.Set = .vertical, length: CGFloat, triggerLength: CGFloat) -> Self {
    var copy = self
    copy.maskEnabled = true
    copy.maskLength = length
    copy.maskTriggerLength = triggerLength
    copy.maskEdges = edges
    
    return copy
  }
  
  var topOpacity: CGFloat {
    let value = min(1, max(0, 1 - (offset.y/maskTriggerLength)))
    print("topOpacity: \(value)")
    return value
  }
  
  var bottomOpacity: CGFloat {
    let justifiedVerticalOffset = offset.y - (maxOffset.y - maskTriggerLength)
    let fixedVerticalOffset: CGFloat = min(maskTriggerLength, max(0, justifiedVerticalOffset))
    
    let value = min(1, max(0, (fixedVerticalOffset/maskTriggerLength)))
    print("bottomOpacity: \(value)")
    return value
  }
  
  var gradient: some View {
    LinearGradient(
      gradient: Gradient(
        stops: [
          .init(color: .clear, location: 0),
          .init(color: .black, location: 1.0)
        ]
      ),
      startPoint: .bottom, endPoint: .top
    )
    .frame(height: maskLength)
  }
}

@available(iOS 16.0, *)
struct SwaggerScrollView_Previews: PreviewProvider {
  
  struct SwaggerScrollViewOffsetDemo: View {
    
    @State private var verticalOffset: CGFloat = 0.0
    @State private var maxVerticalOffset: CGFloat = 0.0
    
    var body: some View {
      SwaggerScrollView {
        VeganIpsumView.long
      }
      .onScroll { offset, maxOffset in
        verticalOffset = offset.y
        maxVerticalOffset = maxOffset.y
      }
      .clipped()
      .background(
        Color(red: verticalOffset/maxVerticalOffset, green: 0.5, blue: 0.5)
      )
    }
  }
  
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
    
    SwaggerScrollViewOffsetDemo()
  }
}

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
  
  let length = 100.0
  let edges: Edge.Set = .vertical
  
  let opacityTolerance: CGFloat = 10.0
  
  var topOpacity: CGFloat {
    let value = min(1, max(0, 1 - (offset.y/opacityTolerance)))
    print("topOpacity: \(value)")
    return value
  }
  
  var bottomOpacity: CGFloat {
    let justifiedVerticalOffset = offset.y - (maxOffset.y - opacityTolerance)
    let fixedVerticalOffset: CGFloat = min(opacityTolerance, max(0, justifiedVerticalOffset))
    
    let value = min(1, max(0, (fixedVerticalOffset/opacityTolerance)))
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
    .frame(height: length)
  }
  
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
    .scrollDisabled(round(currentContentFrame.height) <= round(currentFrame.height))
    .frameChanged(coordinateSpace: .named(coordinateSpaceName)) { rect in
      currentFrame = rect
    }
    .mask {
      VStack(spacing: 0) {
        if edges.contains(.top) {
          ZStack {
            gradient
              .scaleEffect(y: -1)
            Color.black
              .frame(height: length)
              .opacity(topOpacity)
          }
        }
        Color.black
          .frame(maxWidth: .infinity, maxHeight: .infinity)
        if edges.contains(.bottom) {
          ZStack {
            gradient
            Color.black
              .frame(height: length)
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

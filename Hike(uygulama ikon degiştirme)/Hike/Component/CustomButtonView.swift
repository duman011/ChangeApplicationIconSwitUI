//
//  Created by Yaşar Duman on 27.09.2023.
//

import SwiftUI

struct CustomButtonView: View {
  var body: some View {
    ZStack {
      Circle() //Yuvarlak Arkaplan
        .fill(
          LinearGradient(
            colors: [
              .white,
                .customGreenLight,
                .customGreenMedium],
            startPoint: .top,
            endPoint: .bottom)
        )
        
      Circle() //Yuvarlark dış border vermek için
        .stroke(
          LinearGradient(
            colors: [
              .customGrayLight,
              .customGrayMedium],
            startPoint: .top,
            endPoint: .bottom),
          lineWidth: 4)
      
      Image(systemName: "figure.hiking") //Göresel
        .fontWeight(.black)
        .font(.system(size: 30))
        .foregroundStyle(
          LinearGradient(
            colors: [
              .customGrayLight,
              .customGrayMedium],
            startPoint: .top,
            endPoint: .bottom)
        )
    } //: ZSTACK
    .frame(width: 58, height: 58)
  }
}

struct CustomButtonView_Previews: PreviewProvider {
  static var previews: some View {
    CustomButtonView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}

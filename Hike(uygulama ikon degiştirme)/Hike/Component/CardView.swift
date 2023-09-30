//
//  Created by Yaşar Duman on 27.09.2023.
//

import SwiftUI

struct CardView: View {
  // MARK: - PROPERTIES
  
  @State private var imageNumber: Int = 1
  @State private var randomNumber: Int = 1
  @State private var isShowingSheet: Bool = false
  
  // MARK: - FUNCTIONS
  
  func randomImage() {
    print("--- BUTTON WAS PRESSED ---")
    print("Status: Old Image Number = \(imageNumber)")
    
    repeat {//üretilen her random sayı bir öncekiyle aynı ıse tekrardan yeni bir sayı üretir farklı olması için
      randomNumber = Int.random(in: 1...5)
      print("Action: Random Number Generated = \(randomNumber)")
    } while randomNumber == imageNumber
    
    imageNumber = randomNumber
    
    print("Result: New Image Number = \(imageNumber)")
    print("--- THE END ---")
    print("\n")
  }
  
  var body: some View {
    // MARK: - CARD
    
    ZStack {
      CustomBackgroundView()
      
      VStack {
        // MARK: - HEADER
        
        VStack(alignment: .leading) {
          HStack {
            Text("Hiking")
              .fontWeight(.black)
              .font(.system(size: 52))
              .foregroundStyle(
                LinearGradient(
                  colors: [
                    .customGrayLight,
                    .customGrayMedium],
                  startPoint: .top,
                  endPoint: .bottom)
              )
            
            Spacer()
            
            Button {
              // ACTION:
              print("The button was pressed.")
              isShowingSheet.toggle()
            } label: {
              CustomButtonView()
            }
            .sheet(isPresented: $isShowingSheet) {//.sheet ile altan açılır sayfa tasarladık
              SettingsView()
                .presentationDragIndicator(.visible)//açılan sayfadaki sürükleme göstergesini görünür yaptık
                .presentationDetents([.medium, .large])// sayfanın yarıya kadar açılamsını sagladık - medium = %50 large = 100% demek
            }
          }
          
          Text("Fun and enjoyable outdoor activity for friends and families.")
            .multilineTextAlignment(.leading)
            .italic()
            .foregroundColor(.customGrayMedium)
        } //: HEADER
        .padding(.horizontal, 30)
        
        // MARK: - MAIN CONTENT
        
        ZStack {
          CustomCircleView()
          
          Image("image-\(imageNumber)")
            .resizable()
            .scaledToFit()
            .animation(.default, value: imageNumber)
        }
        
        // MARK: - FOOTER
        
        Button {
          // ACTION: Generate a random number
          
          randomImage()
        } label: {
          Text("Explore More")
            .font(.title2)
            .fontWeight(.heavy)
            .foregroundStyle(
              LinearGradient(
                colors: [
                  .customGreenLight,
                  .customGreenMedium
                ],
                startPoint: .top,
                endPoint: .bottom
              )
            )
            .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
        }
        .buttonStyle(GradientButton())
      } //: ZSTACK
    } //: CARD
    .frame(width: 320, height: 570)
  }
}

struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    CardView()
  }
}

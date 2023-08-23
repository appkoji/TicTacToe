//
//  GameView.swift
//  VisionTrapped
//
//  Created by 村田興児 on 2023/06/11.
//

import SwiftUI


// UI displaying Game View
struct GameView : View {
    
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                LazyVGrid(columns: viewModel.columns, spacing: 5) {
                    
                    // draw grids
                    ForEach(0..<9) { i in
                        ZStack {
                            GameSquareView(proxy: geometry)
                            PlayerIndicator(systemImageName: viewModel.moves[i]?.indicator ?? "")
                        }
                        .onTapGesture {
                            viewModel.processPlayerMoves(for: i)
                        }
                    }
                    
                }
                Spacer()
            }
            .disabled(viewModel.isGameboardDisabled)
            .padding()
            .alert(item: $viewModel.alertITem, content: { alertITem in
                Alert(title: alertITem.title,
                      message: alertITem.message,
                      dismissButton: .default(alertITem.buttonTitle, action: {
                    viewModel.resetGame()
                }))
            })
        }
    }
    
}

// UI displaying Game Menu
struct MenuView : View {
    
    var body: some View {
        ForEach(0..<4) { i in
            VStack {
                Spacer()
                
                Spacer()
            }
        }
    }
}

enum Level {
    case easy, medium, hard, expert
}

enum Player {
    case human, computer
}

struct Move {
    let player: Player
    let boardIndex: Int
    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        //GameView()
        MenuView()
    }
}
#endif

struct GameSquareView: View {
    
    var proxy: GeometryProxy
    
    var body: some View {
        Rectangle()
            .cornerRadius(30.0)
            .foregroundColor(.black).opacity(0.9)
            .frame(width: proxy.size.width/3 - 15, height: proxy.size.width/3 - 15)
    }
}

struct PlayerIndicator: View {
    var systemImageName: String
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(.white)
    }
}

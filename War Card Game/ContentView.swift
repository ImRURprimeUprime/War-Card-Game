//
//  ContentView.swift
//  War Card Game
//
//  Created by Allan Wang on 2024-08-23.
//

import SwiftUI

struct ContentView: View {
    // State keyword changes the behavior of the properties
    @State var playerCard = "back"
    @State var CPUCard = "back"
    
    @State var playerScore: Int = 0
    @State var CPUScore: Int = 0
    
    @State var gameOver = false
    
    var body: some View {
    
        ZStack {
            
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(CPUCard)
                    Spacer()
                }
                Spacer()
                
                if (!gameOver) {
                    Button {
                        deal()
                    } label: {
                        Image("button")
                    }
                }
                
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text(String(CPUScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                Spacer()
                
            }
            if gameOver {
                if (playerScore > CPUScore) {
                    Image("win")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                }
                else {
                    Image("lose")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .ignoresSafeArea()
                }
                
            }
        }
        
    }
    func deal() {
        let playerNum = Int.random(in: 2...14)
        let CPUNum = Int.random(in: 2...14)
        // Randomize the player's card
        playerCard = "card" + String(playerNum)
        // Randomize the CPU's card
        CPUCard = "card" + String(CPUNum)
        // Update the score
        if (playerNum > CPUNum) {
            playerScore += 1
        }
        if (playerNum < CPUNum) {
            CPUScore += 1
        }
        if (playerNum == CPUNum) {
            if (playerScore != 0 && CPUScore != 0) {
                gameOver = true
            }
        }
    }
}

#Preview {
    ContentView()
}

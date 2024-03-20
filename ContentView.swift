//
//  ContentView.swift
//  WarCardGame
//
//  Created by Ojasv Singh on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    
    //property wrapper which changes the attributes of the following property to indicate it powers the visual state. Helps with making the cards do stuff
    @State var playerCard = "card7"
    @State var cpuCard = "card13"
    @State var playerScore = 0
    @State var cpuScore = 0
    
    
    var body: some View {
        
        ZStack{
            Image("background-cloth")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                //creates a button with a label of the image you want
                Button {
                    deal()
                } label: {
                    Image("button")
                }

                
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(/*@START_MENU_TOKEN@*/.bottom, 10.0/*@END_MENU_TOKEN@*/)
                        
                        Text(String(playerScore)) //casts the int into a string
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(/*@START_MENU_TOKEN@*/.bottom, 10.0/*@END_MENU_TOKEN@*/)
                        Text(String(cpuScore)) //casts the int into a string
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                Spacer()
            }
        }

    }
    
    func deal(){
        
        var playerCardNum = Int.random(in: 2...14)
        var cpuCardNum = Int.random(in: 2...14)
        //Randomize the Players card
        playerCard = "card" + String(playerCardNum) //range is double inclusive
        
        //randomize the cpu card
        cpuCard = "card" + String(cpuCardNum)
        
        //update the score depending on who wins
        if playerCardNum > cpuCardNum{
            playerScore  += 1
        }
        else if(playerCardNum < cpuCardNum){
            cpuScore += 1
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

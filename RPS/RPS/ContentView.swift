//
//  ContentView.swift
//  RPS
//
//  Created by George Pogorelov
//

import SwiftUI

struct ContentView: View {
    
    @State var cpuPlay = 0
    @State var playerPlay = ""
    
    @State var cpuScore = 0
    @State var playerScore = 0
    
    //value assigned to indicate which play is being used 
    @State var rock = 1;
    @State var paper = 2;
    @State var sis = 3;
    
    @State var cpuCard = "ques"
    @State var winner = "Begin!"
    
    var body: some View{
        ZStack {
            //backgrond displayed
            
            Image("background-wood-cartoon").resizable()
                .ignoresSafeArea()
            //Main verticle Stack with design
            VStack{
                //displays logo
                Image("rps")
                Spacer()
                HStack{
                    Spacer()
                    Text("CPU Score")
                        .font(.title)
                        .foregroundColor(Color.white)
                    Spacer()
                    Text ("Player Score")
                        .font(.title)
                        .foregroundColor(Color.white)
                    Spacer()
                }
                HStack{
                    Spacer()
                   
                    Text(String(cpuScore))
                        .font(.title)
                        .foregroundColor(Color.white)
                    Spacer()
                    Text(String(playerScore))
                        .font(.title)
                        .foregroundColor(Color.white)
                    Spacer()
                    
                }
                Image(cpuCard)
                    .resizable()
                    .frame(width: 125.0, height: 125.0)
                    .cornerRadius(15)
                
                Text("Cpu's play").foregroundColor(Color.white).padding(5)
                
                
                Text(winner)
                    .font(.title)
                    .foregroundColor(Color.white)
                
                    
                    
                Spacer()
                HStack{
                    //users button for R,P,S
                    Button{
                        round(x:"rock")
                        
                        
                    } label:{
                        
                        Image("rock")
                            .resizable()
                            .frame(width: 125.0, height: 125.0)
                            .cornerRadius(15)
                        
                    }
                    Button{
                        round(x:"paper")
                        
                    } label:{
                        Image("paper")
                            .resizable()
                            .frame(width: 125.0, height: 125.0)
                            .cornerRadius(15)
                    }
                    Button{
                        round(x:"sissors")
                    } label:{
                        Image("sis")
                            .resizable()
                            .frame(width: 125.0, height: 125.0)
                            .cornerRadius(15)
                    }
                    
                    
                }
                Text("Pick One")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
            }
            
        }
        
        
    }
    func round(x:String){
        cpuPlay = Int.random(in: 1...3)
        
        if(cpuPlay==1){
            cpuCard = "rock"
        }else if (cpuPlay == 2){
            cpuCard = "paper"
        } else if (cpuPlay == 3){
            cpuCard = "sis"
        }
        playerPlay =  x
        
        // action when user chooses rock
        if (playerPlay == "rock"){
            if (cpuPlay == 2){
                cpuScore += 1
                winner = "CPU wins round!"
            } else if (cpuPlay == 3){
                playerScore += 1
                winner = "Player wins round!"
            } else{
                winner = "Tie!"
            }
        }
        
        //Action when user chooses paper
        if (playerPlay == "paper"){
            if (cpuPlay == 3){
                cpuScore += 1
                winner = "CPU wins round!"
            } else if (cpuPlay == 1){
                playerScore += 1
                winner = "Player wins round!"
            }else{
                winner = "Tie!"
            }
        }
        
        //Action when user chooses sissors
        if (playerPlay == "sissors"){
            if (cpuPlay == 1){
                cpuScore += 1
                winner = "CPU wins round!"
            } else if (cpuPlay == 2){
                playerScore += 1
                winner = "Player wins round!"
            }else{
                winner = "Tie!"
            }
        }
        
    }
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

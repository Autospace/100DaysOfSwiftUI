//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Alex Mostovnikov on 29/9/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    private let gameOverTitle = "Game over"
    @State private var showingGameOver = false

    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var selectedAnswer = 0
    @State private var score = 0
    private let maxNumberOfQuestions = 8
    @State private var numberOfAskedQuestions = 1

    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 300, endRadius: 700)
                .ignoresSafeArea()

            VStack {
                Spacer()

                Text("Guess the Flag")
                    .foregroundColor(.white)
                    .font(.largeTitle.bold())

                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text("\(countries[correctAnswer])")
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagView(imageName: countries[number])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))

                Spacer()
                Spacer()

                Text("Score \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())

                Spacer()
            }
            .padding()

        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            if scoreTitle == "Wrong" {
                Text("Wrong! That’s the flag of \(countries[selectedAnswer]) \n Your score is \(score)")
            } else {
                Text("Your score is \(score)")
            }
        }
        .alert(gameOverTitle, isPresented: $showingGameOver) {
            Button("Restart", action: restart)
        } message: {
            Text("The game is over. Your score is \(score)")
        }
    }

    func flagTapped(_ number: Int) {
        selectedAnswer = number
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
            score -= 1
        }

        showingScore = true
    }

    func askQuestion() {
        numberOfAskedQuestions += 1
        if numberOfAskedQuestions <= maxNumberOfQuestions {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        } else {
            showingGameOver = true
        }
    }

    func restart() {
        numberOfAskedQuestions = 0
        score = 0
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

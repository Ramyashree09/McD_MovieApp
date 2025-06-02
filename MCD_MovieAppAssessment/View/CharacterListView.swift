//
//  Untitled.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/29/25.
//

import SwiftUI

struct CharacterView : View {
    
    @StateObject var characterviewModel : CharacterViewModel<CharacterListClass, QuotesListClass>
    @State var movieDetail : MovieDetail
    @State var pagination : Bool = true
    
    init(movieDetail: MovieDetail) {
        let characterUseCase = FetchDataUseCase<CharacterListClass>(service: CharacterListClass())
        let quotesUseCase = FetchDataUseCase<QuotesListClass>(service: QuotesListClass())
           _characterviewModel = StateObject(wrappedValue: CharacterViewModel(characterUseCase: characterUseCase, quotesUseCase: quotesUseCase))
        _movieDetail = State(initialValue: movieDetail)
       }
    
    var body: some View {
        if characterviewModel.isLoading {
            LoadingView()
        }
        VStack {
            if characterviewModel.paginationCharcterListArry.count > 0 {
                Spacer()
                Text("Characters of \(movieDetail.name)")
                    .bold().background(Color.cyan)
                
                List(characterviewModel.paginationCharcterListArry, id: \.self) { character in
                    NavigationLink {
                        CharacterQuotesView(characterDetail: character, movieId:  $movieDetail._id, pagination: $pagination)
                    } label: {
                        Text(character.name)
                    }
                    .listRowBackground(AppColors.appTheme)
                    .frame(height: 30)
                }
                .listRowSpacing(10)
                
                if (characterviewModel.paginationCharcterListArry.count) < (characterviewModel.filteredCharacterList.count)  {
                    
                    Button("Load More") {
                        pagination = true
                        Task {
                            await characterviewModel.loadMoreCharacters()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            else {
                VStack {
                    Spacer()
                    Text("No characters Found for \(movieDetail.name) Movie")
                        .font(.title3)
                        .foregroundColor(.gray)
                        .bold()
                    Spacer()
                    Spacer()
                }
                
            }
        }
        .onAppear {
            if pagination {
                Task {
                    await characterviewModel.filterCharacterByID(movieID: movieDetail.id)
                }
            }
        }
    }
}

#Preview {
    let movieDetail = MovieDetail(_id: "5cd95395de30eff6ebccde56", name: "The Lord of the Rings Series", runtimeInMinutes: 558, budgetInMillions: 81, boxOfficeRevenueInMillions : 1120, academyAwardNominations: 2917, academyAwardWins: 30, rottenTomatoesScore: 95)

    CharacterView(movieDetail: movieDetail)
}

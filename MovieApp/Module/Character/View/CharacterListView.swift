//
//  Untitled.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/29/25.
//

import SwiftUI


struct CharacterView : View {
    
    @StateObject var characterViewModel : CharacterViewModel<CharacterService, QuotesService>
    @State var movieDetail : MovieDetail
    @State var pagination : Bool = true
    
    init(movieDetail: MovieDetail) {
        let characterUseCase = FetchDataUseCase<CharacterService>(service: CharacterService())
        let quotesUseCase = FetchDataUseCase<QuotesService>(service: QuotesService())
        _characterViewModel = StateObject(wrappedValue: CharacterViewModel(characterUseCase: characterUseCase, quotesUseCase: quotesUseCase))
        _movieDetail = State(initialValue: movieDetail)
    }
    
    var body: some View {
        if characterViewModel.isLoading {
            modifier(LoadingViewModifier())
        }
        VStack {
            if characterViewModel.paginationCharcterListArry.count > 0 {
                Spacer()
                CharacterListView()
                LoadingView()
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
            characterViewModel.onLoad()
            if pagination {
                Task {
                    await characterViewModel.filterCharacterByID(movieID: movieDetail.id)
                }
            }
        }
    }
}

extension CharacterView {
    @ViewBuilder
    private func CharacterListView() -> some View {
        Text("Characters of \(movieDetail.name)")
            .bold()
        List(characterViewModel.paginationCharcterListArry, id: \.self) { character in
            NavigationLink {
                CharacterQuotesView(characterDetail: character, movieId:  $movieDetail._id, pagination: $pagination)
            } label: {
                Text(character.name)
            }
            .listRowBackground(AppColors.appTheme)
            .frame(height: 30)
        }
        .listRowSpacing(10)
    }
    @ViewBuilder
    private func LoadingView() -> some View {
        if (characterViewModel.paginationCharcterListArry.count) < (characterViewModel.filteredCharacterList.count)  {
            
            Button("Load More") {
                pagination = true
                Task {
                    await characterViewModel.loadMoreCharacters()
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

#Preview {
    let movieDetail = MovieDetail(_id: "5cd95395de30eff6ebccde56", name: "The Lord of the Rings Series", runtimeInMinutes: 558, budgetInMillions: 81, boxOfficeRevenueInMillions : 1120, academyAwardNominations: 2917, academyAwardWins: 30, rottenTomatoesScore: 95)
    
    CharacterView(movieDetail: movieDetail)
}

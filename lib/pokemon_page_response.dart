
/*count:1118
next:"https://pokeapi.co/api/v2/pokemon?offset=20&limit=20"
previous:null
name:"bulbasaur"
url:"https://pokeapi.co/api/v2/pokemon/1/"
name:"ivysaur"
url:"https://pokeapi.co/api/v2/pokemon/2/"
  */

class PokemonListing {
  final int id;
  final String name;

  PokemonListing({required this.id, required this.name});

  factory PokemonListing.fromjson(Map<String, dynamic> json) {
    final name = json['name'];
    final url = json['url'] as String;
    final id = int.parse(url.split('/')[6]);

    return PokemonListing(id: id, name: name);
  }
}

class PokemonPageResponse {
  final List<PokemonListing> pokemonListings;
  final bool canLoadNextPage;

  PokemonPageResponse(
      {required this.pokemonListings, required this.canLoadNextPage});

  factory PokemonPageResponse.fromJson(Map<String, dynamic> json) {
    final canLoadNextPage = json['next'] != null;
    final pokemonListings = (json['result'] as List)
        .map((listingJson) => PokemonListing.fromjson(listingJson))
        .toList();

    return PokemonPageResponse(
        pokemonListings: pokemonListings, canLoadNextPage: canLoadNextPage);
  }
}

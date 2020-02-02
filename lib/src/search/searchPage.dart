import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';

// class LocationSearchDelegate extends SearchDelegate {
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     // TODO: implement buildActions
//     // Actions for app bar

//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = "";
//         },
//       )
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     // TODO: implement buildLeading
//     // The leading icon of the left of the app bar

//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     // Show results from the search

//     return Column();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // TODO: implement buildSuggestions
//     // Show some autocomplete suggestions.

//     final suggestionList = /* Just for now */ [];

//     return ListView.builder(
//       itemBuilder: (context, index) => ListTile(
//         leading: Icon(Icons.location_city),
//         title: Text(suggestionList[index]),
//       ),
//       itemCount: suggestionList.length,
//     );
//   }
// }

// Temporary
class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}

Future<List<Post>> search(String search) async {
  await Future.delayed(Duration(seconds: 2));
  if (search == "empty") return [];
  if (search == "error") throw Error();
  return List.generate(search.length, (int index) {
    return Post(
      "Title : $search $index",
      "Description :$search $index",
    );
  });
}

class SearchPage extends StatelessWidget {
  Function changeStatusColour;
  SearchPage(this.changeStatusColour);

  @override
  Widget build(BuildContext context) {
    changeStatusColour(Colors.transparent, useWhiteStatusBarForeground: false);
    return WillPopScope(
      onWillPop: () {
        changeStatusColour(Colors.transparent);
        Navigator.pop(context);
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchBar<Post>(
              onItemFound: (Post post, int index) {
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.description),
                );
              },
              onSearch: search,
              searchBarStyle: SearchBarStyle(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  borderRadius: BorderRadius.circular(20.0)),
              hintText: "Search for locations!",
              cancellationWidget: Icon(Icons.clear),
            ),
          ),
        ),
      ),
    );
  }
}

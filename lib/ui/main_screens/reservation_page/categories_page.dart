import 'package:btime/bloc/categories_bloc/categories_bloc.dart';
import 'package:btime/bloc/restaurants_bloc/restaurants_bloc.dart';
import 'package:btime/models/categories_model/categories_model.dart';
import 'package:btime/ui/main_screens/reservation_page/organizations_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:btime/bloc/search_bloc/search_bloc.dart';

class ReservationMainPage extends StatelessWidget {
  const ReservationMainPage();

  @override
  Widget build(BuildContext context) {
    final searchBloc = SearchBloc();
    return BlocProvider(
      create: (context) => searchBloc,
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          return state.when(
            initial: () => Center(
              child: Text(''),
            ),
            show: (categories) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, searchState) {
                    return Flex(
                      direction: Axis.vertical,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 25),
                          child: TextField(
                            onChanged: (e) {
                              searchBloc.add(SearchActive(e));
                            },
                            decoration: InputDecoration(
                              hintText: 'Поиск',
                              prefixIcon: Icon(
                                Icons.search,
                              ),
                              focusColor: Colors.black,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                          ),
                        ),
                        if (searchState is SearchEmpty)
                          Flexible(
                            flex: 1,
                            child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.86,
                                        crossAxisSpacing: 0),
                                itemCount: categories.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return _CategoryItem(categories[index]);
                                }),
                          ),
                        if (searchState is SearchResultState)
                          searchState.restaurants.isNotEmpty
                              ? Container(
                                  margin: EdgeInsets.only(top: 42),
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, item) =>
                                        OrganizationItem(
                                            searchState.restaurants[item]),
                                    itemCount: searchState.restaurants.length,
                                  ),
                                )
                              : Center(
                                  child: Text('Ничего не найдено'),
                                )
                      ],
                    );
                  },
                ),
              ),
            ),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
            error: (err) => Center(
              child: Text(err.toString()),
            ),
          );
        },
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  _CategoryItem(this.category);
  final Categories category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<RestaurantsBloc>(context)
            .add(LoadRestaurants(category.id.toString()));
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OrganizationListScreen(
                      categoryId: category.id,
                      categoryName: category.title,
                    )));
      },
      child: Flex(
        direction: Axis.vertical,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/images/mainPage.jpg',
              scale: 1.1,
            ),
            // child: Image.network(fileEndPoint + '${category.image}'),
          ),
          SizedBox(
            height: 6,
          ),
          Expanded(
            flex: 1,
            child: Text(
              category.title,
              style:
                  GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}

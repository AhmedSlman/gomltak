import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomltak/features/market_feature/data/models/all_category_model/category.dart';
import 'package:gomltak/features/market_feature/data/models/all_prodacts_model/datum.dart';
import 'package:gomltak/features/market_feature/data/models/offers_model/offer.dart';
import 'package:gomltak/features/market_feature/data/models/recently_view_model/resently_view_model.dart';
import 'package:gomltak/features/market_feature/data/repositories_impel/category_repo_impel.dart';
import 'package:gomltak/features/market_feature/data/repositories_impel/home_repo_impel.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepoImpel, this.categoryRepoImpel) : super(HomeInitial());
  HomeRepoImpel homeRepoImpel;
  CategoryRepoImpel categoryRepoImpel;
  static HomeCubit get(context) => BlocProvider.of(context);
  List<Datum> listAllProdact = [];
  List<Offer> listAllOffers = [];
  List<Category> listAllCategory = [];
  List<ResentlyViewModel> listRecenclyViews = [];
  List<ResentlyViewModel> uniqueListlistRecenclyViews = [];
  final ScrollController scrollController = ScrollController();

  int pageId = 1;
  bool isLodeMore = false;

  Future fetchProdacts({int pageId = 1}) async {
    emit(HomeFetchAllProdactsLoding());
    homeRepoImpel.fetchAllPordacts(pageId: pageId).then((response) {
      response.fold(
        (faliure) => {
          emit(HomeFetchAllProdactsError()),
        },
        (success) => {
          listAllProdact
              .addAll(success.data?.products?.data as Iterable<Datum>),
          emit(HomeFetchAllProdactsSuccess())
        },
      );
    });
  }

  Future fetchPaginationProdacts() async {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          pageId++;
          fetchProdacts(pageId: pageId);
        }
      },
    );
  }

  Future fetchOffers() async {
    emit(HomeFetchOffersLoding());
    homeRepoImpel.fetchAllOffers().then((response) async {
      response.fold(
        (faliure) => emit(HomeFetchOffersError()),
        (success) {
          listAllOffers.addAll(success.data?.offers as Iterable<Offer>);
          emit(HomeFetchOffersSuccess());
        },
      );
    });
  }

  Future<void> fetchAllCategory() async {
    emit(GetAllCategoryError());
    categoryRepoImpel.fetchAllCategory().then((response) {
      response.fold(
        (failure) => emit(GetAllCategorySuccess()),
        (success) {
          listAllCategory
              .addAll(success.data?.categories as Iterable<Category>);
          // success.data?.categories?.forEach((element) {
          //   element.subCategory?.forEach((element) {
          //     listSubCategory.add(element);
          //     print(element);
          //   });
          // }),
          emit(GetAllCategoryLoding());
        },
      );
    });
  }

  Future<void> recenclyViews({ResentlyViewModel? oneItemrecenclyViews}) async {
    listRecenclyViews.add(oneItemrecenclyViews as ResentlyViewModel);
    uniqueListlistRecenclyViews =
        listRecenclyViews.toSet().toList().reversed.toList();
  }
}

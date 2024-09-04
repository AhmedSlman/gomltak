import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gomltak/core/service_locator/services_locator.dart';
import 'package:gomltak/core/widgets/const_check_internet_conection.dart';
import 'package:gomltak/core/widgets/const_internet_desconected.dart';
import 'package:gomltak/features/abstract_feature/presentation/onpording/onpording_view.dart';
import 'package:gomltak/features/abstract_feature/presentation/splash/splash_view.dart';
import 'package:gomltak/features/auth_feature/data/repositories_impel/auth_repos_impel.dart';
import 'package:gomltak/features/auth_feature/presentation/checkout/checkout_view.dart';
import 'package:gomltak/features/auth_feature/presentation/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:gomltak/features/auth_feature/presentation/edit_profile/edit_profile_view.dart';
import 'package:gomltak/features/auth_feature/presentation/forget_password/forget_password_view.dart';
import 'package:gomltak/features/auth_feature/presentation/forget_password/verification_view.dart';
import 'package:gomltak/features/auth_feature/presentation/get_started/get_started_view.dart';
import 'package:gomltak/features/auth_feature/presentation/login/cubit/login_cubit.dart';
import 'package:gomltak/features/auth_feature/presentation/login/login_view.dart';
import 'package:gomltak/features/auth_feature/presentation/forget_password/reset_password_view.dart';
import 'package:gomltak/features/auth_feature/presentation/sign_up/cubit/signup_cubit.dart';
import 'package:gomltak/features/auth_feature/presentation/sign_up/sign_up_view.dart';
import 'package:gomltak/features/auth_feature/presentation/success/success_view.dart';
import 'package:gomltak/features/market_feature/data/repositories_impel/category_repo_impel.dart';
import 'package:gomltak/features/market_feature/data/repositories_impel/details_prodact_repo_impel.dart';
import 'package:gomltak/features/market_feature/presentation/account/account_widgets/help_center.dart';
import 'package:gomltak/features/market_feature/presentation/account/account_widgets/invite_friends.dart';
import 'package:gomltak/features/market_feature/presentation/account/account_widgets/privce_policy.dart';
import 'package:gomltak/features/market_feature/presentation/bottom_navigation_bar/bottom_navigation_bar_view.dart';
import 'package:gomltak/features/market_feature/presentation/cart/cart_view.dart';
import 'package:gomltak/features/market_feature/presentation/category/category_wigets/titel_all_category.dart';
import 'package:gomltak/features/market_feature/presentation/category/cubit/category_cubit.dart';
import 'package:gomltak/features/market_feature/presentation/category/show_all_category_view.dart';
import 'package:gomltak/features/market_feature/presentation/category/prodactes_by_category_view.dart';
import 'package:gomltak/features/market_feature/presentation/category/sub_category_view.dart';
import 'package:gomltak/features/market_feature/presentation/details_prodact/cubit/details_prodact_cubit.dart';
import 'package:gomltak/features/market_feature/presentation/details_prodact/details_prodact_view.dart';
import 'package:gomltak/features/market_feature/presentation/home/home_view.dart';
import 'package:gomltak/features/market_feature/presentation/home/home_widgets/recently_views.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRouterPath.root,
        builder: (context, state) => const CheckInternetConection(
          isInternetConection: SplashView(),
          notInternetConection: ConstInternetDesconected(),
        ),
      ),
      GoRoute(
        path: AppRouterPath.getStartedView,
        builder: (context, state) => const GetStartedView(),
      ),
      GoRoute(
        path: AppRouterPath.onpordingView,
        builder: (context, state) => const OnpordingView(),
      ),
      GoRoute(
        path: AppRouterPath.loginView,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(sl.get<AuthRepoImpel>()),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: AppRouterPath.signUpView,
        builder: (context, state) => BlocProvider<SignupCubit>(
            create: (context) =>
                SignupCubit(sl.get<AuthRepoImpel>())..getAllGover(),
            child: const SignUpView()),
      ),
      GoRoute(
        path: AppRouterPath.bottomNavigationBarView,
        builder: (context, state) => const BottomNavigationBarView(),
      ),
      GoRoute(
        path: AppRouterPath.forgetPasswordView,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: AppRouterPath.verificationView,
        builder: (context, state) => const VerificationView(),
      ),
      GoRoute(
        path: AppRouterPath.resetPasswordView,
        builder: (context, state) => const ResetPasswordView(),
      ),
      GoRoute(
        path: AppRouterPath.checkoutView,
        builder: (context, state) => const CheckoutView(),
      ),
      GoRoute(
        path: AppRouterPath.successView,
        builder: (context, state) => const SuccessView(),
      ),
      GoRoute(
        path: AppRouterPath.homeView,
        builder: (context, state) => const CheckInternetConection(
          isInternetConection: HomeView(),
          notInternetConection: ConstInternetDesconected(),
        ),
      ),
      GoRoute(
        path: AppRouterPath.editProfileView,
        builder: (context, state) => BlocProvider(
          create: (context) => EditProfileCubit(sl.get<AuthRepoImpel>()),
          child: const EditProfileView(),
        ),
      ),
      GoRoute(
        path: AppRouterPath.showAllCategoryView,
        builder: (context, state) => BlocProvider(
          create: (context) => CategoryCubit(sl.get<CategoryRepoImpel>()),
          child: const ShowAllCategoryView(),
        ),
      ),
      GoRoute(
        path: AppRouterPath.subCategory,
        builder: (context, state) => BlocProvider(
          create: (context) => CategoryCubit(sl.get<CategoryRepoImpel>())
            ..fetchSubCategory(categoryId: int.parse(state.extra.toString())),
          child: const SubCategoryView(),
        ),
      ),
      GoRoute(
        path: AppRouterPath.titelAllCategories,
        builder: (context, state) => const TitelAllCategories(),
      ),
      GoRoute(
        path: AppRouterPath.helpCenterView,
        builder: (context, state) => const HelpCenterView(),
      ),
      GoRoute(
        path: AppRouterPath.privcePolicyView,
        builder: (context, state) => const PrivcePolicyView(),
      ),
      GoRoute(
        path: AppRouterPath.inviteFriends,
        builder: (context, state) => InviteFriends(url: state.extra.toString()),
      ),
      GoRoute(
        path: AppRouterPath.resentlyWidgets,
        builder: (context, state) => const ResentlyWidgets(),
      ),
      GoRoute(
        path: AppRouterPath.prodactesByCategories,
        builder: (context, state) => BlocProvider(
          create: (context) => CategoryCubit(sl.get<CategoryRepoImpel>())
            ..fetchProdatesInSubCategory(
                idcategory: int.parse(state.extra.toString())),
          // lazy: false,
          child: const ProdactesByCategoriesView(),
        ),
      ),
      GoRoute(
        path: AppRouterPath.detailsView,
        builder: (context, state) => CheckInternetConection(
          isInternetConection: BlocProvider(
            create: (context) =>
                DetailsProdactCubit(sl.get<DetailsProdactRepoImpel>())
                  ..fetchDetailsProdact(
                      idProdact: int.parse(state.extra.toString())),
            child: const DetailsView(),
          ),
          notInternetConection: const ConstInternetDesconected(),
        ),
      ),
      GoRoute(
        path: AppRouterPath.cartView,
        builder: (context, state) => const CartView(),
      ),
    ],
  );
}

class AppRouterPath {
  static String root = '/';
  static String getStartedView = '/getStartedView';
  static String onpordingView = '/onpordingView';
  static String loginView = '/loginView';
  static String signUpView = '/signUpView';
  static String forgetPasswordView = '/forgetPasswordView';
  static String verificationView = '/verificationView';
  static String resetPasswordView = '/resetPasswordView';
  static String checkoutView = '/checkoutView';
  static String successView = '/successView';
  static String homeView = '/homeView';
  static String showAllCategoryView = '/showAllCategoryView';
  static String detailsView = '/detailsView';
  static String cartView = '/cartView';
  static String bottomNavigationBarView = '/bottomNavigationBarView';
  static String prodactesByCategories = '/prodactesByCategories';
  static String titelAllCategories = '/titelAllCategories';
  static String subCategory = '/subCategory';
  static String editProfileView = '/editProfileView';
  static String helpCenterView = '/helpCenterView';
  static String privcePolicyView = '/privcePolicyView';
  static String inviteFriends = '/inviteFriends';
  static String resentlyWidgets = '/resentlyWidgets';
}

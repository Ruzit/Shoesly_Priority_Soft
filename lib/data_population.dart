import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:shoesly_priority_soft/features/reviews/data/models/review_model.dart';
import 'package:uuid/uuid.dart';

import 'core/constants/firestore_collection.dart';
import 'core/enum/gender.dart';
import 'core/enum/product_color.dart';
import 'core/utils/firebase_config.dart';
import 'features/brand/data/models/brand_model.dart';
import 'features/brand/domain/repository/brand_repository.dart';
import 'features/products/data/models/product_filter.dart';
import 'features/products/data/models/product_model.dart';
import 'features/products/domain/repository/product_repository.dart';

@injectable
class DataPopulation {
  final FirebaseFirestore db;
  final IBrandRepository brandRepository;
  final IProductRepository productRepository;
  final brandCollection =
      FirebaseFirestore.instance.collection(FirestoreCollection.brands);
  final productCollection =
      FirebaseFirestore.instance.collection(FirestoreCollection.products);
  final reviewCollection =
      FirebaseFirestore.instance.collection(FirestoreCollection.reviews);

  var uuid = const Uuid();

  DataPopulation(
    this.brandRepository,
    this.db,
    this.productRepository,
  );

  Future<void> populate() async {
    // await populateBrand();
    // await populateProduct();
    // await populateReviewData();
  }

  Future<void> populateBrand() async {
    final firestoreService = FirebaseClient<BrandModel>(brandCollection);

    // Dummy data
    final List<BrandModel> brands = [
      BrandModel(
        id: uuid.v1(),
        name: 'Nike',
        logo:
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Icons%2Fnike.svg?alt=media&token=a60b0c95-d5bc-4681-9902-64578f509187',
        totalProducts: 88,
      ),
      BrandModel(
        id: uuid.v1(),
        name: 'Jordan',
        logo:
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Images%2Fjordan1.png?alt=media&token=ffa34aa3-f3d1-4802-a5c4-4e3810f20d8d',
        totalProducts: 40,
      ),
      BrandModel(
        id: uuid.v1(),
        name: 'Adidas',
        logo:
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Icons%2Fadidas.svg?alt=media&token=a4e6a026-01c9-4eea-a48e-dd27570e99b6',
        totalProducts: 112,
      ),
      BrandModel(
        id: uuid.v1(),
        name: 'Puma',
        logo:
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Icons%2Fpuma.svg?alt=media&token=42795464-f61d-447f-93b7-484441e9bd86',
        totalProducts: 52,
      ),
      BrandModel(
        id: uuid.v1(),
        name: 'Reebok',
        logo:
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Icons%2Freebok.svg?alt=media&token=1cb4c7ac-8999-4f7b-a385-5fb952b1e56a',
        totalProducts: 60,
      ),
      BrandModel(
        id: uuid.v1(),
        name: 'Vans',
        logo:
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Icons%2Fvans.svg?alt=media&token=d20e3606-11a2-4634-a10b-487a29ead7bb',
        totalProducts: 24,
      ),
    ];

    bool batchCreateSuccess = await firestoreService.createBatch(
      items: brands,
      toMap: (brand) => brand.toJson(),
    );

    if (batchCreateSuccess) {
      log('Brand Batch create successful');
    } else {
      log('Brand Batch create failed');
    }
  }

  Future<void> populateProduct() async {
    final brandCollectionService = FirebaseClient<BrandModel>(brandCollection);
    final productCollectionService =
        FirebaseClient<ProductModel>(productCollection);

    final brands = await brandCollectionService.readCollection(
      toMap: (Map<String, dynamic> data, String id) {
        return BrandModel.fromJson(data);
      },
    );
    final nike = brands.firstWhere((element) => element.name == "Nike");
    final jordan = brands.firstWhere((element) => element.name == "Jordan");
    final adidas = brands.firstWhere((element) => element.name == "Adidas");
    final rebook = brands.firstWhere((element) => element.name == "Puma");
    final puma = brands.firstWhere((element) => element.name == "Reebok");
    final vans = brands.firstWhere((element) => element.name == "Vans");

    final List<String> nikeImage = List.generate(
        3,
        (index) =>
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Images%2Fjordan6.png?alt=media&token=c7dad648-9d59-425a-bd19-fb2416246fe0');
    final List<String> jordanImage = List.generate(
        3,
        (index) =>
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Images%2Fjordan1.png?alt=media&token=ffa34aa3-f3d1-4802-a5c4-4e3810f20d8d');
    final List<String> adidasImage = List.generate(
        3,
        (index) =>
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Images%2Fadidas1.png?alt=media&token=8f68c6a8-c356-4a1b-b935-5e6b3055981a');
    final List<String> rebookImage = List.generate(
        3,
        (index) =>
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Images%2Fadidas3.png?alt=media&token=1359c6eb-96b5-47d3-9cbf-d8c30416790f');
    final List<String> pumaImage = List.generate(
        3,
        (index) =>
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Images%2Fadidas2.png?alt=media&token=4564616f-c144-4add-a2e6-84b67d1c1308');
    final List<String> vansImage = List.generate(
        3,
        (index) =>
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Images%2Fjordan3.png?alt=media&token=07fd0329-6f96-4117-9dd9-5e7bfb042f50');

    final products = [
      ProductModel(
          id: uuid.v1(),
          name: 'Jordan 1 Retro High Tie Dye',
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          images: nikeImage,
          price: 200,
          brand: nike.name,
          avgRating: 4.5,
          thumbnail: nikeImage.first,
          totalReviews: 10,
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [ProductColor.white, ProductColor.red],
          gender: Gender.unisex),

      ProductModel(
          id: uuid.v1(),
          name: 'Jordan 1 Retro High Tie Dye',
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          images: adidasImage,
          price: 250,
          brand: adidas.name,
          avgRating: 4.5,
          totalReviews: 10,
          thumbnail: adidasImage.first,
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [ProductColor.white, ProductColor.black],
          gender: Gender.unisex),
      ProductModel(
          id: uuid.v1(),
          name: 'Jordan 1 Retro High Tie Dye',
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          images: pumaImage,
          price: 300,
          brand: puma.name,
          thumbnail: pumaImage.first,
          avgRating: 4.5,
          totalReviews: 10,
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [ProductColor.white, ProductColor.black, ProductColor.red],
          gender: Gender.unisex),

      ProductModel(
          id: uuid.v1(),
          name: 'Jordan 1 Retro High Tie Dye',
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          images: vansImage,
          price: 400,
          brand: vans.name,
          avgRating: 4.5,
          thumbnail: vansImage.first,
          totalReviews: 10,
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [
            ProductColor.white,
            ProductColor.black,
          ],
          gender: Gender.unisex),
      ProductModel(
          id: uuid.v1(),
          name: 'Jordan 1 Retro High Tie Dye',
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          images: rebookImage,
          totalReviews: 10,
          price: 500,
          brand: rebook.name,
          avgRating: 4.5,
          thumbnail: rebookImage.first,
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [ProductColor.black, ProductColor.red],
          gender: Gender.unisex),
      ProductModel(
          id: uuid.v1(),
          name: 'Jordan 1 Retro High Tie Dye',
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          images: jordanImage,
          price: 200,
          brand: jordan.name,
          avgRating: 4.5,
          thumbnail: jordanImage.first,
          totalReviews: 10,
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [ProductColor.white, ProductColor.red],
          gender: Gender.unisex),

      ProductModel(
          id: uuid.v1(),
          name: 'Jordan 1 Retro High Tie Dye',
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          images: adidasImage,
          price: 250,
          brand: adidas.name,
          avgRating: 4.5,
          totalReviews: 10,
          thumbnail: adidasImage.first,
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [ProductColor.white, ProductColor.black],
          gender: Gender.unisex),
      ProductModel(
          id: uuid.v1(),
          name: 'Jordan 1 Retro High Tie Dye',
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          images: pumaImage,
          price: 300,
          brand: puma.name,
          thumbnail: pumaImage.first,
          avgRating: 4.5,
          totalReviews: 10,
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [ProductColor.white, ProductColor.black, ProductColor.red],
          gender: Gender.unisex),

      ProductModel(
          id: uuid.v1(),
          name: 'Jordan 1 Retro High Tie Dye',
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          images: vansImage,
          price: 400,
          brand: vans.name,
          avgRating: 4.5,
          thumbnail: vansImage.first,
          totalReviews: 10,
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [
            ProductColor.white,
            ProductColor.black,
          ],
          gender: Gender.unisex),
      ProductModel(
          id: uuid.v1(),
          name: 'Jordan 1 Retro High Tie Dye',
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          images: rebookImage,
          totalReviews: 10,
          price: 500,
          brand: rebook.name,
          avgRating: 4.5,
          thumbnail: rebookImage.first,
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [ProductColor.black, ProductColor.red],
          gender: Gender.unisex),

      //
    ];

    for (var product in products) {
      product.createdAt = DateTime.now();
    }
    bool batchCreateSuccess = await productCollectionService.createBatch(
      items: products,
      toMap: (products) => products.toJson(),
    );

    if (batchCreateSuccess) {
      log('Product Batch create successful');
    } else {
      log('Product Batch create failed');
    }
  }

  Future<void> populateReviewData() async {
    final reviewCollectionservice =
        FirebaseClient<ReviewModel>(reviewCollection);

    final products = (await productRepository.getProductList(
                filter: ProductFilter(limit: 100)))
            .data ??
        [];

    List<T> shuffle<T>(list) {
      list.shuffle();
      return list;
    }

    List<Review> reviewsList = [
      Review(
        'Alex',
        'Great cushioning for daily runs. Feet don\'t tire easily.',
        4,
        'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Profile%20Pictures%2FprofileImage1.jpg?alt=media&token=f61b7ddf-6cb8-45e8-8c34-17a0c5ee100b',
      ),
      Review(
        'David',
        'Excellent grip and comfort for rocky terrain.',
        5,
        'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Profile%20Pictures%2FprofileImage1.jpg?alt=media&token=f61b7ddf-6cb8-45e8-8c34-17a0c5ee100b',
      ),
      Review(
        'Micheal',
        'Stylish but took too long to break in. Not very supportive.',
        2,
        'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Profile%20Pictures%2FprofileImage1.jpg?alt=media&token=f61b7ddf-6cb8-45e8-8c34-17a0c5ee100b',
      ),
      Review(
        'Emma',
        'Comfortable, but the sole wore out quickly.',
        3,
        'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Profile%20Pictures%2FprofileImage2.jpg?alt=media&token=3eded75a-e5f2-4a10-9264-11ad3e6bba6f',
      ),
    ];
    for (var product in products) {
      List<ReviewModel> reviewList = List.generate(10, (index) {
        Review review = shuffle<Review>(reviewsList).first;
        return ReviewModel(
          id: "",
          productId: product.id!,
          reviewScore: review.score,
          createdAt: DateTime.now(),
          userName: review.name,
          userImage: review.image,
          content: review.review,
        );
      });

      bool batchCreateSuccess = await reviewCollectionservice.createBatch(
        items: reviewList,
        toMap: (review) => review.toJson(),
      );

      if (batchCreateSuccess) {
        log('Review Batch create successful');
      } else {
        log('Review Batch create failed');
      }
    }
  }
}

class Review {
  final String name;
  final String image;
  final String review;
  final num score;

  Review(this.name, this.review, this.score, this.image);
}

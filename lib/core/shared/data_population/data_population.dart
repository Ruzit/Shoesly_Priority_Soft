import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:shoesly_priority_soft/features/reviews/data/models/review_model.dart';
import 'package:uuid/uuid.dart';

import '../../../features/brand/data/models/brand_model.dart';
import '../../../features/brand/domain/repository/brand_repository.dart';
import '../../../features/products/data/models/product_filter.dart';
import '../../../features/products/data/models/product_model.dart';
import '../../../features/products/domain/repository/product_repository.dart';
import '../../constants/firestore_collection.dart';
import '../../enum/gender.dart';
import '../../enum/product_color.dart';
import '../firebase_config/firebase_config.dart';

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
    await populateBrand();
    await populateProduct();
    await populateReviewData();
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
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Icons%2Fjordan.svg?alt=media&token=ec2725bb-6d8b-4b6e-b27b-75fa1cccbfc2',
        totalProducts: 40,
      ),
      BrandModel(
        id: uuid.v1(),
        name: 'Adidas',
        logo:
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Icons%2Fadidas.svg?alt=media&token=a4e6a026-01c9-4eea-a48e-dd27570e99b6',
        totalProducts: 112,
      ),
      // BrandModel(
      //   id: uuid.v1(),
      //   name: 'Puma',
      //   logo:
      //       'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Icons%2Fpuma.svg?alt=media&token=42795464-f61d-447f-93b7-484441e9bd86',
      //   totalProducts: 52,
      // ),
      BrandModel(
        id: uuid.v1(),
        name: 'Reebok',
        logo:
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Icons%2Freebok.svg?alt=media&token=1cb4c7ac-8999-4f7b-a385-5fb952b1e56a',
        totalProducts: 60,
      ),
      // BrandModel(
      //   id: uuid.v1(),
      //   name: 'Vans',
      //   logo:
      //       'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/Icons%2Fvans.svg?alt=media&token=d20e3606-11a2-4634-a10b-487a29ead7bb',
      //   totalProducts: 24,
      // ),
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
    final reebok = brands.firstWhere((element) => element.name == "Reebok");

    final products = [
      ProductModel(
        id: uuid.v1(),
        name: 'Adidas1',
        description:
            "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
        images: [
          'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fadidas1.jpg?alt=media&token=87b324f9-08b3-40b8-8ae5-007a7757b07e'
        ],
        price: 200,
        brand: adidas.name,
        avgRating: 4.5,
        thumbnail:
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fadidas1.jpg?alt=media&token=87b324f9-08b3-40b8-8ae5-007a7757b07e',
        totalReviews: 10,
        sizes: [39, 39.5, 40, 40.5, 41],
        colors: [ProductColor.black, ProductColor.red],
        gender: Gender.unisex,
      ),
      ProductModel(
        id: uuid.v1(),
        name: 'Adidas2',
        description:
            "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
        images: [
          'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fadidas2.png?alt=media&token=791481bb-d252-42f8-b5a8-9bcc3350ef08'
        ],
        price: 300,
        brand: adidas.name,
        avgRating: 4.5,
        thumbnail:
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fadidas2.png?alt=media&token=791481bb-d252-42f8-b5a8-9bcc3350ef08',
        totalReviews: 20,
        sizes: [39, 39.5, 40, 40.5, 41],
        colors: [ProductColor.white, ProductColor.red],
        gender: Gender.male,
      ),
      ProductModel(
        id: uuid.v1(),
        name: 'Adidas3',
        description:
            "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
        images: [
          'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fadidas3.png?alt=media&token=c4489d03-cc19-4b34-a25c-0fabf5828773'
        ],
        price: 150,
        brand: adidas.name,
        avgRating: 4.5,
        thumbnail:
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fadidas3.png?alt=media&token=c4489d03-cc19-4b34-a25c-0fabf5828773',
        totalReviews: 3,
        sizes: [39, 39.5, 40, 40.5, 41],
        colors: [ProductColor.white, ProductColor.black],
        gender: Gender.male,
      ),
      ProductModel(
        id: uuid.v1(),
        name: 'Adidas4',
        description:
            "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
        images: [
          'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fadidas4.png?alt=media&token=84f25929-54b4-4e71-bf2a-9a27570fa593'
        ],
        price: 290,
        brand: adidas.name,
        avgRating: 4.5,
        thumbnail:
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fadidas4.png?alt=media&token=84f25929-54b4-4e71-bf2a-9a27570fa593',
        totalReviews: 8,
        sizes: [39, 39.5, 40, 40.5, 41],
        colors: [ProductColor.white, ProductColor.black],
        gender: Gender.male,
      ),
      ProductModel(
        id: uuid.v1(),
        name: 'Reebok1',
        description:
            "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
        images: [
          'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fimage-removebg-preview%20(1).png?alt=media&token=3b19b947-cde7-4f01-a032-52b0285b0d3a'
        ],
        price: 80,
        brand: reebok.name,
        avgRating: 4.5,
        thumbnail:
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fimage-removebg-preview%20(1).png?alt=media&token=3b19b947-cde7-4f01-a032-52b0285b0d3a',
        totalReviews: 10,
        sizes: [39, 39.5, 40, 40.5, 41],
        colors: [ProductColor.white, ProductColor.black],
        gender: Gender.female,
      ),
      ProductModel(
        id: uuid.v1(),
        name: 'Reebok2',
        description:
            "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
        images: [
          'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fimage-removebg-preview%20(2).png?alt=media&token=525502db-c916-4edd-bed0-fc1c59654204'
        ],
        price: 240,
        brand: reebok.name,
        avgRating: 4.5,
        thumbnail:
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fimage-removebg-preview%20(2).png?alt=media&token=525502db-c916-4edd-bed0-fc1c59654204',
        totalReviews: 16,
        sizes: [39, 39.5, 40, 40.5, 41],
        colors: [ProductColor.white, ProductColor.black],
        gender: Gender.unisex,
      ),
      ProductModel(
        id: uuid.v1(),
        name: 'Reebok3',
        description:
            "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
        images: [
          'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fimage-removebg-preview%20(3).png?alt=media&token=9343d156-6fb7-4c47-bc79-905ebb21e2c0'
        ],
        price: 120,
        brand: reebok.name,
        avgRating: 4.5,
        thumbnail:
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fimage-removebg-preview%20(3).png?alt=media&token=9343d156-6fb7-4c47-bc79-905ebb21e2c0',
        totalReviews: 9,
        sizes: [39, 39.5, 40, 40.5, 41],
        colors: [ProductColor.white, ProductColor.black],
        gender: Gender.male,
      ),
      ProductModel(
        id: uuid.v1(),
        name: 'Reebok4',
        description:
            "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
        images: [
          'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fimage-removebg-preview%20(4).png?alt=media&token=7e16c31a-f732-41ed-bee3-c2742b905f28'
        ],
        price: 220,
        brand: reebok.name,
        avgRating: 4.2,
        thumbnail:
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fimage-removebg-preview%20(4).png?alt=media&token=7e16c31a-f732-41ed-bee3-c2742b905f28',
        totalReviews: 13,
        sizes: [39, 39.5, 40, 40.5, 41],
        colors: [ProductColor.white, ProductColor.black],
        gender: Gender.male,
      ),
      ProductModel(
        id: uuid.v1(),
        name: 'Jordan1',
        description:
            "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
        images: [
          'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fjordan%201.png?alt=media&token=6baf6c18-1ca2-4350-a309-cb410becb64a'
        ],
        price: 1200,
        brand: jordan.name,
        avgRating: 4.2,
        thumbnail:
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fjordan%201.png?alt=media&token=6baf6c18-1ca2-4350-a309-cb410becb64a',
        totalReviews: 2,
        sizes: [39, 39.5, 40, 41, 42],
        colors: [ProductColor.white, ProductColor.black],
        gender: Gender.unisex,
      ),
      ProductModel(
        id: uuid.v1(),
        name: 'Jordan2',
        description:
            "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
        images: [
          'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fjordan2.png?alt=media&token=4c1bb6f9-4477-4005-9b81-8e4b38cba58b'
        ],
        price: 890,
        brand: jordan.name,
        avgRating: 4.8,
        thumbnail:
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fjordan2.png?alt=media&token=4c1bb6f9-4477-4005-9b81-8e4b38cba58b',
        totalReviews: 22,
        sizes: [39, 39.5, 40, 41, 42],
        colors: [ProductColor.white, ProductColor.black],
        gender: Gender.unisex,
      ),
      ProductModel(
        id: uuid.v1(),
        name: 'Jordan3',
        description:
            "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
        images: [
          'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fjordan3.png?alt=media&token=d8cd64e5-829c-43fd-a0c9-8a89dacd38ab'
        ],
        price: 930,
        brand: jordan.name,
        avgRating: 4.5,
        thumbnail:
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fjordan3.png?alt=media&token=d8cd64e5-829c-43fd-a0c9-8a89dacd38ab',
        totalReviews: 12,
        sizes: [39, 39.5, 40, 41, 42],
        colors: [ProductColor.white, ProductColor.black],
        gender: Gender.unisex,
      ),
      ProductModel(
        id: uuid.v1(),
        name: 'Jordan4',
        description:
            "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
        images: [
          'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fjordan4.png?alt=media&token=9986500d-5bc0-4359-a9f6-a5b65a1ff7b8'
        ],
        price: 1300,
        brand: jordan.name,
        avgRating: 4.2,
        thumbnail:
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fjordan4.png?alt=media&token=9986500d-5bc0-4359-a9f6-a5b65a1ff7b8',
        totalReviews: 16,
        sizes: [39, 39.5, 40, 41, 42],
        colors: [ProductColor.white, ProductColor.black],
        gender: Gender.unisex,
      ),
      ProductModel(
        id: uuid.v1(),
        name: 'Nike1',
        description:
            "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
        images: [
          'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fnike%201.png?alt=media&token=00b644f1-d65b-40a7-8bbe-30c5464ff3d7'
        ],
        price: 220,
        brand: nike.name,
        avgRating: 4.2,
        thumbnail:
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fnike%201.png?alt=media&token=00b644f1-d65b-40a7-8bbe-30c5464ff3d7',
        totalReviews: 16,
        sizes: [39, 39.5, 40, 41, 42],
        colors: [ProductColor.white, ProductColor.black],
        gender: Gender.unisex,
      ),
      ProductModel(
        id: uuid.v1(),
        name: 'Nike2',
        description:
            "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
        images: [
          'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fnike%202.png?alt=media&token=c0e21296-dd31-491f-a94c-57a569bdbc81'
        ],
        price: 140,
        brand: nike.name,
        avgRating: 4.4,
        thumbnail:
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fnike%202.png?alt=media&token=c0e21296-dd31-491f-a94c-57a569bdbc81',
        totalReviews: 16,
        sizes: [39, 39.5, 40, 41, 42],
        colors: [ProductColor.white, ProductColor.black],
        gender: Gender.unisex,
      ),
      ProductModel(
        id: uuid.v1(),
        name: 'Nike3',
        description:
            "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
        images: [
          'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fnike%203.png?alt=media&token=0c094225-0555-4fac-89dc-e3f6d275529d'
        ],
        price: 320,
        brand: nike.name,
        avgRating: 4.6,
        thumbnail:
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fnike%203.png?alt=media&token=0c094225-0555-4fac-89dc-e3f6d275529d',
        totalReviews: 16,
        sizes: [39, 39.5, 40, 41, 42],
        colors: [ProductColor.white, ProductColor.black],
        gender: Gender.unisex,
      ),
      ProductModel(
        id: uuid.v1(),
        name: 'Nike4',
        description:
            "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
        images: [
          'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fnike4.png?alt=media&token=6c764aaa-e82f-4c6c-94ca-50479d4c6118'
        ],
        price: 400,
        brand: nike.name,
        avgRating: 4.7,
        thumbnail:
            'https://firebasestorage.googleapis.com/v0/b/shoesly-8585b.appspot.com/o/NewProducts%2Fnike4.png?alt=media&token=6c764aaa-e82f-4c6c-94ca-50479d4c6118',
        totalReviews: 16,
        sizes: [39, 39.5, 40, 41, 42],
        colors: [ProductColor.white, ProductColor.black],
        gender: Gender.unisex,
      ),
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

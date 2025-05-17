import 'package:furniture_app/src/features/home/domain/models/furniture_item.dart';
import 'package:furniture_app/src/features/style_quiz/domain/models/quiz_models.dart'; // Required for StyleType

final List<FurnitureItem> mockFurnitureItems = [
  // 25 Beds
  FurnitureItem(
      name: 'Comfort King Bed',
      imagePath: 'assets/furniture/beds/bed_1.png',
      productCategory: ProductCategory.beds,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Modern Platform Bed',
      imagePath: 'assets/furniture/beds/bed_2.png',
      productCategory: ProductCategory.beds,
      style: StyleType.classic),
  FurnitureItem(
      name: 'Classic Wooden Bed',
      imagePath: 'assets/furniture/beds/bed_3.png',
      productCategory: ProductCategory.beds,
      style: StyleType.minimalist),
  FurnitureItem(
      name: 'Minimalist Queen Bed',
      imagePath: 'assets/furniture/beds/bed_4.png',
      productCategory: ProductCategory.beds,
      style: StyleType.bohemian),
  FurnitureItem(
      name: 'Luxury Upholstered Bed',
      imagePath: 'assets/furniture/beds/bed_5.png',
      productCategory: ProductCategory.beds,
      style: StyleType.classic),
  FurnitureItem(
      name: 'Steel Frame Bed',
      imagePath: 'assets/furniture/beds/bed_6.png',
      productCategory: ProductCategory.beds,
      style: StyleType.classic),
  FurnitureItem(
      name: 'Rustic Charm Bed',
      imagePath: 'assets/furniture/beds/bed_7.png',
      productCategory: ProductCategory.beds,
      style: StyleType.minimalist),
  FurnitureItem(
      name: 'Kids Bunk Bed',
      imagePath: 'assets/furniture/beds/bed_8.png',
      productCategory: ProductCategory.beds,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Single Guest Bed',
      imagePath: 'assets/furniture/beds/bed_9.png',
      productCategory: ProductCategory.beds,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Elegant Canopy Bed',
      imagePath: 'assets/furniture/beds/bed_10.png',
      productCategory: ProductCategory.beds,
      style: StyleType.classic),
  FurnitureItem(
      name: 'Storage Drawer Bed',
      imagePath: 'assets/furniture/beds/bed_11.png',
      productCategory: ProductCategory.beds,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Sleek Metal Bed',
      imagePath: 'assets/furniture/beds/bed_12.png',
      productCategory: ProductCategory.beds,
      style: StyleType.classic),
  FurnitureItem(
      name: 'Vintage Style Bed',
      imagePath: 'assets/furniture/beds/bed_13.png',
      productCategory: ProductCategory.beds,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Daybed with Trundle',
      imagePath: 'assets/furniture/beds/bed_14.png',
      productCategory: ProductCategory.beds,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Round Bed',
      imagePath: 'assets/furniture/beds/bed_15.png',
      productCategory: ProductCategory.beds,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Adjustable Bed',
      imagePath: 'assets/furniture/beds/bed_16.png',
      productCategory: ProductCategory.beds,
      style: StyleType.classic),
  FurnitureItem(
      name: 'Foldable Wall Bed',
      imagePath: 'assets/furniture/beds/bed_17.png',
      productCategory: ProductCategory.beds,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Low Profile Bed',
      imagePath: 'assets/furniture/beds/bed_18.png',
      productCategory: ProductCategory.beds,
      style: StyleType.minimalist),
  FurnitureItem(
      name: 'Four Poster Bed',
      imagePath: 'assets/furniture/beds/bed_19.png',
      productCategory: ProductCategory.beds,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Toddler Bed',
      imagePath: 'assets/furniture/beds/bed_20.png',
      productCategory: ProductCategory.beds,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Canopy Dream Bed',
      imagePath: 'assets/furniture/beds/bed_21.png',
      productCategory: ProductCategory.beds,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Modern Loft Bed',
      imagePath: 'assets/furniture/beds/bed_22.png',
      productCategory: ProductCategory.beds,
      style: StyleType.classic),
  FurnitureItem(
      name: 'Antique Four Poster Bed',
      imagePath: 'assets/furniture/beds/bed_23.png',
      productCategory: ProductCategory.beds,
      style: StyleType.minimalist),
  FurnitureItem(
      name: 'Murphy Wall Bed',
      imagePath: 'assets/furniture/beds/bed_24.png',
      productCategory: ProductCategory.beds,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Simple Platform Bed',
      imagePath: 'assets/furniture/beds/bed_25.png',
      productCategory: ProductCategory.beds,
      style: StyleType.modern),

  // 25 Chairs
  FurnitureItem(
      name: 'Ergonomic Office Chair',
      imagePath: 'assets/furniture/chairs/chair_1.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Velvet Accent Chair',
      imagePath: 'assets/furniture/chairs/chair_2.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.classic),
  FurnitureItem(
      name: 'Wooden Dining Chair',
      imagePath: 'assets/furniture/chairs/chair_3.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.classic),
  FurnitureItem(
      name: 'Leather Recliner Chair',
      imagePath: 'assets/furniture/chairs/chair_4.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.classic),
  FurnitureItem(
      name: 'Ghost Chair',
      imagePath: 'assets/furniture/chairs/chair_5.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Rocking Chair',
      imagePath: 'assets/furniture/chairs/chair_6.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.classic),
  FurnitureItem(
      name: 'Bar Stool Chair',
      imagePath: 'assets/furniture/chairs/chair_7.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Bean Bag Chair',
      imagePath: 'assets/furniture/chairs/chair_8.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Folding Chair',
      imagePath: 'assets/furniture/chairs/chair_9.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Armchair Classic',
      imagePath: 'assets/furniture/chairs/chair_10.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.classic),
  FurnitureItem(
      name: 'Modern Dining Chair',
      imagePath: 'assets/furniture/chairs/chair_11.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Swivel Office Chair',
      imagePath: 'assets/furniture/chairs/chair_12.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Patio Lounge Chair',
      imagePath: 'assets/furniture/chairs/chair_13.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Kids Study Chair',
      imagePath: 'assets/furniture/chairs/chair_14.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Gaming Chair Pro',
      imagePath: 'assets/furniture/chairs/chair_15.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Accent Barrel Chair',
      imagePath: 'assets/furniture/chairs/chair_16.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Wooden Bench Chair',
      imagePath: 'assets/furniture/chairs/chair_17.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.classic),
  FurnitureItem(
      name: 'High Back Executive Chair',
      imagePath: 'assets/furniture/chairs/chair_18.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Cafe Bistro Chair',
      imagePath: 'assets/furniture/chairs/chair_19.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Rattan Armchair',
      imagePath: 'assets/furniture/chairs/chair_20.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.bohemian),
  FurnitureItem(
      name: 'Industrial Metal Chair',
      imagePath: 'assets/furniture/chairs/chair_21.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Padded Dining Chair',
      imagePath: 'assets/furniture/chairs/chair_22.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Outdoor Folding Chair',
      imagePath: 'assets/furniture/chairs/chair_23.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Childrens Rocking Chair',
      imagePath: 'assets/furniture/chairs/chair_24.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.classic),
  FurnitureItem(
      name: 'Minimalist Stool Chair',
      imagePath: 'assets/furniture/chairs/chair_25.png',
      productCategory: ProductCategory.chairs,
      style: StyleType.minimalist),
  

  // 25 Sofas
  FurnitureItem(
      name: 'Sectional Sofa Large',
      imagePath: 'assets/furniture/sofa/sofa_1.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Loveseat Compact',
      imagePath: 'assets/furniture/sofa/sofa_2.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Chesterfield Sofa',
      imagePath: 'assets/furniture/sofa/sofa_3.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.classic),
  FurnitureItem(
      name: 'Sleeper Sofa Bed',
      imagePath: 'assets/furniture/sofa/sofa_4.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Mid-Century Modern Sofa',
      imagePath: 'assets/furniture/sofa/sofa_5.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Futon Sofa',
      imagePath: 'assets/furniture/sofa/sofa_6.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Outdoor Patio Sofa',
      imagePath: 'assets/furniture/sofa/sofa_7.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Reclining Sofa',
      imagePath: 'assets/furniture/sofa/sofa_8.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Modular Sofa Set',
      imagePath: 'assets/furniture/sofa/sofa_9.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Small Apartment Sofa',
      imagePath: 'assets/furniture/sofa/sofa_10.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.modern),
  FurnitureItem(
      name: 'L-Shaped Corner Sofa',
      imagePath: 'assets/furniture/sofa/sofa_11.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Velvet Tufted Sofa',
      imagePath: 'assets/furniture/sofa/sofa_12.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.classic),
  FurnitureItem(
      name: 'Convertible Futon Sofa',
      imagePath: 'assets/furniture/sofa/sofa_13.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Leather Lawson Sofa',
      imagePath: 'assets/furniture/sofa/sofa_14.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.classic),
  FurnitureItem(
      name: 'Scandinavian Design Sofa',
      imagePath: 'assets/furniture/sofa/sofa_15.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Bridgewater Sofa',
      imagePath: 'assets/furniture/sofa/sofa_16.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.classic),
  FurnitureItem(
      name: 'Outdoor Wicker Sofa',
      imagePath: 'assets/furniture/sofa/sofa_17.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.bohemian),
  FurnitureItem(
      name: 'Tuxedo Sofa',
      imagePath: 'assets/furniture/sofa/sofa_18.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Camelback Sofa',
      imagePath: 'assets/furniture/sofa/sofa_19.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Track Arm Sofa',
      imagePath: 'assets/furniture/sofa/sofa_20.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Daybed Sofa',
      imagePath: 'assets/furniture/sofa/sofa_21.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Chaise Lounge Sofa',
      imagePath: 'assets/furniture/sofa/sofa_22.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Minimalist Sofa',
      imagePath: 'assets/furniture/sofa/sofa_23.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.minimalist),
  FurnitureItem(
      name: 'Kids Sofa',
      imagePath: 'assets/furniture/sofa/sofa_24.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Armless Sofa',
      imagePath: 'assets/furniture/sofa/sofa_25.png',
      productCategory: ProductCategory.sofa,
      style: StyleType.modern),


  // 25 Lamps
  FurnitureItem(
      name: 'Modern Floor Lamp',
      imagePath: 'assets/furniture/lamps/lamp_1.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Desk Lamp Adjustable',
      imagePath: 'assets/furniture/lamps/lamp_2.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Tiffany Style Lamp',
      imagePath: 'assets/furniture/lamps/lamp_3.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Himalayan Salt Lamp',
      imagePath: 'assets/furniture/lamps/lamp_4.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Chandelier Crystal',
      imagePath: 'assets/furniture/lamps/lamp_5.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Bedside Table Lamp',
      imagePath: 'assets/furniture/lamps/lamp_6.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.modern),
  FurnitureItem(
      name: 'LED Strip Lights',
      imagePath: 'assets/furniture/lamps/lamp_7.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Outdoor Solar Lamp',
      imagePath: 'assets/furniture/lamps/lamp_8.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Lava Lamp Retro',
      imagePath: 'assets/furniture/lamps/lamp_9.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Smart Lamp WiFi',
      imagePath: 'assets/furniture/lamps/lamp_10.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Arc Floor Lamp',
      imagePath: 'assets/furniture/lamps/lamp_11.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Tripod Floor Lamp',
      imagePath: 'assets/furniture/lamps/lamp_12.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Industrial Pendant Lamp',
      imagePath: 'assets/furniture/lamps/lamp_13.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Rustic Table Lamp',
      imagePath: 'assets/furniture/lamps/lamp_14.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.classic),
  FurnitureItem(
      name: 'Bankers Lamp',
      imagePath: 'assets/furniture/lamps/lamp_15.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Paper Lantern Lamp',
      imagePath: 'assets/furniture/lamps/lamp_16.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Clip-on Reading Lamp',
      imagePath: 'assets/furniture/lamps/lamp_17.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Wall Sconce Lamp',
      imagePath: 'assets/furniture/lamps/lamp_18.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Torchiere Floor Lamp',
      imagePath: 'assets/furniture/lamps/lamp_19.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Oil Lamp Vintage',
      imagePath: 'assets/furniture/lamps/lamp_20.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Globe Pendant Lamp',
      imagePath: 'assets/furniture/lamps/lamp_21.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Swing Arm Desk Lamp',
      imagePath: 'assets/furniture/lamps/lamp_22.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Spotlight Track Lamp',
      imagePath: 'assets/furniture/lamps/lamp_23.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Novelty Kids Lamp',
      imagePath: 'assets/furniture/lamps/lamp_24.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.modern),
  FurnitureItem(
      name: 'Pharmacy Floor Lamp',
      imagePath: 'assets/furniture/lamps/lamp_25.png',
      productCategory: ProductCategory.lamps,
      style: StyleType.modern),
];

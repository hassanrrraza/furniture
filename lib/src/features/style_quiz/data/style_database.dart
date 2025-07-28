import 'package:furniture_app/src/features/style_quiz/domain/models/quiz_models.dart';
import 'package:furniture_app/src/features/style_quiz/domain/models/style_information.dart';

/// Comprehensive database of style information for all furniture styles
class StyleDatabase {
  static const Map<StyleType, StyleInformation> _styleInformation = {
    StyleType.modern: StyleInformation(
      styleType: StyleType.modern,
      title: 'Modern',
      description: 'Clean lines, functional design, and sophisticated simplicity',
      detailedDescription: 'Modern style embraces minimalism with a focus on function over form. It features clean geometric lines, open spaces, and a neutral color palette with bold accent pieces. This style eliminates unnecessary decorative elements, creating spaces that feel fresh, uncluttered, and effortlessly sophisticated.',
      colorPalette: [
        StyleColor(name: 'Pure White', hexColor: '#FFFFFF', type: ColorType.primary),
        StyleColor(name: 'Charcoal Grey', hexColor: '#36454F', type: ColorType.primary),
        StyleColor(name: 'Jet Black', hexColor: '#000000', type: ColorType.accent),
        StyleColor(name: 'Cool Grey', hexColor: '#8B9DC3', type: ColorType.secondary),
        StyleColor(name: 'Steel Blue', hexColor: '#4682B4', type: ColorType.accent),
        StyleColor(name: 'Warm Beige', hexColor: '#F5F5DC', type: ColorType.neutral),
      ],
      designElements: [
        'Clean geometric lines',
        'Open floor plans',
        'Large windows for natural light',
        'Minimal ornamentation',
        'Functional furniture pieces',
        'Bold statement art',
        'Sleek hardware and fixtures',
        'Neutral backgrounds with color pops',
      ],
      materials: [
        'Stainless steel',
        'Glass',
        'Polished concrete',
        'Leather',
        'Chrome',
        'Lacquered wood',
        'Marble',
        'High-gloss finishes',
      ],
      characteristics: [
        'Emphasis on functionality',
        'Uncluttered spaces',
        'Geometric shapes',
        'Monochromatic color schemes',
        'Statement lighting',
        'Quality over quantity',
        'Technology integration',
        'Sophisticated simplicity',
      ],
      furnitureRecommendations: [
        'Platform beds with clean lines',
        'Sectional sofas in neutral tones',
        'Glass or metal coffee tables',
        'Ergonomic office chairs',
        'Built-in storage solutions',
        'Pendant lighting fixtures',
        'Floating shelves',
        'Minimalist dining sets',
      ],
      imageAsset: 'assets/images/modern_style.png',
    ),

    StyleType.classic: StyleInformation(
      styleType: StyleType.classic,
      title: 'Classic',
      description: 'Timeless elegance with rich materials and traditional craftsmanship',
      detailedDescription: 'Classic style draws inspiration from European design traditions, featuring rich fabrics, ornate details, and symmetrical arrangements. This timeless approach emphasizes quality craftsmanship, luxurious materials, and formal elegance that never goes out of style.',
      colorPalette: [
        StyleColor(name: 'Deep Navy', hexColor: '#000080', type: ColorType.primary),
        StyleColor(name: 'Rich Burgundy', hexColor: '#800020', type: ColorType.primary),
        StyleColor(name: 'Forest Green', hexColor: '#355E3B', type: ColorType.secondary),
        StyleColor(name: 'Golden Yellow', hexColor: '#FFD700', type: ColorType.accent),
        StyleColor(name: 'Cream White', hexColor: '#FFFDD0', type: ColorType.neutral),
        StyleColor(name: 'Mahogany Brown', hexColor: '#C04000', type: ColorType.accent),
      ],
      designElements: [
        'Symmetrical arrangements',
        'Ornate moldings and trim',
        'Traditional patterns (damask, toile)',
        'Formal furniture placement',
        'Rich fabric textures',
        'Antique or vintage pieces',
        'Elegant window treatments',
        'Classical architectural details',
      ],
      materials: [
        'Solid hardwoods (mahogany, cherry)',
        'Velvet and silk fabrics',
        'Brass and bronze hardware',
        'Marble surfaces',
        'Crystal and cut glass',
        'Fine china and porcelain',
        'Wool rugs',
        'Leather upholstery',
      ],
      characteristics: [
        'Formal and elegant atmosphere',
        'Rich color combinations',
        'Traditional patterns and motifs',
        'Quality antique pieces',
        'Layered textures',
        'Sophisticated lighting',
        'Balanced proportions',
        'Timeless appeal',
      ],
      furnitureRecommendations: [
        'Four-poster or sleigh beds',
        'Chesterfield sofas',
        'Wooden dining tables with carved details',
        'Wingback chairs',
        'Antique armoires',
        'Crystal chandeliers',
        'Persian or Oriental rugs',
        'Traditional bookcases',
      ],
      imageAsset: 'assets/images/classic_style.png',
    ),

    StyleType.minimalist: StyleInformation(
      styleType: StyleType.minimalist,
      title: 'Minimalist',
      description: 'Less is more - serene spaces with essential elements only',
      detailedDescription: 'Minimalist style embodies the philosophy that less is more. It focuses on essential elements, clean lines, and uncluttered spaces that promote calm and clarity. Every piece serves a purpose, and beauty is found in simplicity and functionality.',
      colorPalette: [
        StyleColor(name: 'Pure White', hexColor: '#FFFFFF', type: ColorType.primary),
        StyleColor(name: 'Light Grey', hexColor: '#D3D3D3', type: ColorType.secondary),
        StyleColor(name: 'Soft Beige', hexColor: '#F5F5DC', type: ColorType.neutral),
        StyleColor(name: 'Natural Wood', hexColor: '#DEB887', type: ColorType.accent),
        StyleColor(name: 'Off White', hexColor: '#FAF0E6', type: ColorType.neutral),
        StyleColor(name: 'Pale Grey', hexColor: '#E5E5E5', type: ColorType.secondary),
      ],
      designElements: [
        'Clean, straight lines',
        'Open spaces with minimal furniture',
        'Hidden storage solutions',
        'Natural light emphasis',
        'Monochromatic color schemes',
        'Simple geometric forms',
        'Unadorned surfaces',
        'Functional design focus',
      ],
      materials: [
        'Light woods (birch, pine)',
        'White or light-colored metals',
        'Natural stone',
        'Linen and cotton fabrics',
        'Concrete',
        'Glass',
        'Bamboo',
        'Matte finishes',
      ],
      characteristics: [
        'Extreme simplicity',
        'Clutter-free environments',
        'Neutral color palettes',
        'Multi-functional furniture',
        'Emphasis on space and light',
        'Quality over quantity',
        'Calm and serene atmosphere',
        'Essential items only',
      ],
      furnitureRecommendations: [
        'Platform beds with simple frames',
        'Modular seating systems',
        'Simple wooden dining tables',
        'Storage ottomans',
        'Wall-mounted shelving',
        'Simple pendant lights',
        'Neutral area rugs',
        'Multi-purpose furniture pieces',
      ],
      imageAsset: 'assets/images/minimalist_style.png',
    ),

    StyleType.bohemian: StyleInformation(
      styleType: StyleType.bohemian,
      title: 'Bohemian',
      description: 'Eclectic, colorful, and free-spirited with global influences',
      detailedDescription: 'Bohemian style celebrates creativity, individuality, and cultural diversity. It combines vibrant colors, mixed patterns, and eclectic furnishings from around the world to create spaces that feel lived-in, personal, and full of stories.',
      colorPalette: [
        StyleColor(name: 'Terracotta Orange', hexColor: '#E2725B', type: ColorType.primary),
        StyleColor(name: 'Deep Turquoise', hexColor: '#40E0D0', type: ColorType.primary),
        StyleColor(name: 'Rich Purple', hexColor: '#663399', type: ColorType.secondary),
        StyleColor(name: 'Warm Gold', hexColor: '#FFD700', type: ColorType.accent),
        StyleColor(name: 'Earthy Brown', hexColor: '#8B4513', type: ColorType.neutral),
        StyleColor(name: 'Coral Pink', hexColor: '#FF7F50', type: ColorType.accent),
      ],
      designElements: [
        'Mixed patterns and textures',
        'Layered textiles and rugs',
        'Global-inspired accessories',
        'Plants and natural elements',
        'Vintage and handmade items',
        'Warm, ambient lighting',
        'Eclectic art collections',
        'Comfortable, casual arrangements',
      ],
      materials: [
        'Rattan and wicker',
        'Macramé and woven textiles',
        'Reclaimed wood',
        'Brass and copper',
        'Natural fibers (jute, hemp)',
        'Ceramic and pottery',
        'Vintage metals',
        'Embroidered fabrics',
      ],
      characteristics: [
        'Eclectic mix of styles',
        'Vibrant color combinations',
        'Layered textures and patterns',
        'Personal and collected feel',
        'Comfortable and relaxed',
        'Global cultural influences',
        'Handmade and vintage pieces',
        'Creative and artistic expression',
      ],
      furnitureRecommendations: [
        'Low platform beds with textiles',
        'Floor cushions and poufs',
        'Vintage wooden tables',
        'Hanging chairs or swings',
        'Moroccan-style rugs',
        'Beaded or tasseled lighting',
        'Eclectic bookshelf displays',
        'Colorful upholstered seating',
      ],
      imageAsset: 'assets/images/bohemian_style.png',
    ),
  };

  /// Get style information for a specific style type
  static StyleInformation getStyleInformation(StyleType styleType) {
    return _styleInformation[styleType] ?? _styleInformation[StyleType.modern]!;
  }

  /// Get all available style information
  static Map<StyleType, StyleInformation> getAllStyleInformation() {
    return Map.from(_styleInformation);
  }

  /// Get color palette for a specific style
  static List<StyleColor> getColorPalette(StyleType styleType) {
    return _styleInformation[styleType]?.colorPalette ?? [];
  }

  /// Get design elements for a specific style
  static List<String> getDesignElements(StyleType styleType) {
    return _styleInformation[styleType]?.designElements ?? [];
  }

  /// Get recommended materials for a specific style
  static List<String> getMaterials(StyleType styleType) {
    return _styleInformation[styleType]?.materials ?? [];
  }
}
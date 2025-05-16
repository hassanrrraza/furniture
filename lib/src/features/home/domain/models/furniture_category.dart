enum FurnitureCategory {
  beds,
  chairs,
  sofa,
  lamps;

  // Helper to get a display-friendly name
  String get displayName {
    switch (this) {
      case FurnitureCategory.beds:
        return 'Beds';
      case FurnitureCategory.chairs:
        return 'Chairs';
      case FurnitureCategory.sofa:
        return 'Sofa';
      case FurnitureCategory.lamps:
        return 'Lamps';
      default:
        return name; // Fallback to the enum member name
    }
  }

  // Helper to get the string value for matching with FurnitureItem.category
  String get stringValue {
    return name;
  }
}

enum ItemCategory {
  medicine,
  food,
  supplies,
  equipment,
}

extension ItemCategoryX on ItemCategory {
  String get label {
    switch (this) {
      case ItemCategory.medicine:
        return 'Medicine';
      case ItemCategory.food:
        return 'Food';
      case ItemCategory.supplies:
        return 'Supplies';
      case ItemCategory.equipment:
        return 'Equipment';
    }
  }
}



String formatEnum(String enumName) {
 /* if (enumName == DrawerOptions.gharKaKhana.name) {
    return StringConstants.gharkakhanaLable;
  }*/
  String formattedPageName = enumName
      .replaceAllMapped(
        RegExp(r'[A-Z]'),
        (match) => ' ${match.group(0)}',
      )
      .trim();

// Capitalize the first letter of each word
  return formattedPageName
      .toLowerCase()
      .split(' ')
      .map((word) =>
          word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : '')
      .join(' ');
}

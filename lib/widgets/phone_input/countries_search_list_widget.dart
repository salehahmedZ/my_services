import '../../my_services.dart';
import 'country_model.dart';
import 'util.dart';

/// Creates a list of Countries with a search textfield.
class CountrySearchListWidget extends StatefulWidget {
  final List<Country> countries;
  final InputDecoration? searchBoxDecoration;
  final String? locale;
  final ScrollController? scrollController;
  final bool autoFocus;
  final bool showFlags;
  final bool useEmoji;
  final ValueChanged<Country>? onSelect;

  const CountrySearchListWidget(
    this.countries,
    this.locale, {
    Key? key,
    this.searchBoxDecoration,
    this.scrollController,
    this.showFlags = false,
    this.useEmoji = true,
    this.autoFocus = false,
    this.onSelect,
  }) : super(key: key);

  @override
  _CountrySearchListWidgetState createState() => _CountrySearchListWidgetState();
}

class _CountrySearchListWidgetState extends State<CountrySearchListWidget> {
  final TextEditingController _searchController = TextEditingController();
  late List<Country> filteredCountries;

  @override
  void initState() {
    filteredCountries = filterCountries();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// Returns [InputDecoration] of the search box
  InputDecoration getSearchBoxDecoration() {
    return widget.searchBoxDecoration ?? const InputDecoration(labelText: 'Search by country name or dial code');
  }

  /// Filters the list of Country by text from the search box.
  List<Country> filterCountries() {
    final value = _searchController.text.trim();

    if (value.isNotEmpty) {
      return widget.countries
          .where(
            (Country country) =>
                country.alpha3Code!.toLowerCase().startsWith(value.toLowerCase()) ||
                country.name!.toLowerCase().contains(value.toLowerCase()) ||
                getCountryName(country)!.toLowerCase().contains(value.toLowerCase()) ||
                country.dialCode!.contains(value.toLowerCase()),
          )
          .toList();
    }

    return widget.countries;
  }

  /// Returns the country name of a [Country]. if the locale is set and translation in available.
  /// returns the translated name.
  String? getCountryName(Country country) {
    if (widget.locale != null && country.nameTranslations != null) {
      String? translated = country.nameTranslations![widget.locale!];
      if (translated != null && translated.isNotEmpty) {
        return translated;
      }
    }
    return country.name;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 400,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          MyTextInput(
            controller: _searchController,
            textInputAction: TextInputAction.search,
            borderRadius: BorderRadius.zero,
            // border: InputBorder.none,
            margin: const EdgeInsets.only(top: 0, bottom: 5, left: 20, right: 20),
            prefixIcon: const Icon(iconSearch),
            labelText: getMyServicesLabels(context).searchByCountryNameOrDialCode,
            labelStyle: getTextTheme(context).caption?.copyWith(color: ServiceTheme.lightAccentColor),
            onChanged: (value) => setState(() => filteredCountries = filterCountries()),
          ),
          Flexible(
            child: ListView.builder(
              controller: widget.scrollController,
              shrinkWrap: true,
              itemCount: filteredCountries.length,
              itemBuilder: (BuildContext context, int index) {
                Country country = filteredCountries[index];
                return ListTile(
                  // leading: _Flag(country: country, useEmoji: widget.useEmoji),
                  title: RichText(
                    text: TextSpan(
                      text: Utils.generateFlagEmojiUnicode(country.alpha2Code ?? ''),
                      style: getTextTheme(context).headline6?.copyWith(height: .2),
                      children: [
                        const TextSpan(text: " "),
                        TextSpan(
                          text: getCountryName(country) ?? "",
                          style: getTextTheme(context).headline6?.copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  subtitle: Text(country.dialCode ?? ''),
                  onTap: () {
                    if (widget.onSelect != null) {
                      widget.onSelect!(country);
                    }
                    Navigator.of(context).pop(country);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}

class _Flag extends StatelessWidget {
  final Country? country;
  final bool? useEmoji;

  const _Flag({Key? key, this.country, this.useEmoji}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return country != null
        ? Container(
            color: Colors.red,
            width: 50,
            child: useEmoji!
                ? Text(
                    Utils.generateFlagEmojiUnicode(country?.alpha2Code ?? ''),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5?.copyWith(height: 1.3),
                  )
                : country?.flagUri != null
                    ? CircleAvatar(
                        backgroundImage: AssetImage(
                          country!.flagUri,
                          package: 'intl_phone_number_input',
                        ),
                      )
                    : const SizedBox.shrink(),
          )
        : const SizedBox.shrink();
  }
}
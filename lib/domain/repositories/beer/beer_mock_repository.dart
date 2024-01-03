import 'package:punk/domain/entities/amount.dart';
import 'package:punk/domain/entities/beer.dart';
import 'package:punk/domain/entities/hops.dart';
import 'package:punk/domain/entities/ingredient.dart';
import 'package:punk/domain/entities/malt.dart';
import 'package:punk/domain/entities/method.dart';
import 'package:punk/domain/entities/temperature.dart';
import 'package:punk/domain/entities/temperature_value.dart';
import 'package:punk/domain/entities/volume.dart';
import 'package:punk/domain/repositories/beer/beer_repository.dart';

class BeerMockRepository implements BeerRepository {
  @override
  Future<List<Beer>> fetchBeers(int page) async {    
    return [
      Beer(
        id: 1,
        name: 'Mock Beer 1',
        tagline: 'A Great Mock Beer',
        firstBrewed: 'First Brewed',
        description: 'Beer Description',
        imageUrl: 'https://cdn2.thecatapi.com/images/65o.jpg',
        abv: 5.0,
        ibu: 20.0,
        targetFg: 10.0,
        targetOg: 15.0,
        ebc: 30.0,
        srm: 40.0,
        ph: 4.5,
        attenuationLevel: 75.0,
        volume: Volume(value: 500.0, unit: 'ml'),
        boilVolume: Volume(value: 20.0, unit: 'l'),
        method: Method(
          mashTemp: [],
          fermentation: Temperature(temp: TemperatureValue(value: 20.0, unit: 'celsius')),
        ),
        ingredients: 
          Ingredient(
            malt: [
              Malt(name: 'Extra Pale', value: Amount(value: 5.3, unit: 'kilograms')),
            ],
            hops: [
              Hops(
                name: 'Ahtanum',
                amount: Amount(value: 17.5, unit: 'grams'),
                add: 'start',
                attribute: 'bitter',
              ),
              Hops(
                name: 'Chinook',
                amount: Amount(value: 15.0, unit: 'grams'),
                add: 'start',
                attribute: 'bitter',
              ),
            ],
            yeast: 'Wyeast 1056 - American Ale™',
          ),
        foodPairing: ['Food Pairing'],
        brewersTips: 'Brewers Tips',
        contributedBy: 'Contributed By',
      ),
      Beer(
        id: 2,
        name: 'Mock Beer 2',
        tagline: 'A Great Mock Beer',
        firstBrewed: 'First Brewed',
        description: 'Beer Description',
        imageUrl: 'https://cdn2.thecatapi.com/images/65o.jpg',
        abv: 5.0,
        ibu: 20.0,
        targetFg: 10.0,
        targetOg: 15.0,
        ebc: 30.0,
        srm: 40.0,
        ph: 4.5,
        attenuationLevel: 75.0,
        volume: Volume(value: 500.0, unit: 'ml'),
        boilVolume: Volume(value: 20.0, unit: 'l'),
        method: Method(
          mashTemp: [],
          fermentation: Temperature(temp: TemperatureValue(value: 20.0, unit: 'celsius')),
        ),
        ingredients: 
          Ingredient(
            malt: [
              Malt(name: 'Extra Pale', value: Amount(value: 5.3, unit: 'kilograms')),
            ],
            hops: [
              Hops(
                name: 'Ahtanum',
                amount: Amount(value: 17.5, unit: 'grams'),
                add: 'start',
                attribute: 'bitter',
              ),
              Hops(
                name: 'Chinook',
                amount: Amount(value: 15.0, unit: 'grams'),
                add: 'start',
                attribute: 'bitter',
              ),
            ],
            yeast: 'Wyeast 1056 - American Ale™',
          ),
        
        foodPairing: ['Food Pairing'],
        brewersTips: 'Brewers Tips',
        contributedBy: 'Contributed By',
      ),
      Beer(
        id: 3,
        name: 'Mock Beer 3',
        tagline: 'A Great Mock Beer',
        firstBrewed: 'First Brewed',
        description: 'Beer Description',
        imageUrl: 'https://cdn2.thecatapi.com/images/65o.jpg',
        abv: 5.0,
        ibu: 20.0,
        targetFg: 10.0,
        targetOg: 15.0,
        ebc: 30.0,
        srm: 40.0,
        ph: 4.5,
        attenuationLevel: 75.0,
        volume: Volume(value: 500.0, unit: 'ml'),
        boilVolume: Volume(value: 20.0, unit: 'l'),
        method: Method(
          mashTemp: [],
          fermentation: Temperature(temp: TemperatureValue(value: 20.0, unit: 'celsius')),
        ),
        ingredients: 
          Ingredient(
            malt: [
              Malt(name: 'Extra Pale', value: Amount(value: 5.3, unit: 'kilograms')),
            ],
            hops: [
              Hops(
                name: 'Ahtanum',
                amount: Amount(value: 17.5, unit: 'grams'),
                add: 'start',
                attribute: 'bitter',
              ),
              Hops(
                name: 'Chinook',
                amount: Amount(value: 15.0, unit: 'grams'),
                add: 'start',
                attribute: 'bitter',
              ),
            ],
            yeast: 'Wyeast 1056 - American Ale™',
          ),
        
        foodPairing: ['Food Pairing'],
        brewersTips: 'Brewers Tips',
        contributedBy: 'Contributed By',
      ),
    ];
  }
}

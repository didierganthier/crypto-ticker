//TODO: Add your imports here.

import 'dart:convert';

import 'package:http/http.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '5EB050DB-6A06-4B17-ACD1-8DC3E64F8C97';

class CoinData {

  static Future getCoinData(String selectedCurrency, String cryptoCurrency) async
  {
    Response response = await get('$coinAPIURL/$cryptoCurrency/$selectedCurrency?apikey=$apiKey');

    if(response.statusCode == 200)
    {
      String data = response.body;

      var coinData = jsonDecode(data);
      return coinData['rate'];
    }
    else
    {
      print(response.statusCode);
    }
  }
}

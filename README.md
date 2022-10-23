

## Flutter Medusa Package

![medusa flutter package](https://user-images.githubusercontent.com/47489894/196999514-cce76817-ccc6-4391-85cf-54214a5d96cc.gif)


## About

### Participants
<table>
<tr>
<td>Name</td>
<td>GitHub</td>
<td>Discord</td>
<td>Twitter</td>
</tr>
<thead>
</thead>
<thbody>
<tr>
<td>Karan</td>
<td><a href="https://github.com/karanjoshi" target="_blank">karanjoshi</td>
<td>karanj#4900</td>
<td><a href="https://twitter.com/KaranJoshiDev" target="_blank">KaranJoshiDev</a></td>
</tr>
<tr>
<td>Keval</td>
<td><a href="https://github.com/keval-makadiya" target="_blank">keval-makadiya</a></td>
<td>kevalm#1071</td>
<td><a href="https://twitter.com/kevalmakadiya" target="_blank">kevalmakadiya</a></td>
</tr>
<tr>
<td>Pankti</td>
<td><a href="https://github.com/Pankti910" target="_blank">Pankti910</a></td>
<td>pankti#2606</td>
<td><a href="https://twitter.com/ShahPankti2" target="_blank">ShahPankti2</a></td>
</tr>
<tr>
<td>Parth</td>
<td><a href="https://github.com/parth-asodariya" target="_blank">parth-asodariya</a></td>
<td>ParthA#1988</td>
<td><a href="https://twitter.com/p_asodariya" target="_blank">p_asodariya</a></td>
</tr>
<tr>
<td>Snehal</td>
<td><a href="https://github.com/Snehal-Singh174" target="_blank">Snehal-Singh174</a></td>
<td>Snehal#5419</td>
<td><a href="https://twitter.com/SnehalS_" target="_blank">SnehalS_</a></td>
</tr>

<thbody>

</table>

### Description

An open source ecommerce mobile application package built using Medusa and Flutter. It includes all APIs which are in store-front. 



## Set up Project

### Prerequisites
Before you start with the tutorial make sure you have

- [Flutter](https://flutter.dev/) 
- [Dart](https://dart.dev/get-dart) 
- [Medusa server](https://docs.medusajs.com/quickstart/quick-start/) v14 or greater installed on your machine


### Installation

Add Dependency of the package in your pubspec.yaml file:

```bash
medusa_flutter:
  path: 'PACKAGE_PATH'
```

### USAGE

Import Medusa as a default import and initiate it:


```dart
import 'package:medusa_flutter/medusa_flutter.dart';

var medusa = Medusa(Config(baseUrl: "MEDUSA_SERVER_URL"));

StoreProductsListRes? productsListRes = await medusa.products.list();
```

## Configuration

### Initialize with config object

```dart
var medusa = Medusa(
    Config(
        baseUrl: "MEDUSA_SERVER_URL"
    ),
  );
```


## Resources

- [Medusa’s GitHub repository](https://github.com/medusajs/medusa)
- [Medusa Documentation](https://docs.medusajs.com/)

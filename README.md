

lj_loadding_empty support loadding by loaddingdata status

## Features

lj_loadding_empty can load a animation in dataloadding status.

## Getting started

```dart
lj_loadding_empty: ^1.2.0
```

## Usage

引入方式

```dart
import 'package:lj_loadding_empty/lj_loadding_empty.dart';
```


loadding具体实现

```dart
Container(
  olor: Colors.green.withAlpha(100),
  width: 300,height: 500,
  child: const LoaddingView(),),
```


 却省图具体实现

```dart
SizedBox(height: 400,width: 300,child: EmptyView()),
```


## Additional information

lj_loadding_empty support loadding by loaddingdata status


loadding效果

<div style="width=40%;float:left;margin-right: 10px">
  <img src="./lib/assets/images/load.png">
</div>

却省图效果

<div style="width=40%;float:left;margin-right: 10px">
  <img src="./lib/assets/images/empty.png">
</div>
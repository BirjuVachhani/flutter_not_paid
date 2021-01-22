![Banner](https://raw.githubusercontent.com/BirjuVachhani/flutter_not_paid/main/banner.png)

# Not Paid - Flutter

[![Pub Version](https://img.shields.io/pub/v/not_paid)](https://pub.dev/packages/not_paid)
[![Starware](https://img.shields.io/badge/Starware-⭐-black?labelColor=f9b00d)](https://github.com/zepfietje/starware)

## Client did not pay?

Add opacity to the body tag and decrease it every day until their site completely fades away. Set a due date and customize the number of days you offer them until the website is fully vanished.

## Installation

Add this to your package's pubspec.yaml file:
```yaml
dependencies:
  flutter_not_paid: <latest_version>
```

## Usage

```dart
import 'package:flutter_not_paid/flutter_not_paid.dart';

NotPaid(
  deadline: 8,
  dueDate: DateTime(2020, 01, 28),
  enabled: true, // default: true
  showBanner: true, // default: true
  duration: Duration(seconds: 10), // default: 5 seconds
  directionality: TextDirection.ltr, // default: ltr
  child: MaterialApp(
    title: 'Flutter Not Paid Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: MyHomePage(title: 'Flutter Not Paid Home Page'),
  ),
  ...
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/BirjuVachhani/flutter_not_paid/issues
[docs]: https://pub.dev/documentation/flutter_not_paid/latest/


#### Liked what you saw?

Show some love and support by starring the [repository](https://github.com/birjuvachhani/flutter_not_paid).

Or You can

<a href="https://www.buymeacoffee.com/birjuvachhani" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-blue.png" alt="Buy Me A Coffee" style="height: 51px !important;width: 217px !important;" ></a>

## Author
Inspired from [klempa](https://github.com/kleampa)'s [not-paid](https://github.com/kleampa/not-paid)

by [Birju Vachhani](https://github.com/BirjuVachhani)

## Starware

Flutter Not Paid is Starware.
This means you're free to use the project, as long as you star its [GitHub repository](https://github.com/birjuvachhani/flutter_not_paid).
Your appreciation makes us grow and glow up. ⭐

## License

```
BSD 3-Clause License

Copyright (c) 2021, Birju Vachhani
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```

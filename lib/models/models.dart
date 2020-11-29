class Categories {
  List<String> categories = [
    'Samsung',
    'Apple',
    'huawei',
    'Xioami',
    'Vivo',
    'Sony',
    'Realme'
  ];
}

class Add {
  List<String> url = [
    'https://i.ytimg.com/vi/fwkwxbGdQaQ/maxresdefault.jpg',
    'https://i.ytimg.com/vi/DWRcNpR6Kdc/maxresdefault.jpg',
    'https://www.reviews.org/au/app/uploads/2020/10/iphone-12-price.jpg'
  ];
}

class Mark {
  final String markName;
  final String markLogo;

  Mark({this.markName, this.markLogo});
}

class BrandsList {
  final List<Mark> brands = [
    Mark(
        markName: 'Samsung',
        markLogo:
            'https://www.screenja.com/static/img/thumbs/logo-samsung-1-normal-636.png'),
    Mark(
        markName: 'Apple',
        markLogo:
            'https://lh3.googleusercontent.com/proxy/dr3WI8ByCEQ1d2eYnN41UINN4U79YwrYQXn8JdED0eKowzWLeXQ1WEypos1CXArx-aNB2CTtpQMo95mX-zddcVUMznL5EFepoarSAxqTLSe7GaqK45s4-A'),
    Mark(
        markName: 'Huawei',
        markLogo:
            'https://logos-world.net/wp-content/uploads/2020/04/Huawei-Logo-2006%E2%80%932018.png')
  ];
}

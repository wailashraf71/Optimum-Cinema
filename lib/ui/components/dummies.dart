List<String> slides = [
  'https://img2.iwascoding.com/0/paid/2018/10/15/C0/08847E20B2E3013633D2543D7EF8F2BE.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/71W2aEcrxxL._AC_SL1334_.jpg',
  'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F6%2F2019%2F10%2Flittle-women_3-2000.jpg'
];
List<String> slidesTitles = ['Wonder Woman', 'Tenet', 'Little Women'];
List<String> slidesDescription = [
  'Adventure, Action',
  'Sci-fi, MindBlowing',
  'Drama, Comedy'
];
List<Map<String, dynamic>> movies = [
  {
    'title': 'Enola Holmes',
    'image':
        'https://m.media-amazon.com/images/M/MV5BZjNkNzk0ZjEtM2M1ZC00MmMxLTlmOWEtNWRlZTc1ZTUyNzY4XkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_.jpg',
    'rate': 7.1
  },
  {
    'title': 'Old Guard',
    'image':
        'https://m.media-amazon.com/images/M/MV5BNDJiZDliZDAtMjc5Yy00MzVhLThkY2MtNDYwNTQ2ZTM5MDcxXkEyXkFqcGdeQXVyMDA4NzMyOA@@._V1_.jpg',
    'rate': 5.5
  },
  {
    'title': 'Solo: a star wars story',
    'image':
        'https://www.vintagemovieposters.co.uk/wp-content/uploads/2020/04/IMG_4036-2-scaled.jpeg',
    'rate': 6.3
  },
  {
    'title': 'The Dark Knight',
    'image':
        'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg',
    'rate': 8.3
  }
];

List<Map<String, dynamic>> series = [
  {
    'title': 'Emily in Paris',
    'image':
        'https://pyxis.nymag.com/v1/imgs/866/925/c4a41759330a68328cc8ba51bcd9d8865d-emily-in-paris.jpg',
    'seasons': 2,
    'episodes': 6,
  },
  {
    'title': 'The Witcher',
    'image':
        'https://img5.goodfon.com/wallpaper/nbig/3/c4/vedmak-the-witcher-henry-cavill-muzhchina-vzgliad-geroi.jpg',
    'seasons': 1,
    'episodes': 8,
  },
  {
    'title': 'The 100',
    'image':
        'https://cdn.videotapenews.com/wp-content/uploads/2020/09/47782420151229115645.jpg',
    'seasons': 8,
    'episodes': 57,
  },
];

List<Map<String, dynamic>> episodes = [
  {
    'title': 'A Kiss Is Just a Kiss',
    'image':
        'https://cdn.vox-cdn.com/thumbor/x7Tltwx2D3t_j_rWV5_cF-crobI=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/21929673/Screen_Shot_2020_10_02_at_10.56.47_AM.png',
    'season': 1,
    'number': 1,
    'seen': true
  },
  {
    'title': 'Masculin Féminin',
    'image':
        'https://i.insider.com/5f7e706c282c500018c7941d?width=1100&format=jpeg&auto=webp',
    'season': 1,
    'number': 2,
    'seen': true
  },
  {
    'title': 'Sexy or Sexist',
    'image':
        'https://goss.ie/shoolrez/2020/09/emily-in-paris-trailer-with-lily-collins.jpg',
    'season': 1,
    'number': 3,
    'seen': false
  },
  {
    'title': 'Faux Amis',
    'image':
        'https://occ-0-92-1723.1.nflxso.net/dnm/api/v6/9pS1daC2n6UGc3dUogvWIPMR_OU/AAAABRkSLlD9XGl-PnbkLLM6GeKJgdZx-DruJQ_Bb-rXPCL_P00xKrYzB1G9Q-PJxKd5GZIubE9sa3QS9MhNFqS7hiKHhhB6iuR6hWg0HIh1tTo34P4r.jpg?r=c2f',
    'season': 2,
    'number': 1,
    'seen': false
  },
];

List<Map<String, dynamic>> trailers = [
  {
    'title': 'Captain Marvel',
    'image':
        'https://www.inquirer.com/resizer/NUodX8Q297ejPLZLkPx0nhnxKnA=/1400x932/smart/arc-anglerfish-arc2-prod-pmn.s3.amazonaws.com/public/AHKHPPIADFH7RFY7YD7VC5TY4Q.jpg'
  },
  {
    'title': 'Sonic the Hedgehog',
    'image': 'https://pmcvariety.files.wordpress.com/2020/02/sonic-1.jpg'
  },
  {
    'title': 'Black Panther',
    'image':
        'https://www.leftoye.com/wp-content/uploads/2020/08/Chadwick-Boseman-Black-Panther-2-1200x676.jpg'
  }
];

List<Map<String, dynamic>> categories = [
  {
    'title': 'Action',
    'image':
        'https://www.indiewire.com/wp-content/uploads/2016/03/batman-v-superman-7.jpg?w=640',
  },
  {
    'title': 'Comedy',
    'image':
        'https://www.osn.com/getattachment/watch/hot-topics/osn-blogs/May-2018/Laugh-out-loud-with-our-top-comedy-movies/ted.jpg.aspx',
  },
  {
    'title': 'Drama',
    'image':
        'https://img.buzzfeed.com/buzzfeed-static/static/2019-01/14/16/asset/buzzfeed-prod-web-04/sub-buzz-32476-1547500807-1.png?downsize=700%3A%2A&output-quality=auto&output-format=auto&output-quality=auto&output-format=auto&downsize=360:*',
  },
  {
    'title': 'Horror',
    'image':
        'https://pmcvariety.files.wordpress.com/2017/01/resident-evil-the-final-chapter-e1495389027166.jpeg?crop=0px%2C24px%2C1024px%2C570px&resize=681%2C383',
  }
];

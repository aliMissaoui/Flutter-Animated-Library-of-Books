class Book {
  final String title;
  final String author;
  final String image;
  final String fpage;

  const Book(
      {required this.title,
      required this.author,
      required this.image,
      required this.fpage});
}

const _bookAppAsset = 'assets/images';
const bookAppAssetBackground = '$_bookAppAsset/bg.png';

const books = [
  Book(
      title: 'Gulliver\'s Travels',
      author: 'Jonathan Swift',
      image: '$_bookAppAsset/book1.png',
      fpage: '$_bookAppAsset/fpage.png'),
  Book(
      title: 'The Waking that kills',
      author: 'Stephen Gregory',
      image: '$_bookAppAsset/book2.png',
      fpage: '$_bookAppAsset/fpage2.png'),
  Book(
      title: 'Enemy',
      author: 'Jake Gyllenhaal',
      image: '$_bookAppAsset/book3.png',
      fpage: '$_bookAppAsset/fpage3.png'),
  Book(
      title: 'Dracula',
      author: 'Bram Stoker\'s',
      image: '$_bookAppAsset/book4.png',
      fpage: '$_bookAppAsset/fpage4.png'),
  Book(
      title: 'A Song for No Man\'s Land',
      author: 'Andy Remic',
      image: '$_bookAppAsset/book5.png',
      fpage: '$_bookAppAsset/fpage5.png'),
  Book(
      title: 'The Invisible Man',
      author: 'Carl Laemmle',
      image: '$_bookAppAsset/book6.png',
      fpage: '$_bookAppAsset/fpage.png'),
  Book(
      title: 'Oathbringer',
      author: 'Brandon Sanderson',
      image: '$_bookAppAsset/book7.png',
      fpage: '$_bookAppAsset/fpage2.png'),
  Book(
      title: 'The Assassin of Truth',
      author: 'Lucina Reine',
      image: '$_bookAppAsset/book8.png',
      fpage: '$_bookAppAsset/fpage3.png'),
  Book(
      title: 'Two Lives One Girl',
      author: 'Madelyn Forr',
      image: '$_bookAppAsset/book9.png',
      fpage: '$_bookAppAsset/fpage4.png'),
  Book(
      title: 'Reverr',
      author: 'Brad Lucc',
      image: '$_bookAppAsset/book10.png',
      fpage: '$_bookAppAsset/fpage5.png'),
];

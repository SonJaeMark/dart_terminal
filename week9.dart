class Song {
  String? _title;
  int? _releaseDate;
  bool? _isFavorite;
  String? _artist;
  List<Song> _songList = [];


  Song({this._title, this._releaseDate, this._isFavorite, this._artist});


  List<Song> createSongList(Song song) {
    _songList.add(song);
    return _songList;
  }


  void removeSong(Song song) {
    _songList.remove(song);
  }


  void playSong(Song song) {
    print('Playing ${song.getTitle()} by ${song.getArtist()}');
  }


  void playAllSongs() {
    for (var song in _songList) {
      playSong(song);
    }
  }


  void setTitle(String title) {
    this._title = title;
  }


  void setReleaseDate(int releaseDate) {
    this._releaseDate = releaseDate;
  }


  void setIsFavorite(bool isFavorite) {
    this._isFavorite = isFavorite;
  }


  void setArtist(String artist) {
    this._artist = artist;
  }


  String? getTitle() {
    return _title;
  }


  int? getReleaseDate() {
    return _releaseDate;
  }


  bool? getIsFavorite() {
    return _isFavorite;
  }


  String? getArtist() {
    return _artist;
  }


}


void main() {
  Song song1 = Song(title: 'Ako ang Bagyo', releaseDate: 2026, isFavorite: true, artist: 'Shean');
  Song song2 = Song(title: 'Lifetime(reimagined)', releaseDate: 2026, isFavorite: false, artist: 'Ben&Ben');


  song1.createSongList(song1);
  song1.createSongList(song2);


  song1.playAllSongs();
}

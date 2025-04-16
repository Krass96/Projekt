class ArtistGalleryViewModel {
  int activeIndex = 0;

  void next(int itemCount) {
    activeIndex = (activeIndex + 1) % itemCount;
  }

  void previous(int itemCount) {
    activeIndex = (activeIndex - 1 + itemCount) % itemCount;
  }
}

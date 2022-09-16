export default class LoadImages {
  city = new Image();
  cityRubble = new Image();
  cityOnFire = new Array(12);
  backgroundFrames = new Array(24);
  cannonBase = new Image();
  cannonWheel = new Image();
  cannonBarrel = new Image();

  constructor() {
    this.load();
  }

  load() {
    this.city.src = 'assets/images/city/city1.png';
    this.cityRubble.src = 'assets/images/cityRubble.png';
    this.loadImageArray(this.cityOnFire, 'assets/images/city/city', '.png');

    // Background images created by domil123456.
    // From: https://dynamicwallpaper.club/wallpaper/72omz5ynq4
    this.loadImageArray(
      this.backgroundFrames,
      'assets/images/background/affinitywallpaper-',
      '.png',
    );
    this.cannonBase.src = 'assets/images/cannon/cannonBase.png';
    this.cannonWheel.src = 'assets/images/cannon/cannonWheel.png';
    this.cannonBarrel.src = 'assets/images/cannon/cannonBarrel.png';
  }

  // Creates and loads an array of background images
  loadImageArray(array, src, extension) {
    for (let i = 0; i < array.length; i++) {
      const img = new Image();
      img.src = `${src}${i + 1}${extension}`;
      array[i] = img;
    }
  }
}

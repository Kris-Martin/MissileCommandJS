export default class City {
  city = new Image();
  cityRubble = new Image();
  cityOnFire = new Array(12);
  frame = 0;

  healthMax = 256;
  health = this.healthMax;
  isAlive = true;

  width = 80;
  height = 40;

  // Value needed to adjust position of rubble inline with city.
  rubblePosY = 5;

  xPos;
  yPos;

  constructor(xPos, yPos) {
    this.load();
    this.xPos = xPos - this.width / 2;
    this.yPos = yPos - this.height - 5; // height - ground height/3
  }

  load() {
    this.city.src = 'assets/images/city/city1.png';
    this.cityRubble.src = 'assets/images/cityRubble.png';

    for (let i = 0; i < this.cityOnFire.length; i++) {
      const img = new Image();
      img.src = `assets/images/city/city${i + 1}.png`;
    }
  }

  draw(ctx) {
    if (!this.isAlive) {
      this.yPos += this.rubblePosY;
    }
    ctx.drawImage(this.city, this.xPos, this.yPos, this.width, this.height);
  }
}
